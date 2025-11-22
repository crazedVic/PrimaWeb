@extends('layouts.app')

@section('content')
<div id="wacontent">
    @foreach($ranks as $rank)
        @if($rank->members->count() > 0)
            <div class="wappen-rank-section">
                <h2 class="wappen-rank-title">{{ $rank->name }}</h2>
                <div class="wappen-tiles">
                    @php
                        $members = $rank->members->sortBy('sort_order')->values();
                    @endphp
                    @foreach($members as $member)
                        <div class="wappen-tile">
                            @if($member->shield_thumbnail || $member->shield_image)
                                <a href="{{ \Illuminate\Support\Facades\Storage::url($member->shield_image ?? $member->shield_thumbnail) }}" target="_blank">
                                    <img 
                                        src="{{ \Illuminate\Support\Facades\Storage::url($member->shield_thumbnail ?? $member->shield_image) }}" 
                                        alt="{{ $member->name }}" 
                                    />
                                </a>
                            @endif
                            <p class="{{ $member->is_active ? 'wap1' : 'wap5' }}">
                                {{ $member->name }}
                                @if($member->rank_abbreviation)
                                    <span id="exp{{ $member->is_active ? '1' : '2' }}">{{ $member->rank_abbreviation }}</span>
                                @endif
                                @if($member->meeting_number)
                                    <span id="exp5">({{ $member->meeting_number }})</span>
                                @endif
                            </p>
                            @if($member->title)
                                <p class="{{ $member->is_active ? 'wap2' : 'wap4' }}">{{ $member->title }}</p>
                            @endif
                        </div>
                    @endforeach
                </div>
            </div>
        @endif
    @endforeach
</div>
<div id="wappencontainer">
    <div class="hd" id="wappenheader"></div>
    <div class="bd" id="wappengalerie"></div>
    <div class="ft"></div>
</div>
    <script type="text/javascript" src="{{ asset('js/yahoo-dom-event.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/container-min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/wappen.js') }}"></script>
@endsection

