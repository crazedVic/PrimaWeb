<?php

namespace Database\Seeders;

use App\Models\Fechsung;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class FechsungSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Hardcoded fechsungen data from static HTML
        $fechsungen = [
            [
                'title' => 'Das Leben vor Schlaraffia',
                'description' => 'Das Leben vor Schlaraffia, gefechst von Rt. DaDa-Lust (110) zur Luega-Sippung a.U. 146',
                'image' => 'images/fechsung/dasleben_sm.jpg',
                'pdf_file' => 'pdf/DaDaLustFechsung.pdf',
                'sort_order' => 0,
            ],
            [
                'title' => 'Der Uhubaum',
                'description' => 'Der Uhubaum, gefechst von Rt, Medinegro',
                'image' => 'images/fechsung/deruhubaum_sm.jpg',
                'pdf_file' => null, // Image link, not PDF
                'sort_order' => 1,
            ],
            [
                'title' => 'Zeitzeuge',
                'description' => 'Zeitzeuge, gefechst von Kn. 116 zur 1760. Sippung a.U. 158',
                'image' => 'images/fechsung/zeitzeuge_sm.png',
                'pdf_file' => 'pdf/Zeitzeuge.pdf',
                'sort_order' => 2,
            ],
        ];
        
        foreach ($fechsungen as $fechsungData) {
            // Copy image to storage
            $sourceImage = base_path('static-site/' . $fechsungData['image']);
            if (File::exists($sourceImage)) {
                $storageImage = 'fechsungen/' . basename($fechsungData['image']);
                Storage::disk('public')->put($storageImage, File::get($sourceImage));
                $fechsungData['image'] = $storageImage;
            }
            
            // Copy PDF to storage if it exists
            if ($fechsungData['pdf_file']) {
                $sourcePdf = base_path('static-site/' . $fechsungData['pdf_file']);
                if (File::exists($sourcePdf)) {
                    $storagePdf = 'fechsungen/pdf/' . basename($fechsungData['pdf_file']);
                    Storage::disk('public')->put($storagePdf, File::get($sourcePdf));
                    $fechsungData['pdf_file'] = $storagePdf;
                }
            }
            
            Fechsung::updateOrCreate(
                ['title' => $fechsungData['title']],
                $fechsungData
            );
        }
        
        $this->command->info('Fechsungen seeded successfully');
    }
}
