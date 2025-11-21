<?php

namespace Database\Seeders;

use App\Models\Krystallinen;
use App\Models\KrystallineEntry;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;

class KrystallinenSeeder extends Seeder
{
    public function run(): void
    {
        // Clear existing data to prevent duplicates
        KrystallineEntry::truncate();
        Krystallinen::truncate();
        
        // Hardcoded krystallinen data from static HTML
        
        // Main Category: Sommerkrystallinen a.U. 164
        // This is the main header/intro - we'll use this for the intro text
        // But entries belong to subcategories
        
        // Subcategory 1: Krystallinen der Prima Canadensis
        $subcategory1 = Krystallinen::create([
            'header' => 'Sommerkrystallinen a.U. 164',
            'section_name' => 'Krystallinen der Prima Canadensis',
            'intro_text' => 'Bitte erkundigt Euch, ob die Krystallinen auch wie angekündigt stattfinden können!',
            'sort_order' => 0,
            'is_active' => true,
        ]);
        
        $entries1 = [
            [
                'date' => Carbon::create(2022, 6, 10), // 10.6.2022
                'description' => 'Krystalline in der Heimburg von Ritter Beton-Narr',
                'time' => 'Glock 2 am Mittag',
                'lageplan_file' => 'privat/BetonNarr_Plan.jpg',
                'sort_order' => 0,
            ],
            [
                'date' => Carbon::create(2022, 7, 8), // 8.7.2022
                'description' => 'Krystalline in der Heimburg von Ritter Wing-Wing',
                'time' => 'Glock 2 am Mittag',
                'lageplan_file' => 'privat/WingWing_Plan.jpg',
                'sort_order' => 1,
            ],
            [
                'date' => Carbon::create(2022, 8, 12), // 12.8.2022
                'description' => 'Krystalline in der Heimburg bei Ritter Java',
                'time' => 'Glock 2 am Mittag',
                'lageplan_file' => 'privat/Java_Plan.jpg',
                'sort_order' => 2,
            ],
            [
                'date' => Carbon::create(2022, 9, 9), // 9.9.2022
                'description' => 'Krystalline in der Heimburg von Ritter Tüftel',
                'time' => 'Glock 2 am Mittag',
                'lageplan_file' => 'privat/Tueftel_Plan.jpg',
                'sort_order' => 3,
            ],
        ];
        
        foreach ($entries1 as $entryData) {
            // Copy lageplan file to storage if it exists
            if ($entryData['lageplan_file']) {
                $sourceFile = base_path('static-site/' . $entryData['lageplan_file']);
                if (File::exists($sourceFile)) {
                    $storageFile = $entryData['lageplan_file'];
                    Storage::disk('public')->put($storageFile, File::get($sourceFile));
                    $entryData['lageplan_file'] = $storageFile;
                }
            }
            
            KrystallineEntry::create(array_merge($entryData, [
                'krystallinen_id' => $subcategory1->id,
                'is_active' => true,
            ]));
        }
        
        // Subcategory 2: Krystallinen der Rocky Mountania
        $subcategory2 = Krystallinen::create([
            'header' => 'Sommerkrystallinen a.U. 164',
            'section_name' => 'Krystallinen der Rocky Mountania',
            'intro_text' => null,
            'sort_order' => 1,
            'is_active' => true,
        ]);
        
        $entries2 = [
            [
                'date' => Carbon::create(2022, 7, 8), // 8.7.2022
                'description' => 'Krystalline in der Heimburg von Ritter Rohrbruch',
                'time' => 'Glock 2 am Mittag',
                'lageplan_file' => null,
                'sort_order' => 0,
            ],
            [
                'date' => Carbon::create(2022, 7, 30), // 30.7.2022
                'description' => 'Krystalline in der Heimburg von Ritter Brüner',
                'time' => 'Glock 2 am Mittag',
                'lageplan_file' => null,
                'sort_order' => 1,
            ],
        ];
        
        foreach ($entries2 as $entryData) {
            KrystallineEntry::create(array_merge($entryData, [
                'krystallinen_id' => $subcategory2->id,
                'is_active' => true,
            ]));
        }
        
        $this->command->info('Krystallinen seeded successfully');
    }
}
