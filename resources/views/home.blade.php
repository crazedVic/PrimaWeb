@extends('layouts.app')

@section('content')
@if($page && $page->content)
    {!! $page->content !!}
@else
    {{-- Fallback to default content if page not found --}}
    <div id="htxt"><p class="p1">Eynen uhuhertzlichen Willekum in der Schlaraffia &reg; Prima Canadensis, Reych 337</p></div>
    <div id="himg1"><a href="http://www.schlaraffia.org/" target="_blank"><img src="{{ \Illuminate\Support\Facades\Storage::url('images/uhu.png') }}" alt="Allschlaraffia" id="allschlaraffia" /></a></div>
    <div id="himg2"><img src="{{ \Illuminate\Support\Facades\Storage::url('images/prima_wappen.png') }}" alt="Prima Canadensis Wappen" /></div>
@endif
@endsection

