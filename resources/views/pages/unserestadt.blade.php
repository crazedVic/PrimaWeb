@extends('layouts.app')

@section('content')
<div id="uscontent">
    <h1>Edmonton</h1>
    @php
        $hasGalleryImages = false;
        foreach($categories as $category) {
            if($category->galleryImages->count() > 0) {
                $hasGalleryImages = true;
                break;
            }
        }
    @endphp
    
    @if($hasGalleryImages)
        @foreach($categories as $category)
            @if($category->galleryImages->count() > 0)
                <div class="gallery-category" id="category-{{ $category->slug }}">
                    @if($category->name)
                        <h2 class="category-title">{{ $category->name }}</h2>
                    @endif
                    @if($category->description)
                        <p class="category-description">{{ $category->description }}</p>
                    @endif
                    <hr class="category-divider" />
                    <div class="gallery-grid">
                        @foreach($category->galleryImages as $image)
                            <div class="gallery-item">
                                <img 
                                    src="{{ \Illuminate\Support\Facades\Storage::url($image->image_path) }}" 
                                    alt=""
                                    loading="lazy"
                                />
                            </div>
                        @endforeach
                    </div>
                </div>
            @endif
        @endforeach
    @elseif($page->content && trim(strip_tags($page->content)))
        {!! $page->content !!}
    @else
        <p>No gallery images found. Please add categories and images in the admin panel.</p>
    @endif
</div>

<style>
#uscontent h1 {
    margin-bottom: 1rem;
    text-align: center;
}

#uscontent .category-title {
    text-align: center;
}

.gallery-category {
    margin-bottom: 3rem;
}

.gallery-category:first-of-type {
    margin-top: 0;
}

.category-title {
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
    color: #333;
}

.category-description {
    margin-bottom: 1rem;
    color: #666;
}

.category-divider {
    border: none;
    border-top: 2px solid #999;
    margin: 1.5rem auto 2rem auto;
    max-width: 80%;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

.gallery-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 1.5rem;
    margin-bottom: 2rem;
}

.gallery-item {
    flex: 0 0 200px;
    max-width: 200px;
}

.gallery-item {
    position: relative;
    overflow: hidden;
    border-radius: 4px;
    background: transparent;
    transition: transform 0.2s ease;
}

.gallery-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.gallery-item img {
    width: 100%;
    height: auto;
    display: block;
    object-fit: cover;
}

.gallery-item-title {
    padding: 0.5rem;
    font-weight: 600;
    font-size: 0.9rem;
    color: #333;
    margin: 0;
}

.gallery-item-description {
    padding: 0 0.5rem 0.5rem;
    font-size: 0.85rem;
    color: #666;
    margin: 0;
}

@media (max-width: 768px) {
    .gallery-grid {
        grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
        gap: 1rem;
    }
}
</style>
@endsection

