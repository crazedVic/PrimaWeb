<?php

namespace Database\Seeders;

use App\Models\GalleryImage;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class GalleryImageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $basePath = base_path('static-site/images');
        
        // Hardcoded image category mappings from unserestadt.html
        $this->seedUnserestadtImages($basePath);
        
        // Fechsung images
        $fechsungPath = $basePath . '/fechsung';
        if (File::exists($fechsungPath)) {
            $this->seedImagesFromDirectory($fechsungPath, 'fechsung', 'Fechsung');
        }
        
        $this->command->info('Gallery images seeded successfully');
    }
    
    private function seedUnserestadtImages(string $basePath): void
    {
        // Hardcoded image category mappings
        $imageCategoryMap = [
            // City Skyline category
            'skylinegreen_sm.jpg' => 'City Skyline',
            'skylinetrees_sm.jpg' => 'City Skyline',
            'skylinefar_sm.jpg' => 'City Skyline',
            'skylinehill_sm.jpg' => 'City Skyline',
            
            // Unser Rathaus (City Hall) category
            'cityhall2_sm.jpg' => 'Unser Rathaus',
            'cityhall1_sm.jpg' => 'Unser Rathaus',
            
            // Raddampfer (Riverboat) category
            'riverqueen_sm.jpg' => 'Raddampfer',
            
            // Arts Distrikt (Downtown) category
            'downtown_sm.jpg' => 'Arts Distrikt',
            'totem_sm.jpg' => 'Arts Distrikt',
            
            // Hotel McDonald category
            'mcdonald_sm.jpg' => 'Hotel McDonald',
            
            // Parlamentsgelände (Legislature Grounds) category
            'legpoolfountain_sm.jpg' => 'Parlamentsgelände',
            'leggarden_sm.jpg' => 'Parlamentsgelände',
            'legfountain_sm.jpg' => 'Parlamentsgelände',
            'leg2_sm.jpg' => 'Parlamentsgelände',
            'leg3_sm.jpg' => 'Parlamentsgelände',
            'leg1_sm.jpg' => 'Parlamentsgelände',
            
            // Canada Place category
            'canadaplace_sm.jpg' => 'Canada Place',
            
            // High Level Bridge category
            'hilevel1_sm.jpg' => 'High Level Bridge',
            
            // Botanischer Garten (Muttart Conservatory) category
            'muttartfar_sm.jpg' => 'Botanischer Garten',
            'muttartmed_sm.jpg' => 'Botanischer Garten',
            'muttartclose_sm.jpg' => 'Botanischer Garten',
        ];
        
        $edmPath = $basePath . '/edm';
        if (!File::exists($edmPath)) {
            return;
        }
        
        $sortOrder = 0;
        
        // Create categories and assign images
        foreach ($imageCategoryMap as $filename => $categoryName) {
            $filePath = $edmPath . '/' . $filename;
            if (!File::exists($filePath)) {
                continue;
            }
            
            // Create category
            $categorySlug = \Illuminate\Support\Str::slug($categoryName);
            $category = \App\Models\Category::firstOrCreate(
                ['slug' => $categorySlug],
                [
                    'name' => $categoryName,
                    'is_active' => true,
                    'sort_order' => 0,
                ]
            );
            
            // Copy file to storage
            $storagePath = 'gallery/edm/' . $filename;
            Storage::disk('public')->put($storagePath, File::get($filePath));
            
            $title = pathinfo($filename, PATHINFO_FILENAME);
            
            GalleryImage::updateOrCreate(
                ['image_path' => $storagePath],
                [
                    'title' => $title,
                    'category_id' => $category->id,
                    'sort_order' => $sortOrder++,
                ]
            );
        }
    }
    
    private function seedImagesFromDirectory(string $directory, string $categorySlug, string $titlePrefix): void
    {
        $files = File::files($directory);
        $sortOrder = 0;
        
        // Get or create category
        $category = \App\Models\Category::firstOrCreate(
            ['slug' => $categorySlug],
            [
                'name' => $titlePrefix,
                'is_active' => true,
                'sort_order' => 0,
            ]
        );
        
        foreach ($files as $file) {
            $extension = strtolower($file->getExtension());
            
            if (!in_array($extension, ['jpg', 'jpeg', 'png', 'gif'])) {
                continue;
            }
            
            $filename = $file->getFilename();
            
            // Copy file to storage (Filament standard location)
            $storagePath = 'gallery/' . basename($directory) . '/' . $filename;
            Storage::disk('public')->put($storagePath, File::get($file->getPathname()));
            
            $title = pathinfo($filename, PATHINFO_FILENAME);
            
            GalleryImage::firstOrCreate(
                ['image_path' => $storagePath],
                [
                    'title' => $title,
                    'category_id' => $category->id,
                    'sort_order' => $sortOrder++,
                ]
            );
        }
    }
}
