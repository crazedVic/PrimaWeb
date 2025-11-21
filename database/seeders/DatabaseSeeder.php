<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            MemberRankSeeder::class,
            MemberSeeder::class,
            MemberContactSeeder::class,
            MeetingSeeder::class,
            FechsungSeeder::class,
            PageSeeder::class,
            GalleryImageSeeder::class,
        ]);
    }
}
