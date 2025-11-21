<?php

namespace Database\Seeders;

use App\Models\Meeting;
use Illuminate\Database\Seeder;
use Carbon\Carbon;

class MeetingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Hardcoded meetings data from static HTML
        // Winterung a.U. 165
        $meetings = [
            // Lethemond
            ['day' => 7, 'month_name' => 'Lethemond', 'meeting_number' => 1912, 'theme' => 'Eröffnungsschlaraffiade*', 'event_type' => 'schlaraffiade', 'year' => 2024, 'month' => 10],
            ['day' => 14, 'month_name' => 'Lethemond', 'meeting_number' => null, 'theme' => null, 'is_cancelled' => true, 'cancellation_reason' => 'fällt aus (Erntedankfest)', 'year' => 2024, 'month' => 10],
            ['day' => 21, 'month_name' => 'Lethemond', 'meeting_number' => 1913, 'theme' => 'Schwarzer Humor', 'event_type' => 'regular', 'year' => 2024, 'month' => 10],
            ['day' => 28, 'month_name' => 'Lethemond', 'meeting_number' => 1914, 'theme' => 'Pilgerabend', 'event_type' => 'regular', 'year' => 2024, 'month' => 10],
            
            // Windmond
            ['day' => 4, 'month_name' => 'Windmond', 'meeting_number' => 1915, 'theme' => 'Schlaraffiade, PRAGA- und Ahallafeyer**', 'event_type' => 'schlaraffiade', 'year' => 2024, 'month' => 11],
            ['day' => 11, 'month_name' => 'Windmond', 'meeting_number' => null, 'theme' => null, 'is_cancelled' => true, 'cancellation_reason' => 'fällt aus (Rememberence Day)', 'year' => 2024, 'month' => 11],
            ['day' => 18, 'month_name' => 'Windmond', 'meeting_number' => 1916, 'theme' => 'Wissenschaftsexperimente und Zaubertricks', 'event_type' => 'regular', 'year' => 2024, 'month' => 11],
            ['day' => 27, 'month_name' => 'Windmond', 'meeting_number' => 1917, 'theme' => 'Adventsfeyer', 'event_type' => 'regular', 'year' => 2024, 'month' => 11],
            
            // Christmond
            ['day' => 2, 'month_name' => 'Christmond', 'meeting_number' => 1918, 'theme' => 'Schlaraffiade*, Seltsame und machnchmal unerwünschte Geschenke', 'event_type' => 'schlaraffiade', 'year' => 2024, 'month' => 12],
            ['day' => 7, 'month_name' => 'Christmond', 'meeting_number' => 1919, 'theme' => 'Samstag: UHUbaumfeyer***, mit Burgfrauen', 'event_type' => 'special', 'year' => 2024, 'month' => 12],
            ['day' => 14, 'month_name' => 'Christmond', 'meeting_number' => null, 'theme' => 'Samstag: UHUbaumfeyer bei der Tochter', 'event_type' => 'special', 'year' => 2024, 'month' => 12],
            ['day' => 23, 'month_name' => 'Christmond', 'meeting_number' => null, 'theme' => null, 'is_cancelled' => true, 'cancellation_reason' => 'fällt aus', 'year' => 2024, 'month' => 12],
            ['day' => 25, 'month_name' => 'Christmond', 'meeting_number' => null, 'theme' => null, 'is_cancelled' => true, 'cancellation_reason' => 'fällt aus', 'year' => 2024, 'month' => 12],
            
            // Eismond (Winterung a.U. 166)
            ['day' => 6, 'month_name' => 'Eismond', 'meeting_number' => 1920, 'theme' => 'Schlaraffiade*, Profane Jahreshauptversammlung, Paßverlängerung, Wald und Wiese', 'event_type' => 'schlaraffiade', 'year' => 2025, 'month' => 1],
            ['day' => 13, 'month_name' => 'Eismond', 'meeting_number' => 1921, 'theme' => 'Seltsame Träume', 'event_type' => 'regular', 'year' => 2025, 'month' => 1],
            ['day' => 20, 'month_name' => 'Eismond', 'meeting_number' => 1922, 'theme' => 'Schlaraffische Kochexperimente: Triumph und Katastrophe', 'event_type' => 'regular', 'year' => 2025, 'month' => 1],
            ['day' => 27, 'month_name' => 'Eismond', 'meeting_number' => 1923, 'theme' => 'Haikus und Reime, jeder fechst', 'event_type' => 'regular', 'year' => 2025, 'month' => 1],
            
            // Hornung
            ['day' => 3, 'month_name' => 'Hornung', 'meeting_number' => 1924, 'theme' => 'Schlaraffiade*, Mein Lieblingsdichter', 'event_type' => 'schlaraffiade', 'year' => 2025, 'month' => 2],
            ['day' => 10, 'month_name' => 'Hornung', 'meeting_number' => 1925, 'theme' => 'Filmabend mit Burgfrauena: "Die Feuerzangenbowle"', 'event_type' => 'regular', 'year' => 2025, 'month' => 2],
            ['day' => 17, 'month_name' => 'Hornung', 'meeting_number' => null, 'theme' => null, 'is_cancelled' => true, 'cancellation_reason' => 'fällt aus (Family Day)', 'year' => 2025, 'month' => 2],
            ['day' => 24, 'month_name' => 'Hornung', 'meeting_number' => 1926, 'theme' => 'Wortspiele und Sprichwörter', 'event_type' => 'regular', 'year' => 2025, 'month' => 2],
            
            // Lenzmond
            ['day' => 3, 'month_name' => 'Lenzmond', 'meeting_number' => 1927, 'theme' => 'Schlaraffiade**, Wald und Wiese', 'event_type' => 'schlaraffiade', 'year' => 2025, 'month' => 3],
            ['day' => 10, 'month_name' => 'Lenzmond', 'meeting_number' => 1928, 'theme' => 'Sprechende Tiere', 'event_type' => 'regular', 'year' => 2025, 'month' => 3],
            ['day' => 17, 'month_name' => 'Lenzmond', 'meeting_number' => 1929, 'theme' => 'LUEGA-Sippung, Thema:Die Kunst des freundschaftlichen Humors oder die diplomatische Herausforderung zum Zweikampf', 'event_type' => 'regular', 'year' => 2025, 'month' => 3],
            ['day' => 24, 'month_name' => 'Lenzmond', 'meeting_number' => 1930, 'theme' => 'Was ist heutzutage mit der Musik los?', 'event_type' => 'regular', 'year' => 2025, 'month' => 3],
            ['day' => 29, 'month_name' => 'Lenzmond', 'meeting_number' => 1931, 'theme' => 'Samstag: Ritterschlag***', 'event_type' => 'special', 'year' => 2025, 'month' => 3],
            ['day' => 31, 'month_name' => 'Lenzmond', 'meeting_number' => null, 'theme' => null, 'is_cancelled' => true, 'cancellation_reason' => 'fällt aus', 'year' => 2025, 'month' => 3],
            
            // Ostermond
            ['day' => 7, 'month_name' => 'Ostermond', 'meeting_number' => 1932, 'theme' => 'Schlaraffiade**, Wald und Wiese', 'event_type' => 'schlaraffiade', 'year' => 2025, 'month' => 4],
            ['day' => 14, 'month_name' => 'Ostermond', 'meeting_number' => 1933, 'theme' => 'Stiftungs- und Ordensfest***', 'event_type' => 'special', 'year' => 2025, 'month' => 4],
            ['day' => 21, 'month_name' => 'Ostermond', 'meeting_number' => null, 'theme' => null, 'is_cancelled' => true, 'cancellation_reason' => 'fällt aus (Ostermontag)', 'year' => 2025, 'month' => 4],
            ['day' => 28, 'month_name' => 'Ostermond', 'meeting_number' => 1934, 'theme' => 'Absurde Ängste', 'event_type' => 'regular', 'year' => 2025, 'month' => 4],
            
            // Wonnemond
            ['day' => 5, 'month_name' => 'Wonnemond', 'meeting_number' => 1935, 'theme' => 'Schlußschlaraffiade und Kürung*', 'event_type' => 'schlaraffiade', 'year' => 2025, 'month' => 5],
        ];
        
        $sortOrder = 0;
        foreach ($meetings as $meetingData) {
            $date = Carbon::create(
                $meetingData['year'],
                $meetingData['month'],
                $meetingData['day']
            );
            
            Meeting::updateOrCreate(
                [
                    'date' => $date->format('Y-m-d'),
                    'month_name' => $meetingData['month_name'],
                    'sort_order' => $sortOrder,
                ],
                [
                    'date' => $date->format('Y-m-d'),
                    'meeting_number' => $meetingData['meeting_number'] ?? null,
                    'month_name' => $meetingData['month_name'],
                    'theme' => $meetingData['theme'] ?? null,
                    'event_type' => $meetingData['event_type'] ?? 'regular',
                    'is_cancelled' => $meetingData['is_cancelled'] ?? false,
                    'cancellation_reason' => $meetingData['cancellation_reason'] ?? null,
                    'sort_order' => $sortOrder++,
                ]
            );
        }
        
        $this->command->info('Meetings seeded successfully');
    }
}
