<?php

namespace Database\Seeders;

use App\Models\Page;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class PageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $pages = [
            [
                'title' => 'Über uns',
                'slug' => 'uberuns',
                'file' => 'uberuns.html',
            ],
            [
                'title' => 'Geschichte',
                'slug' => 'geschichte',
                'file' => 'geschichte.html',
            ],
            [
                'title' => 'Unterschlupf',
                'slug' => 'unterschlupf',
                'file' => 'unterschlupf.html',
            ],
            [
                'title' => 'Festschrift',
                'slug' => 'festschrift',
                'file' => 'festschrift.html',
            ],
            [
                'title' => 'Stiftungsfest Fechsung',
                'slug' => 'sffechsung',
                'file' => 'sffechsung.html',
            ],
            [
                'title' => 'Krystallinen',
                'slug' => 'krystallinen',
                'file' => 'krystallinen.html',
            ],
            [
                'title' => 'Stammbaum',
                'slug' => 'stammbaum',
                'file' => 'stammbaum.html',
            ],
            [
                'title' => 'Sassenschaft',
                'slug' => 'sassenschaft',
                'file' => 'privat/sassenschaft.html',
            ],
            [
                'title' => 'Unsere Stadt',
                'slug' => 'unserestadt',
                'file' => 'unserestadt.html',
            ],
            [
                'title' => 'Sippungsfolge',
                'slug' => 'sippungsfolge',
                'file' => 'sippungsfolge.html',
            ],
        ];
        
        foreach ($pages as $pageData) {
            $filePath = base_path('static-site/' . $pageData['file']);
            
            $content = '';
            if (File::exists($filePath)) {
                $html = File::get($filePath);
                // Extract content from body, remove scripts and navigation
                $html = html_entity_decode($html, ENT_QUOTES | ENT_HTML5, 'UTF-8');
                
                // Extract main content area - handle nested divs properly
                // Skip header, footer, and wrapper divs that are in the layout
                $contentIds = ['uscontent', 'spfcontent', 'sassencontent', 'stcontent', 'upd1', 'krycontent', 'ulcontent', 'gcontent', 'htxt', 'himg1', 'himg2', 'fecontent'];
                $contentFound = false;
                
                // Try to find the specific content div for this page
                $expectedContentId = match($pageData['slug']) {
                    'stammbaum' => 'stcontent',
                    'uberuns' => 'upd1',
                    'unterschlupf' => 'upd1',
                    'unserestadt' => 'uscontent',
                    'sassenschaft' => 'sassencontent',
                    'sippungsfolge' => 'spfcontent',
                    'krystallinen' => 'krycontent',
                    'festschrift' => 'ulcontent',
                    'sffechsung' => 'krycontent',
                    'geschichte' => 'gcontent',
                    default => null
                };
                
                if ($expectedContentId) {
                    // Try to extract content div with proper nesting handling
                    // Look for the content div inside the body, but skip header/footer
                    if (preg_match('/<div[^>]*id="' . preg_quote($expectedContentId, '/') . '"[^>]*>(.*)/is', $html, $startMatch)) {
                        $remaining = $startMatch[1];
                        // Find the matching closing div by counting depth
                        $depth = 1;
                        $pos = 0;
                        $length = strlen($remaining);
                        while ($pos < $length && $depth > 0) {
                            if (preg_match('/<div[^>]*>/i', $remaining, $m, PREG_OFFSET_CAPTURE, $pos)) {
                                $pos = $m[0][1] + strlen($m[0][0]);
                                $depth++;
                            } elseif (preg_match('/<\/div>/i', $remaining, $m, PREG_OFFSET_CAPTURE, $pos)) {
                                $pos = $m[0][1] + strlen($m[0][0]);
                                $depth--;
                                if ($depth === 0) {
                                    $content = substr($remaining, 0, $m[0][1]);
                                    $contentFound = true;
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                    }
                }
                
                // Fallback: try all content IDs
                if (!$contentFound) {
                    foreach ($contentIds as $contentId) {
                        if (preg_match('/<div[^>]*id="' . preg_quote($contentId, '/') . '"[^>]*>(.*)/is', $html, $startMatch)) {
                            $remaining = $startMatch[1];
                            $depth = 1;
                            $pos = 0;
                            $length = strlen($remaining);
                            while ($pos < $length && $depth > 0) {
                                if (preg_match('/<div[^>]*>/i', $remaining, $m, PREG_OFFSET_CAPTURE, $pos)) {
                                    $pos = $m[0][1] + strlen($m[0][0]);
                                    $depth++;
                                } elseif (preg_match('/<\/div>/i', $remaining, $m, PREG_OFFSET_CAPTURE, $pos)) {
                                    $pos = $m[0][1] + strlen($m[0][0]);
                                    $depth--;
                                    if ($depth === 0) {
                                        $content = substr($remaining, 0, $m[0][1]);
                                        $contentFound = true;
                                        break 2;
                                    }
                                } else {
                                    break;
                                }
                            }
                        }
                    }
                }
                
                if (!$contentFound) {
                    // Final fallback: extract body content but remove header/footer
                    if (preg_match('/<body[^>]*>(.*?)<\/body>/is', $html, $bodyMatch)) {
                        $bodyContent = $bodyMatch[1];
                        // Remove header div and all its contents
                        $bodyContent = preg_replace('/<div[^>]*id="hd"[^>]*>.*?<\/div>\s*<\/div>/is', '', $bodyContent);
                        // Remove footer div and all its contents
                        $bodyContent = preg_replace('/<div[^>]*id="ft"[^>]*>.*?<\/div>\s*<\/div>/is', '', $bodyContent);
                        // Remove wrapper divs (doc3, bd, yui-main, yui-b, yui-g) - match opening and closing
                        $bodyContent = preg_replace('/<div[^>]*id="doc3"[^>]*>/i', '', $bodyContent);
                        $bodyContent = preg_replace('/<div[^>]*id="bd"[^>]*>/i', '', $bodyContent);
                        $bodyContent = preg_replace('/<div[^>]*id="yui-main"[^>]*>/i', '', $bodyContent);
                        $bodyContent = preg_replace('/<div[^>]*class="yui-b"[^>]*>/i', '', $bodyContent);
                        $bodyContent = preg_replace('/<div[^>]*class="yui-g"[^>]*>/i', '', $bodyContent);
                        // Remove closing divs for wrappers
                        $bodyContent = preg_replace('/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/i', '', $bodyContent);
                        // Remove header elements (owlleft, owlright, title)
                        $bodyContent = preg_replace('/<div[^>]*id="(?:owlleft|owlright|title)"[^>]*>.*?<\/div>/is', '', $bodyContent);
                        // Remove scripts
                        $bodyContent = preg_replace('/<script[^>]*>.*?<\/script>/is', '', $bodyContent);
                        $content = trim($bodyContent);
                    }
                }
                
                // Clean up any remaining header/footer elements that might have been extracted
                if ($content) {
                    // Remove any header divs
                    $content = preg_replace('/<div[^>]*id="hd"[^>]*>.*?<\/div>\s*<\/div>/is', '', $content);
                    // Remove any footer divs
                    $content = preg_replace('/<div[^>]*id="ft"[^>]*>.*?<\/div>\s*<\/div>/is', '', $content);
                    // Remove footer content (hr, arrai.com link, trademark text)
                    $content = preg_replace('/<hr[^>]*>\s*<a[^>]*arrai\.com.*?<\/a>/is', '', $content);
                    $content = preg_replace('/<p[^>]*class=["\']spf4["\'][^>]*>.*?Schlaraffia.*?<\/p>/is', '', $content);
                    $content = preg_replace('/Schlaraffia.*?Bern.*?<\/p>/is', '', $content);
                    // Remove header elements
                    $content = preg_replace('/<div[^>]*id="(?:owlleft|owlright|title)"[^>]*>.*?<\/div>/is', '', $content);
                    // Remove wrapper divs
                    $content = preg_replace('/<div[^>]*id="(?:doc3|bd|yui-main)"[^>]*>/i', '', $content);
                    $content = preg_replace('/<div[^>]*class="(?:yui-b|yui-g)"[^>]*>/i', '', $content);
                    
                    // Strip the outer content div wrapper if it exists (the view will add it back)
                    // Match div with id or class matching the expected content ID
                    if ($expectedContentId) {
                        // Try to match div with id="expectedContentId" at the start
                        if (preg_match('/^<div[^>]*id="' . preg_quote($expectedContentId, '/') . '"[^>]*>(.*)<\/div>\s*$/is', $content, $divMatch)) {
                            $content = trim($divMatch[1]);
                        }
                        // Try to match div with id="expectedContentId" without requiring end anchor (in case of trailing whitespace)
                        elseif (preg_match('/^<div[^>]*id="' . preg_quote($expectedContentId, '/') . '"[^>]*>(.*)<\/div>/is', $content, $divMatch)) {
                            // Check if this is the outermost div by counting remaining divs
                            $inner = trim($divMatch[1]);
                            $remaining = substr($content, strlen($divMatch[0]));
                            // If there are no more divs after this one, it's the wrapper
                            if (!preg_match('/<\/div>/', $remaining)) {
                                $content = $inner;
                            }
                        }
                        // Try to match div with class="expectedContentId"
                        elseif (preg_match('/^<div[^>]*class="' . preg_quote($expectedContentId, '/') . '"[^>]*>(.*)<\/div>\s*$/is', $content, $divMatch)) {
                            $content = trim($divMatch[1]);
                        }
                        // Try to match div with class containing expectedContentId (for cases like "stcontent")
                        elseif (preg_match('/^<div[^>]*class="[^"]*' . preg_quote($expectedContentId, '/') . '[^"]*"[^>]*>(.*)<\/div>\s*$/is', $content, $divMatch)) {
                            $content = trim($divMatch[1]);
                        }
                    }
                    
                    $content = trim($content);
                }
            }
            
            // Replace image and PDF paths with Storage URLs
            if ($content) {
                // Replace image src paths (handle ./images/ and images/)
                $content = preg_replace_callback('/src="([^"]*(?:\.\/)?images\/([^"]+))"/i', function($matches) {
                    $originalPath = str_replace('./', '', $matches[1]);
                    $filename = $matches[2];
                    $storagePath = 'images/' . $filename;
                    
                    // Copy file to storage if it exists
                    $sourcePath = base_path('static-site/' . $originalPath);
                    if (file_exists($sourcePath)) {
                        Storage::disk('public')->put($storagePath, File::get($sourcePath));
                    }
                    
                    return 'src="' . Storage::url($storagePath) . '"';
                }, $content);
                
                // Replace PDF href paths (handle ./pdf/ and pdf/)
                $content = preg_replace_callback('/href="([^"]*(?:\.\/)?pdf\/([^"]+))"/i', function($matches) {
                    $originalPath = str_replace('./', '', $matches[1]);
                    $filename = $matches[2];
                    $storagePath = 'pdf/' . $filename;
                    
                    // Copy file to storage if it exists
                    $sourcePath = base_path('static-site/' . $originalPath);
                    if (file_exists($sourcePath)) {
                        Storage::disk('public')->put($storagePath, File::get($sourcePath));
                    }
                    
                    return 'href="' . Storage::url($storagePath) . '"';
                }, $content);
                
                // Replace privat/*.jpg paths (handle ./privat/ and privat/)
                $content = preg_replace_callback('/href="([^"]*(?:\.\/)?privat\/([^"]+))"/i', function($matches) {
                    $originalPath = str_replace('./', '', $matches[1]);
                    $filename = $matches[2];
                    $storagePath = 'privat/' . $filename;
                    
                    // Copy file to storage if it exists
                    $sourcePath = base_path('static-site/' . $originalPath);
                    if (file_exists($sourcePath)) {
                        Storage::disk('public')->put($storagePath, File::get($sourcePath));
                    }
                    
                    return 'href="' . Storage::url($storagePath) . '"';
                }, $content);
                
                // Add hover effects to stammbaum image map areas with valid links
                if ($pageData['slug'] === 'stammbaum') {
                    // Find all area elements with valid links and add inline event handlers
                    $content = preg_replace_callback(
                        '/<area\s+([^>]*href="([^"]+)"[^>]*)>/i',
                        function($matches) {
                            $fullArea = $matches[0];
                            $attributes = $matches[1];
                            $href = $matches[2];
                            
                            // Only add handlers for valid links (not # or empty)
                            if ($href && $href !== '#' && trim($href) !== '') {
                                // Add onmouseover and onmouseout handlers if they don't already exist
                                if (strpos($fullArea, 'onmouseover') === false) {
                                    $fullArea = str_replace(
                                        '>',
                                        ' onmouseover="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.add(\'hover-effect\')" onmouseout="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.remove(\'hover-effect\')">',
                                        $fullArea
                                    );
                                }
                            }
                            
                            return $fullArea;
                        },
                        $content
                    );
                }
            }
            
            Page::updateOrCreate(
                ['slug' => $pageData['slug']],
                [
                    'title' => $pageData['title'],
                    'content' => $content ?: '<div id="' . ($pageData['slug'] === 'unserestadt' ? 'uscontent' : 'content') . '"><p>Content will be migrated from static HTML</p></div>',
                    'is_published' => true,
                    'sort_order' => 0,
                ]
            );
        }
        
        $this->command->info('Pages seeded successfully');
    }
}
