<?php

namespace Database\Seeders;

use App\Models\MemberRank;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class MemberRankSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $ranks = [
            ['name' => 'Würdenträger', 'slug' => 'wurdentrager', 'sort_order' => 1],
            ['name' => 'Erbwürdenträger im Ruhestand', 'slug' => 'erbwurdentrager-im-ruhestand', 'sort_order' => 2],
            ['name' => 'Sesshafte Ritter', 'slug' => 'sesshafte-ritter', 'sort_order' => 3],
            ['name' => 'Fahrende Ritter', 'slug' => 'fahrende-ritter', 'sort_order' => 4],
            ['name' => 'Ritter in Ahall', 'slug' => 'ritter-in-ahall', 'sort_order' => 5],
            ['name' => 'Ehemalige Sassen', 'slug' => 'ehemalige-sassen', 'sort_order' => 6],
        ];

        foreach ($ranks as $rank) {
            MemberRank::firstOrCreate(
                ['slug' => $rank['slug']],
                $rank
            );
        }
    }
}
