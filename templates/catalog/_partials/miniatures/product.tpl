<article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
  <div class="thumbnail-container">
    
    <!-- Изображение -->
    <div class="product-cover">
      <a href="{$product.url}" class="thumbnail product-thumbnail">
        <img
          src = "{$product.cover.bySize.home_default.url}"
          alt = "{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
          loading="lazy"
          data-full-size-image-url = "{$product.cover.bySize.large_default.url}"
          width="{$product.cover.bySize.home_default.width}"
          height="{$product.cover.bySize.home_default.height}"
        >
      </a>
      
      <!-- Лейблы (Скидка, Новинка) -->
      <div class="product-flags">
        {foreach $product.flags as $flag}
          <span class="product-flag {$flag.type}">{$flag.label}</span>
        {/foreach}
      </div>
    </div>

    <!-- Информация -->
    <div class="product-description">
      <h3 class="h6 product-title" itemprop="name">
        <a href="{$product.url}" itemprop="url" content="{$product.url}">{$product.name|truncate:64:'...'}</a>
      </h3>
      
      <div class="product-price-and-shipping">
        {if $product.show_price}
          <div class="product-price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
            <link itemprop="availability" href="http://schema.org/{if $product.quantity > 0}InStock{else}OutOfStock{/if}"/>
            
            {if $product.has_discount}
              {if $product.discount_type === 'percentage'}
                <span class="regular-price text-muted text-decoration-line-through me-2">{$product.regular_price}</span>
              {/if}
              <span itemprop="price" class="price text-primary fw-bold fs-5">{$product.price}</span>
            {else}
              <span itemprop="price" class="price text-primary fw-bold fs-5">{$product.price}</span>
            {/if}
          </div>
        {/if}
      </div>

      <!-- Кнопки действий -->
      <div class="product-actions mt-2">
        <button
          class="btn btn-primary add-to-cart w-100"
          data-button-action="add-to-cart"
          type="button"
        >
          <i class="material-icons me-1">shopping_cart</i> В корзину
        </button>
      </div>
    </div>
  </div>
</article>
