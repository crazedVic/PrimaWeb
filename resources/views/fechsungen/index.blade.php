@extends('layouts.app')

@section('content')
<div id="fecontent">
    @foreach($fechsungen as $index => $fechsung)
        <div class="fe{{ $index + 1 }}">
            @php
                // Use Storage::url() for Filament standard file paths
                $imageUrl = $fechsung->image ? \Illuminate\Support\Facades\Storage::url($fechsung->image) : null;
                $pdfUrl = $fechsung->pdf_file ? \Illuminate\Support\Facades\Storage::url($fechsung->pdf_file) : null;
                // If pdf_file is actually an image (jpg/png), use it as the link target
                $linkUrl = $pdfUrl ?: $imageUrl;
            @endphp
            
            @if($linkUrl)
                <a href="{{ $linkUrl }}" target="_blank">
            @endif
            
            @if($imageUrl)
                <img src="{{ $imageUrl }}" alt="{{ $fechsung->title }}" />
            @endif
            
            @if($pdfUrl || $imageUrl)
                </a>
            @endif
            
            <p>
                <br>{{ $fechsung->title }},
                @if($fechsung->author)
                    <br>gefechst von {{ $fechsung->author }}
                    @if($fechsung->author_meeting_number)
                        ({{ $fechsung->author_meeting_number }})
                    @endif
                @endif
                @if($fechsung->meeting_reference)
                    <br>{{ $fechsung->meeting_reference }}
                @endif
                @if($fechsung->description)
                    <br>{{ $fechsung->description }}
                @endif
            </p>
        </div>
    @endforeach
</div>

<style>
#fecontent {
    text-align: center;
}
</style>
@endsection

