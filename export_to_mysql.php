<?php

/**
 * Export SQLite database to MySQL-compatible SQL
 * 
 * This script exports schema and data from SQLite and converts it
 * to MySQL-compatible format.
 */

$sqlitePath = __DIR__ . '/database/database.sqlite';
$outputPath = __DIR__ . '/mysql_export.sql';

if (!file_exists($sqlitePath)) {
    die("SQLite database not found at: {$sqlitePath}\n");
}

// Open SQLite database
$db = new PDO("sqlite:{$sqlitePath}");
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$output = [];
$output[] = "-- MySQL Export from SQLite";
$output[] = "-- Generated: " . date('Y-m-d H:i:s');
$output[] = "";
$output[] = "SET FOREIGN_KEY_CHECKS = 0;";
$output[] = "SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';";
$output[] = "SET time_zone = '+00:00';";
$output[] = "";

// Get all tables
$tables = $db->query("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' ORDER BY name")->fetchAll(PDO::FETCH_COLUMN);

$alterStatements = [];

// Export schema for each table
foreach ($tables as $table) {
    $output[] = "-- --------------------------------------------------------";
    $output[] = "-- Table structure for table `{$table}`";
    $output[] = "-- --------------------------------------------------------";
    $output[] = "";
    $output[] = "DROP TABLE IF EXISTS `{$table}`;";
    $output[] = "";
    
    // Get CREATE TABLE statement from SQLite
    $createTable = $db->query("SELECT sql FROM sqlite_master WHERE type='table' AND name='{$table}'")->fetchColumn();
    
    if ($createTable) {
        // Convert SQLite syntax to MySQL syntax and extract foreign keys
        list($mysqlCreate, $fks) = convertSqliteToMysql($createTable, $table);
        $output[] = $mysqlCreate . ";";
        $output[] = "";
        
        // Store foreign key ALTER statements
        foreach ($fks as $fk) {
            $alterStatements[] = $fk;
        }
    }
}

// Add foreign key constraints after all tables are created
if (count($alterStatements) > 0) {
    $output[] = "-- --------------------------------------------------------";
    $output[] = "-- Foreign key constraints";
    $output[] = "-- --------------------------------------------------------";
    $output[] = "";
    foreach ($alterStatements as $alter) {
        $output[] = $alter;
    }
    $output[] = "";
}

// Export data for each table
foreach ($tables as $table) {
    $output[] = "-- --------------------------------------------------------";
    $output[] = "-- Dumping data for table `{$table}`";
    $output[] = "-- --------------------------------------------------------";
    $output[] = "";
    
    $rows = $db->query("SELECT * FROM `{$table}`")->fetchAll(PDO::FETCH_ASSOC);
    
    if (count($rows) > 0) {
        $columns = array_keys($rows[0]);
        $columnList = '`' . implode('`, `', $columns) . '`';
        
        $output[] = "INSERT INTO `{$table}` ({$columnList}) VALUES";
        
        $values = [];
        foreach ($rows as $row) {
            $rowValues = [];
            foreach ($row as $value) {
                if ($value === null) {
                    $rowValues[] = 'NULL';
                } elseif (is_numeric($value)) {
                    $rowValues[] = $value;
                } else {
                    // Escape single quotes and backslashes
                    $escaped = str_replace(['\\', "'"], ['\\\\', "\\'"], $value);
                    $rowValues[] = "'{$escaped}'";
                }
            }
            $values[] = "(" . implode(", ", $rowValues) . ")";
        }
        
        $output[] = implode(",\n", $values) . ";";
        $output[] = "";
    }
}

$output[] = "SET FOREIGN_KEY_CHECKS = 1;";
$output[] = "";

// Write to file
file_put_contents($outputPath, implode("\n", $output));

echo "Export completed successfully!\n";
echo "Output file: {$outputPath}\n";
echo "Tables exported: " . count($tables) . "\n";

/**
 * Convert SQLite CREATE TABLE syntax to MySQL syntax
 * Returns array: [mysql_create_statement, array_of_foreign_key_alter_statements]
 */
function convertSqliteToMysql($sqliteSql, $tableName) {
    $mysqlSql = $sqliteSql;
    $foreignKeys = [];
    
    // Replace double quotes with backticks for MySQL
    $mysqlSql = preg_replace('/"([^"]+)"/', '`$1`', $mysqlSql);
    
    // Extract foreign key constraints before removing them
    if (preg_match_all('/,\s*foreign\s+key\s*\(`([^`]+)`\)\s*references\s+`([^`]+)`\s*\(`([^`]+)`\)\s*(?:ON\s+DELETE\s+(SET\s+NULL|CASCADE|RESTRICT|SET\s+DEFAULT|\w+))?/i', $mysqlSql, $fkMatches, PREG_SET_ORDER)) {
        foreach ($fkMatches as $fkMatch) {
            $fkColumn = $fkMatch[1];
            $refTable = $fkMatch[2];
            $refColumn = $fkMatch[3];
            $onDeleteRaw = isset($fkMatch[4]) ? trim($fkMatch[4]) : '';
            
            // Handle ON DELETE action properly
            if (stripos($onDeleteRaw, 'SET NULL') !== false) {
                $onDelete = 'SET NULL';
            } elseif (stripos($onDeleteRaw, 'CASCADE') !== false) {
                $onDelete = 'CASCADE';
            } elseif (stripos($onDeleteRaw, 'RESTRICT') !== false) {
                $onDelete = 'RESTRICT';
            } elseif (stripos($onDeleteRaw, 'SET DEFAULT') !== false) {
                $onDelete = 'SET DEFAULT';
            } else {
                $onDelete = 'RESTRICT';
            }
            
            // Fix foreign key column type to match referenced column (usually BIGINT UNSIGNED)
            // Match integer as whole word (not INT which could be part of INTEGER)
            // This must happen BEFORE converting integer to INT
            if (preg_match('/`' . preg_quote($fkColumn, '/') . '`\s+\binteger\b(\s+(?:null|not\s+null))?/i', $mysqlSql, $typeMatch)) {
                $nullClause = isset($typeMatch[1]) ? $typeMatch[1] : '';
                $mysqlSql = preg_replace('/`' . preg_quote($fkColumn, '/') . '`\s+\binteger\b(\s+(?:null|not\s+null))?/i', '`' . $fkColumn . '` BIGINT UNSIGNED' . $nullClause, $mysqlSql);
            }
            
            // Create ALTER TABLE statement for foreign key
            $constraintName = "fk_{$tableName}_{$fkColumn}";
            $foreignKeys[] = "ALTER TABLE `{$tableName}` ADD CONSTRAINT `{$constraintName}` FOREIGN KEY (`{$fkColumn}`) REFERENCES `{$refTable}` (`{$refColumn}`) ON DELETE {$onDelete};";
        }
        
        // Remove foreign key definitions from CREATE TABLE (match the full pattern including ON DELETE)
        $mysqlSql = preg_replace('/,\s*foreign\s+key\s*\(`[^`]+`\)\s*references\s+`[^`]+`\s*\(`[^`]+`\)\s*(?:ON\s+DELETE\s+(?:SET\s+NULL|CASCADE|RESTRICT|SET\s+DEFAULT|\w+))?/i', '', $mysqlSql);
    }
    
    // Convert INTEGER PRIMARY KEY AUTOINCREMENT to BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY
    $mysqlSql = preg_replace('/`(\w+)`\s+INTEGER\s+PRIMARY\s+KEY\s+AUTOINCREMENT/i', '`$1` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY', $mysqlSql);
    
    // Convert INTEGER PRIMARY KEY (without AUTOINCREMENT) to BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY
    $mysqlSql = preg_replace('/`(\w+)`\s+INTEGER\s+PRIMARY\s+KEY(?!\s+AUTO_INCREMENT)/i', '`$1` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY', $mysqlSql);
    
    // Convert AUTOINCREMENT to AUTO_INCREMENT (standalone)
    $mysqlSql = preg_replace('/\bAUTOINCREMENT\b/i', 'AUTO_INCREMENT', $mysqlSql);
    
    // Fix duplicate AUTO_INCREMENT (if we already added it)
    $mysqlSql = preg_replace('/AUTO_INCREMENT\s+PRIMARY\s+KEY\s+AUTO_INCREMENT/i', 'AUTO_INCREMENT PRIMARY KEY', $mysqlSql);
    
    // Convert VARCHAR without length to VARCHAR(255)
    $mysqlSql = preg_replace('/\bvarchar\b(?!\s*\()/i', 'VARCHAR(255)', $mysqlSql);
    
    // Convert BLOB to LONGBLOB
    $mysqlSql = preg_replace('/\bBLOB\b/i', 'LONGBLOB', $mysqlSql);
    
    // Convert datetime to DATETIME (MySQL compatible)
    $mysqlSql = preg_replace('/\bdatetime\b/i', 'DATETIME', $mysqlSql);
    
    // Convert datetime() default to CURRENT_TIMESTAMP
    $mysqlSql = preg_replace("/DEFAULT\s+datetime\(['\"]?now\(\)['\"]?\)/i", "DEFAULT CURRENT_TIMESTAMP", $mysqlSql);
    $mysqlSql = preg_replace("/DEFAULT\s+datetime\('now'\)/i", "DEFAULT CURRENT_TIMESTAMP", $mysqlSql);
    
    // Convert integer to INT (but not INTEGER PRIMARY KEY which we already handled)
    $mysqlSql = preg_replace('/\binteger\b(?!\s+PRIMARY)/i', 'INT', $mysqlSql);
    
    // Convert tinyint(1) to TINYINT(1) (already correct, just ensure case)
    $mysqlSql = preg_replace('/\btinyint\(1\)/i', 'TINYINT(1)', $mysqlSql);
    
    // Fix CHECK constraints - convert to ENUM for better MySQL compatibility
    // Pattern: column VARCHAR CHECK (column IN ('val1', 'val2', ...))
    // This handles inline CHECK constraints that MySQL may not parse correctly
    $mysqlSql = preg_replace_callback(
        '/`(\w+)`\s+VARCHAR\(255\)\s+CHECK\s+\(`\1`\s+IN\s+\(([^)]+)\)\)/i',
        function($matches) {
            $columnName = $matches[1];
            $values = $matches[2];
            // Extract and clean enum values
            preg_match_all('/[\'"]([^\'"]+)[\'"]/', $values, $valueMatches);
            $enumValues = "'" . implode("', '", $valueMatches[1]) . "'";
            return "`{$columnName}` ENUM({$enumValues})";
        },
        $mysqlSql
    );
    
    // Also handle CHECK constraints that might be on other column types
    $mysqlSql = preg_replace_callback(
        '/`(\w+)`\s+(\w+(?:\([^)]+\))?)\s+CHECK\s+\(`\1`\s+IN\s+\(([^)]+)\)\)/i',
        function($matches) {
            $columnName = $matches[1];
            $columnType = $matches[2];
            $values = $matches[3];
            // Only convert if it's a VARCHAR or similar text type
            if (stripos($columnType, 'VARCHAR') !== false || stripos($columnType, 'TEXT') !== false) {
                preg_match_all('/[\'"]([^\'"]+)[\'"]/', $values, $valueMatches);
                $enumValues = "'" . implode("', '", $valueMatches[1]) . "'";
                return "`{$columnName}` ENUM({$enumValues})";
            }
            // Otherwise keep as CHECK constraint (MySQL 8.0+)
            return $matches[0];
        },
        $mysqlSql
    );
    
    // Fix default values with parentheses
    $mysqlSql = preg_replace("/default\s+\(['\"]?([^'\"]+)['\"]?\)/i", "DEFAULT '$1'", $mysqlSql);
    
    // Add ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci at the end
    if (!preg_match('/ENGINE=/i', $mysqlSql)) {
        $mysqlSql = rtrim($mysqlSql, ';');
        $mysqlSql .= " ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci";
    }
    
    return [$mysqlSql, $foreignKeys];
}

