<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\GalleryImage;
use Illuminate\Database\Seeder;

class MigrateGalleryCategoriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create default categories from existing gallery images
        $existingCategories = GalleryImage::whereNotNull('category')
            ->distinct()
            ->pluck('category')
            ->filter()
            ->toArray();
        
        foreach ($existingCategories as $categorySlug) {
            $categoryName = ucfirst($categorySlug);
            
            $category = Category::firstOrCreate(
                ['slug' => $categorySlug],
                [
                    'name' => $categoryName,
                    'is_active' => true,
                    'sort_order' => 0,
                ]
            );
            
            // Update gallery images to use the new category_id
            GalleryImage::where('category', $categorySlug)
                ->whereNull('category_id')
                ->update(['category_id' => $category->id]);
        }
        
        // Create a default "Edmonton" category if it doesn't exist
        $edmontonCategory = Category::firstOrCreate(
            ['slug' => 'edmonton'],
            [
                'name' => 'Edmonton',
                'description' => 'Images of Edmonton landmarks and attractions',
                'is_active' => true,
                'sort_order' => 1,
            ]
        );
        
        $this->command->info('Gallery categories migrated successfully');
    }
}
