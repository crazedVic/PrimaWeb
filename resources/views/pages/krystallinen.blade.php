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
            
            <table>
                <thead>
                    <tr>
                        <td class="kry0"></td>
                        <td class="kry1"></td>
                        <td class="kry2"></td>
                        <td class="kry3"></td>
                    </tr>
                </thead>
                <tbody>
                    @foreach($section->activeEntries as $entry)
                        <tr>
                            <td class="kry0">
                                @if($entry->date)
                                    {{ $entry->date->format('j.n') }}.164
                                @endif
                            </td>
                            <td class="kry1">{{ $entry->description }}</td>
                            <td class="kry2">{{ $entry->time }}</td>
                            <td class="kry3">
                                @if($entry->lageplan_file)
                                    <a href="{{ \Illuminate\Support\Facades\Storage::url($entry->lageplan_file) }}" target="_blank">
                                        <img src="{{ \Illuminate\Support\Facades\Storage::url('images/mapicon.png') }}" alt="Lageplan" />
                                    </a>
                                    <p>Lageplan</p>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
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
