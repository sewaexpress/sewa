<?php echo '<?xml version="1.0" encoding="UTF-8"?>'; ?>

<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    @if($categories != null)
        @foreach ($categories as $item)
            <sitemap>
                <loc>{{ route('products.category',['category_slug' => $item->slug]) }}</loc>
                <lastmod>{{ $item->updated_at->tz('UTC')->toAtomString() }}</lastmod>
                <priority>0.8</priority>
            </sitemap>            
        @endforeach
    @endif
    @if($subcategories != null)
        @foreach ($subcategories as $item)
            <sitemap>
                <loc>{{ route('products.subcategory',['subcategory_slug' => $item->slug]) }}</loc>
                <lastmod>{{ $item->updated_at->tz('UTC')->toAtomString() }}</lastmod>
                <priority>0.8</priority>
            </sitemap>            
        @endforeach
    @endif
    @if($subsubcategories != null)
        @foreach ($subsubcategories as $item)
            <sitemap>
                <loc>{{ route('products.subsubcategory',['subsubcategory_slug' => $item->slug]) }}</loc>
                <lastmod>{{ $item->updated_at->tz('UTC')->toAtomString() }}</lastmod>
                <priority>0.8</priority>
            </sitemap>            
        @endforeach
    @endif
    @if($products != null)
        @foreach ($products as $item)
            <sitemap>
                <loc>{{ route('product',['slug' => $item->slug]) }}</loc>
                <lastmod>{{ $item->updated_at->tz('UTC')->toAtomString() }}</lastmod>
                <priority>0.8</priority>
            </sitemap>            
        @endforeach
    @endif
</sitemapindex>