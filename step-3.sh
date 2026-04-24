#!/bin/bash
echo "🛒 Шаг 3: Создание современной карточки товара..."

# 1. Обновляем шаблон миниатюры товара
cat > templates/catalog/_partials/miniatures/product.tpl << 'EOF'
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
EOF

# 2. Создаем CSS для карточки товара
cat > assets/css/components/_product-card.scss << 'EOF'
.product-miniature {
  background: var(--color-surface);
  border: 1px solid #eee;
  border-radius: var(--radius-md);
  overflow: hidden;
  transition: all 0.3s ease;
  height: 100%;
  display: flex;
  flex-direction: column;
  position: relative;

  &:hover {
    box-shadow: 0 10px 20px rgba(0,0,0,0.08);
    border-color: var(--color-primary);
    transform: translateY(-3px);
  }

  .thumbnail-container {
    display: flex;
    flex-direction: column;
    height: 100%;
  }

  .product-cover {
    position: relative;
    padding-top: 100%; // Квадратное изображение
    background: #f8f9fa;
    overflow: hidden;
    
    .product-thumbnail {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      
      img {
        max-width: 90%;
        max-height: 90%;
        object-fit: contain;
        transition: transform 0.3s ease;
      }
    }
  }

  .product-description {
    padding: 1rem;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }

  .product-title {
    font-size: 0.95rem;
    font-weight: 500;
    margin-bottom: 0.5rem;
    line-height: 1.4;
    
    a {
      color: var(--color-text);
      text-decoration: none;
      
      &:hover {
        color: var(--color-primary);
      }
    }
  }

  .product-price {
    margin-bottom: 0.5rem;
  }

  .product-flags {
    position: absolute;
    top: 10px;
    left: 10px;
    display: flex;
    flex-direction: column;
    gap: 5px;
    z-index: 2;

    .product-flag {
      padding: 4px 8px;
      font-size: 0.75rem;
      font-weight: 600;
      border-radius: 4px;
      text-transform: uppercase;
      
      &.discount {
        background-color: var(--color-error);
        color: white;
      }
      
      &.new {
        background-color: var(--color-success);
        color: white;
      }
    }
  }

  .product-actions {
    .btn {
      border-radius: var(--radius-sm);
      font-size: 0.85rem;
      padding: 0.5rem;
    }
  }
}
EOF

# 3. Обновляем main.scss, чтобы подключить новый компонент
cat > assets/css/main.scss << 'EOF'
@import 'variables';
@import '~bootstrap/scss/bootstrap';

// Layout
@import 'layout/header';
@import 'layout/footer';

// Components
@import 'components/product-card';

// Pages
@import 'pages/homepage';
@import 'pages/product';

// Base
body {
  font-family: var(--font-sans);
  color: var(--color-text);
  background-color: var(--color-bg);
  line-height: 1.5;
}

a {
  text-decoration: none;
}
EOF

echo "✅ Шаг 3 завершен!"
echo "🔨 Теперь соберите ассеты: npm run build"
echo "🚀 И запуште: git add . && git commit -m 'feat: update product card style' && git push"
