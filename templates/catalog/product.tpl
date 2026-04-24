{extends file='parent:catalog/product.tpl'}

{block name='content'}
  <div class="product-page-container">
    <div class="row">
      <!-- Галерея изображений -->
      <div class="col-lg-6 mb-4 mb-lg-0">
        <div class="product-images-wrapper bg-white rounded-3 p-3 border">
          {block name='product_cover_and_thumbnails'}
            {include file='catalog/_partials/product-cover-thumbnails.tpl'}
          {/block}
        </div>
      </div>

      <!-- Информация о товаре -->
      <div class="col-lg-6">
        <div class="product-info-wrapper">
          {block name='product_name'}
            <h1 class="h2 fw-bold mb-2" itemprop="name">{$product.name}</h1>
          {/block}

          {block name='product_reference'}
            <p class="text-muted mb-3 small">Артикул: {$product.reference_to_display}</p>
          {/block}

          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}

          {block name='product_description_short'}
            <div class="product-description-short my-3 text-dark">
              {$product.description_short nofilter}
            </div>
          {/block}

          {block name='product_customization'}
            {include file='catalog/_partials/product-customization.tpl' product=$product}
          {/block}

          {block name='product_add_to_cart'}
            <div class="product-add-to-cart mt-3">
              {include file='catalog/_partials/product-add-to-cart.tpl'}
            </div>
          {/block}

          {block name='product_flags'}
            {include file='catalog/_partials/product-flags.tpl'}
          {/block}
        </div>
      </div>
    </div>

    <!-- Блок доверия -->
    <div class="row mt-4">
      <div class="col-12">
        <div class="trust-badges d-flex justify-content-around flex-wrap text-center py-4 bg-light rounded-3">
          <div class="badge-item px-3">
            <i class="material-icons text-primary fs-3">local_shipping</i>
            <div class="mt-2 small fw-medium">Доставка 1-3 дня</div>
          </div>
          <div class="badge-item px-3">
            <i class="material-icons text-primary fs-3">verified_user</i>
            <div class="mt-2 small fw-medium">Гарантия 12 мес</div>
          </div>
          <div class="badge-item px-3">
            <i class="material-icons text-primary fs-3">payment</i>
            <div class="mt-2 small fw-medium">Безопасная оплата</div>
          </div>
          <div class="badge-item px-3">
            <i class="material-icons text-primary fs-3">support_agent</i>
            <div class="mt-2 small fw-medium">Поддержка 24/7</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Вкладки: Описание и Характеристики -->
    <div class="row mt-4 mb-5">
      <div class="col-12">
        <ul class="nav nav-tabs border-0" id="productTabs" role="tablist">
          <li class="nav-item">
            <a class="nav-link active fw-medium px-0 me-4" data-bs-toggle="tab" href="#tab-description" role="tab">Описание</a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-medium px-0 me-4" data-bs-toggle="tab" href="#tab-features" role="tab">Характеристики</a>
          </li>
        </ul>
        <div class="tab-content pt-3" id="productTabsContent">
          <div class="tab-pane fade show active" id="tab-description" role="tabpanel">
            <div class="product-description-full">
              {$product.description nofilter}
            </div>
          </div>
          <div class="tab-pane fade" id="tab-features" role="tabpanel">
            {if $product.features}
              <table class="table table-bordered table-hover bg-white mb-0">
                <tbody>
                  {foreach $product.features as $feature}
                    <tr>
                      <td class="fw-bold bg-light text-muted" style="width: 35%;">{$feature.name|escape:'html':'UTF-8'}</td>
                      <td>{$feature.value|escape:'html':'UTF-8'}</td>
                    </tr>
                  {/foreach}
                </tbody>
              </table>
            {else}
              <p class="text-muted fst-italic">Характеристики не указаны производителем.</p>
            {/if}
          </div>
        </div>
      </div>
    </div>
  </div>
{/block}
