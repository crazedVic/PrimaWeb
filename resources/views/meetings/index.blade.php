@extends('layouts.app')

@section('content')
<div id="spfcontent">
    <h1>Winterung a.U. 165</h1>
    @php
        $groupedMeetings = $meetings->groupBy(function($meeting) {
            return $meeting->month_name ?? 'Unknown';
        });
    @endphp
    
    @foreach($groupedMeetings as $monthName => $monthMeetings)
        <table>
            <thead>
                <tr>
                    <th></th>
                    <th>{{ $monthName }}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($monthMeetings as $meeting)
                    <tr>
                        <td class="spf1">{{ $meeting->date->format('j.') }}</td>
                        <td class="spf1">{{ $meeting->meeting_number }}</td>
                        <td class="spf2">
                            @if($meeting->is_cancelled)
                                fällt aus ({{ $meeting->cancellation_reason }})
                            @else
                                {{ $meeting->theme }}
                            @endif
                        </td>
                        <td class="spf3"></td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endforeach
</div>
@endsection

