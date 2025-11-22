@extends('layouts.app')

@section('content')
@php
    $contentId = 'spfcontent';
@endphp
<div id="{{ $contentId }}">
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
        @if(!$loop->last)
            <hr class="subcategory-divider" />
        @endif
    @endforeach
    
    @if($page->content && trim(strip_tags($page->content)))
        <div class="footnotes">
            {!! $page->content !!}
        </div>
    @endif
</div>

<style>
#spfcontent .subcategory-divider {
    width: 100%;
    margin: 1.5em 0;
    border: none;
    border-top: 1px solid #ccc;
}

#spfcontent .footnotes {
    margin-top: 2em;
    padding-top: 1em;
    border-top: 1px solid #ccc;
}
</style>
@endsection

