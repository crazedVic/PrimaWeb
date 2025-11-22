@extends('layouts.app')

@section('content')
<div id="krycontent">
    @if($krystallinen->count() > 0)
        @php
            $mainHeader = $krystallinen->first()->header ?? 'Sommerkrystallinen a.U. 164';
            $mainIntro = $krystallinen->first()->intro_text;
        @endphp
        
        <h1>{{ $mainHeader }}</h1>
        @if($mainIntro)
            <p>{{ $mainIntro }}</p>
        @endif
        
        @foreach($krystallinen as $section)
            @if($section->section_name)
                <h2>{{ $section->section_name }}</h2>
            @endif
            
            <div class="krystallinen-entries">
                @foreach($section->activeEntries as $entry)
                    <div class="krystallinen-entry">
                        <div class="krystallinen-entry-header">
                            @if($entry->date)
                                <span class="krystallinen-date">{{ $entry->date->format('j.n') }}.164</span>
                            @endif
                            @if($entry->time)
                                <span class="krystallinen-time">{{ $entry->time }}</span>
                            @endif
                        </div>
                        <div class="krystallinen-description">{{ $entry->description }}</div>
                        @if($entry->lageplan_file)
                            <div class="krystallinen-lageplan">
                                <a href="{{ \Illuminate\Support\Facades\Storage::url($entry->lageplan_file) }}" target="_blank">
                                    <img src="{{ \Illuminate\Support\Facades\Storage::url('images/mapicon.png') }}" alt="Lageplan" />
                                    <span>Lageplan</span>
                                </a>
                            </div>
                        @endif
                    </div>
                @endforeach
            </div>
        @endforeach
    @endif
</div>

{{-- Show poem/ladung section if it exists - separate richtext container --}}
@if($page->content && trim(strip_tags($page->content)))
    <div id="content">
        {!! $page->content !!}
    </div>
@endif

<style>
#krycontent h1 {
    font-size: 2em;
    margin-bottom: 0.5em;
    text-align: center;
}

#krycontent h2 {
    font-size: 1.2em;
    margin-top: 1.5em;
    margin-bottom: 0.5em;
    text-align: center;
}

#krycontent > p {
    text-align: center;
}
</style>
@endsection
