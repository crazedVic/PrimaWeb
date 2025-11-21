<?php

namespace Database\Seeders;

use App\Models\Member;
use App\Models\MemberRank;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class MemberSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Hardcoded members data from static HTML
        // Structure: [rank_slug, name, title, rank_abbreviation, shield_image_path, shield_thumbnail_path, meeting_number, is_active]
        
        $members = [
            // Würdenträger
            ['wurdentrager', 'Tüftel', 'der experimentelle Narrenspross', 'OÄ.', 'images/shields_sm/tuftel.png', 'images/shields_thumb/tuftel-sm.gif', null, true],
            ['wurdentrager', 'Rädle', 'der eiernde Bioniker', 'OI.', 'images/shields_sm/radle.png', 'images/shields_thumb/radle-sm.gif', null, true],
            ['wurdentrager', 'Java', 'der vernetzliche Spinner', 'OK.', 'images/shields_sm/keinwappen.png', 'images/shields_thumb/keinwappen-sm.gif', null, true],
            ['wurdentrager', 'Weswolf', 'der palmström\'sche Genitiv', 'K.', 'images/shields_sm/weswolf.png', 'images/shields_thumb/weswolf-sm.gif', null, true],
            ['wurdentrager', 'Blarneycus', 'der schnelle Glöckner', 'M.', 'images/shields_sm/blarneycus.png', 'images/shields_thumb/blarneycus-sm.gif', null, true],
            ['wurdentrager', 'S\'Gnalld', 'der verhinderte Scharfschütze', 'J.', 'images/shields_sm/sgnalld.png', 'images/shields_thumb/sgnalld-sm.gif', null, true],
            ['wurdentrager', 'Tetrapylo', 'der Friedensstifter', 'Sch.', 'images/shields_sm/keinwappen.png', 'images/shields_thumb/keinwappen-sm.gif', null, true],
            ['wurdentrager', 'Wing-Wing', 'der fliegreyche Atmosphärenschreck', 'C.', 'images/shields_sm/wingwing.png', 'images/shields_thumb/wingwing-sm.gif', null, true],
            
            // Erbwürdenträger im Ruhestand
            ['erbwurdentrager-im-ruhestand', 'Baltenherz', 'der Hördelsche', null, 'images/shields_sm/baltenherz.png', 'images/shields_thumb/baltenherz-sm.gif', null, true],
            ['erbwurdentrager-im-ruhestand', 'Beton-Narr', 'der Hochgebaute', null, 'images/shields_sm/betonnarr.png', 'images/shields_thumb/betonnarr-sm.gif', null, true],
            ['erbwurdentrager-im-ruhestand', 'Jan Maat', 'der Alsterpirat', null, 'images/shields_sm/janmaat.png', 'images/shields_thumb/janmaat-sm.gif', null, true],
            ['erbwurdentrager-im-ruhestand', 'Lex Tempore', 'der Rehseesegler', null, 'images/shields_sm/lextempore.png', 'images/shields_thumb/lextempore-sm.gif', null, true],
            ['erbwurdentrager-im-ruhestand', 'Schöppche', 'der Offe-Becher', null, 'images/shields_sm/schoppche.png', 'images/shields_thumb/schoppche-sm.gif', null, true],
            
            // Sesshafte Ritter
            ['sesshafte-ritter', 'InseRath', 'der Tonangeber', null, 'images/shields_sm/inserath.png', 'images/shields_thumb/inserath-sm.gif', null, true],
            ['sesshafte-ritter', 'Phil-o-atz', 'Genie(s)er von Al-too-na', null, 'images/shields_sm/philoatz.png', 'images/shields_thumb/philoatz-sm.gif', null, true],
            ['sesshafte-ritter', 'Seekular', 'das digitale Auge', null, 'images/shields_sm/seekular.png', 'images/shields_thumb/seekular-sm.gif', null, true],
            ['sesshafte-ritter', 'Tilly', 'Flieger vom Kloster', null, 'images/shields_sm/tilly.png', 'images/shields_thumb/tilly-sm.gif', null, true],
            ['sesshafte-ritter', 'Wildschütz', 'Orvis vom Felsensee', null, 'images/shields_sm/wildschutz.png', 'images/shields_thumb/wildschutz-sm.gif', null, true],
            
            // Fahrende Ritter
            ['fahrende-ritter', 'Abooki', 'der ugandische Quacksalber', null, 'images/shields_sm/abooki.png', 'images/shields_thumb/abooki-sm.gif', null, true],
            ['fahrende-ritter', 'Finanz-o-Phil', 'der bärige Schübelbacher', null, 'images/shields_sm/finanzophil.png', 'images/shields_thumb/finanzophil-sm.gif', null, true],
            ['fahrende-ritter', 'Kielius', 'der Statische', null, 'images/shields_sm/kielius.png', 'images/shields_thumb/kielius-sm.gif', null, true],
            ['fahrende-ritter', 'Lipp\'Quell', 'vom Odin-Aug\'', null, 'images/shields_sm/keinwappen.png', 'images/shields_thumb/keinwappen-sm.gif', null, true],
            
            // Ritter in Ahall
            ['ritter-in-ahall', 'Acturus', null, null, 'images/shields_sm/acturus.png', 'images/shields_thumb/acturus-sm.gif', null, false],
            ['ritter-in-ahall', 'Arzgebarch', null, null, 'images/shields_sm/arzgebarch.png', 'images/shields_thumb/arzgebarch-sm.gif', null, false],
            ['ritter-in-ahall', 'As vom Bach', null, null, 'images/shields_sm/asvombach.png', 'images/shields_thumb/asvombach-sm.gif', null, false],
            ['ritter-in-ahall', 'Attika', null, null, 'images/shields_sm/attika.png', 'images/shields_thumb/attika-sm.gif', null, false],
            ['ritter-in-ahall', 'Auf und Davon', null, null, 'images/shields_sm/aufunddavon.png', 'images/shields_thumb/aufunddavon-sm.gif', null, false],
            ['ritter-in-ahall', 'Cosmo-Pol', null, null, 'images/shields_sm/cosmopol.png', 'images/shields_thumb/cosmopol-sm.gif', null, false],
            ['ritter-in-ahall', 'Chiangmai', null, null, 'images/shields_sm/chiangmai.png', 'images/shields_thumb/chiangmai-sm.gif', null, false],
            ['ritter-in-ahall', 'Donar', null, null, 'images/shields_sm/donar.png', 'images/shields_thumb/donar-sm.gif', null, false],
            ['ritter-in-ahall', 'El-El-Bé', null, null, 'images/shields_sm/eieibe.png', 'images/shields_thumb/eieibe-sm.gif', null, false],
            ['ritter-in-ahall', 'Graf Goks', null, null, 'images/shields_sm/grafgoks.png', 'images/shields_thumb/grafgoks-sm.gif', null, false],
            ['ritter-in-ahall', 'Heinseat', null, null, 'images/shields_sm/heinseat.png', 'images/shields_thumb/heinseat-sm.gif', null, false],
            ['ritter-in-ahall', 'Intarsius', null, null, 'images/shields_sm/intarsius.png', 'images/shields_thumb/intarsius-sm.gif', null, false],
            ['ritter-in-ahall', 'Jucundus', null, null, 'images/shields_sm/jucundus.png', 'images/shields_thumb/jucundus-sm.gif', null, false],
            ['ritter-in-ahall', 'Karnut', null, null, 'images/shields_sm/karnut.png', 'images/shields_thumb/karnut-sm.gif', null, false],
            ['ritter-in-ahall', 'Kow-Boy', null, null, 'images/shields_sm/kowboy.png', 'images/shields_thumb/kowboy-sm.gif', null, false],
            ['ritter-in-ahall', 'Künec', null, null, 'images/shields_sm/kunec.png', 'images/shields_thumb/kunec-sm.gif', null, false],
            ['ritter-in-ahall', 'Lachodder', null, null, 'images/shields_sm/lachodder.png', 'images/shields_thumb/lachodder-sm.gif', null, false],
            ['ritter-in-ahall', 'Maxi-Muss', null, null, 'images/shields_sm/maximuss.png', 'images/shields_thumb/maximuss-sm.gif', null, false],
            ['ritter-in-ahall', 'Medinegro', null, null, 'images/shields_sm/medinegro.png', 'images/shields_thumb/medinegro-sm.gif', null, false],
            ['ritter-in-ahall', 'Mini-Um-Al', null, null, 'images/shields_sm/miniumal.png', 'images/shields_thumb/miniumal-sm.gif', null, false],
            ['ritter-in-ahall', 'Null Ouvert', null, null, 'images/shields_sm/nullouvert.png', 'images/shields_thumb/nullouvert-sm.gif', null, false],
            ['ritter-in-ahall', 'Philanumis', null, null, 'images/shields_sm/philanumis.png', 'images/shields_thumb/philanumis-sm.gif', null, false],
            ['ritter-in-ahall', 'Romulus', null, null, 'images/shields_sm/romulus.png', 'images/shields_thumb/romulus-sm.gif', null, false],
            ['ritter-in-ahall', 'Pic-Asso', null, null, 'images/shields_sm/picasso.png', 'images/shields_thumb/picasso-sm.gif', null, false],
            ['ritter-in-ahall', 'Pfeifentopf', null, null, 'images/shields_sm/pfeifentopf.png', 'images/shields_thumb/pfeifentopf-sm.gif', null, false],
            ['ritter-in-ahall', 'PRAGAmemnon', null, null, 'images/shields_sm/pragamemnon.png', 'images/shields_thumb/pragamemnon-sm.gif', null, false],
            ['ritter-in-ahall', 'Sandfloh', null, null, 'images/shields_sm/sandfloh.png', 'images/shields_thumb/sandfloh-sm.gif', null, false],
            ['ritter-in-ahall', 'Schneekopp', null, null, 'images/shields_sm/schneekopp.png', 'images/shields_thumb/schneekopp-sm.gif', null, false],
            ['ritter-in-ahall', 'Wuling', null, null, 'images/shields_sm/wuling.png', 'images/shields_thumb/wuling-sm.gif', null, false],
            ['ritter-in-ahall', 'Zahn-Häuser', null, null, 'images/shields_sm/zahnhauser.png', 'images/shields_thumb/zahnhauser-sm.gif', null, false],
            
            // Ehemalige Sassen
            ['ehemalige-sassen', 'Cusimus', null, null, 'images/shields_sm/cusimus.png', 'images/shields_thumb/cusimus-sm.gif', 408, false],
            ['ehemalige-sassen', 'Huck im Busch', null, null, 'images/shields_sm/huckimbusch.png', 'images/shields_thumb/huckimbusch-sm.gif', 406, false],
            ['ehemalige-sassen', 'Lyr-A-Lux', null, null, 'images/shields_sm/lyralux.png', 'images/shields_thumb/lyralux-sm.gif', 406, false],
            ['ehemalige-sassen', 'Rohrspatz', null, null, 'images/shields_sm/rohrspatz.png', 'images/shields_thumb/rohrspatz-sm.gif', 364, false],
            ['ehemalige-sassen', 'Cularis', 'der Ru(h)mgetriebene Ruhr(s)pottsprössling', null, 'images/shields_sm/cularis.png', 'images/shields_thumb/cularis-sm.gif', 42, false],
            ['ehemalige-sassen', 'Preuß', 'vom Elchwinkel', null, 'images/shields_sm/preuss.png', 'images/shields_thumb/preuss-sm.gif', 415, false],
            ['ehemalige-sassen', 'Quo vadis', null, null, 'images/shields_sm/quovadis.png', 'images/shields_thumb/quovadis-sm.gif', 415, false],
            ['ehemalige-sassen', 'Weißbinder', 'vom Fuldastrand', null, 'images/shields_sm/weissbinder.png', 'images/shields_thumb/weissbinder-sm.gif', 386, false],
        ];
        
        $sortOrder = 0;
        foreach ($members as $memberData) {
            $rank = MemberRank::where('slug', $memberData[0])->first();
            
            if (!$rank) {
                $this->command->warn("Rank not found: {$memberData[0]}");
                continue;
            }
            
            // Copy shield images to storage
            $storageShieldImage = null;
            $storageShieldThumbnail = null;
            
            // Process large image
            if ($memberData[4] && $memberData[4] !== 'images/shields_sm/keinwappen.png') {
                $largePath = base_path('static-site/' . $memberData[4]);
                if (File::exists($largePath)) {
                    $shieldFilename = basename($largePath);
                    $storageShieldImage = 'shields/' . $shieldFilename;
                    Storage::disk('public')->put($storageShieldImage, File::get($largePath));
                }
            }
            
            // Process thumbnail
            if ($memberData[5] && $memberData[5] !== 'images/shields_thumb/keinwappen-sm.gif') {
                $thumbPath = base_path('static-site/' . $memberData[5]);
                if (File::exists($thumbPath)) {
                    $thumbFilename = basename($thumbPath);
                    $storageShieldThumbnail = 'shields/thumbnails/' . $thumbFilename;
                    Storage::disk('public')->put($storageShieldThumbnail, File::get($thumbPath));
                }
            }
            
            Member::updateOrCreate(
                [
                    'member_rank_id' => $rank->id,
                    'name' => $memberData[1],
                ],
                [
                    'title' => $memberData[2],
                    'rank_abbreviation' => $memberData[3],
                    'shield_image' => $storageShieldImage,
                    'shield_thumbnail' => $storageShieldThumbnail,
                    'meeting_number' => $memberData[6],
                    'is_active' => $memberData[7],
                    'sort_order' => $sortOrder++,
                ]
            );
        }
        
        $this->command->info('Members seeded successfully. Total: ' . Member::count());
    }
}
