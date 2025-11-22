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
        <div class="spf-month-section">
            <div class="spf-month-header">
                <div class="spf-empty"></div>
                <div class="spf-month-title">{{ $monthName }}</div>
            </div>
            <div class="spf-meetings-list">
                @foreach($monthMeetings as $meeting)
                    <div class="spf-meeting-row" id="meeting-{{ $meeting->id }}">
                        <div class="spf1">{{ $meeting->date->format('j.') }}</div>
                        <div class="spf1">{{ $meeting->meeting_number }}</div>
                        <div class="spf2">
                            @if($meeting->is_cancelled)
                                fällt aus ({{ $meeting->cancellation_reason }})
                            @else
                                {{ $meeting->theme }}
                            @endif
                        </div>
                        <div class="spf3"></div>
                    </div>
                @endforeach
            </div>
        </div>
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

.spf-month-section {
    margin-top: 1.5em;
}

.spf-month-header {
    display: flex;
    font-size: 1.2em;
    font-weight: bold;
    padding-bottom: 0.4em;
}

.spf-empty {
    width: 4em;
}

.spf-month-title {
    width: 4em;
}

.spf-meetings-list {
    width: 100%;
}

.spf-meeting-row {
    display: flex;
    font-size: 1.2em;
    font-weight: normal;
    padding: 0;
    padding-bottom: 0.4em;
    margin: 0;
    text-align: left;
    width: 100%;
    box-sizing: border-box;
}

.spf-meeting-row .spf1 {
    width: 4em;
    flex-shrink: 0;
}

.spf-meeting-row .spf2 {
    flex: 1;
    min-width: 0;
    word-wrap: break-word;
    overflow-wrap: break-word;
}

.spf-meeting-row .spf3 {
    width: 8em;
    flex-shrink: 0;
}

@media (max-width: 768px) {
    #spfcontent {
        margin-left: 0 !important;
        margin-right: 0 !important;
        padding: 0 !important;
        max-width: 100% !important;
    }
    
    .spf-month-section {
        margin-top: 1em;
    }
    
    .spf-meeting-row {
        flex-wrap: nowrap;
    }
    
    .spf-meeting-row .spf1 {
        flex-shrink: 0;
    }
    
    .spf-meeting-row .spf2 {
        flex: 1;
        min-width: 0;
    }
    
    .spf-meeting-row .spf3 {
        display: none;
    }
}
</style>
@endsection

