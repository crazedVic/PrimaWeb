@extends('layouts.app')

@section('content')
@php
    $contentId = match($page->slug) {
        'stammbaum' => 'stcontent',
        'uberuns' => 'upd1',
        'unserestadt' => 'uscontent',
        'sassenschaft' => 'sassencontent',
        'sippungsfolge' => 'spfcontent',
        'krystallinen' => 'krycontent',
        'festschrift' => 'ulcontent',
        'sffechsung' => 'krycontent',
        'geschichte' => 'gcontent',
        'unterschlupf' => 'upd1',
        default => 'content'
    };
@endphp
@php
    // If content already starts with the content div, don't wrap it again
    $content = trim($page->content);
    $contentStartsWithDiv = preg_match('/^<div[^>]*(?:id|class)="' . preg_quote($contentId, '/') . '"[^>]*>/i', $content) || 
                             preg_match('/^<div[^>]*class="[^"]*' . preg_quote($contentId, '/') . '[^"]*"[^>]*>/i', $content);
@endphp
@if($contentStartsWithDiv)
    {!! $content !!}
@else
    <div id="{{ $contentId }}" class="{{ $page->slug === 'stammbaum' ? 'stcontent' : '' }}">
        {!! $content !!}
    </div>
@endif
@endsection

