@extends('layouts.app')

@section('content')
<div id="wacontent">
    @foreach($ranks as $rank)
        @if($rank->members->count() > 0)
            <table class="{{ $rank->slug === 'sesshafte-ritter' || $rank->slug === 'fahrende-ritter' || $rank->slug === 'ritter-in-ahall' || $rank->slug === 'ehemalige-sassen' ? 'erb' : 'wt' }}">
                <thead>
                    <tr>
                        <th></th>
                        <th>{{ $rank->name }}</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $members = $rank->members->sortBy('sort_order')->values();
                        $chunked = $members->chunk(3);
                    @endphp
                    @foreach($chunked as $memberRow)
                        <tr>
                            @foreach($memberRow as $member)
                                <td>
                                    @if($member->shield_thumbnail || $member->shield_image)
                                        <a href="{{ \Illuminate\Support\Facades\Storage::url($member->shield_image ?? $member->shield_thumbnail) }}" target="_blank">
                                            <img 
                                                src="{{ \Illuminate\Support\Facades\Storage::url($member->shield_thumbnail ?? $member->shield_image) }}" 
                                                alt="{{ $member->name }}" 
                                            />
                                        </a>
                                    @endif
                                </td>
                            @endforeach
                            @if($memberRow->count() < 3)
                                @for($i = $memberRow->count(); $i < 3; $i++)
                                    <td></td>
                                @endfor
                            @endif
                        </tr>
                        <tr>
                            @foreach($memberRow as $member)
                                <td>
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
                                </td>
                            @endforeach
                            @if($memberRow->count() < 3)
                                @for($i = $memberRow->count(); $i < 3; $i++)
                                    <td></td>
                                @endfor
                            @endif
                        </tr>
                    @endforeach
                </tbody>
            </table>
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

<style>
#wacontent table td p.wap1,
#wacontent table td p.wap2,
#wacontent table td p.wap4,
#wacontent table td p.wap5 {
    text-align: center;
}

#wacontent table.wt td,
#wacontent table.erb td {
    text-align: center;
}
</style>
@endsection

