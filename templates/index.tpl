{extends file='parent:index.tpl'}

{block name='content' prepend}
  <!-- afox_child Hero Section -->
  <section class="hero-section position-relative overflow-hidden">
    <div class="container py-5">
      <div class="row align-items-center">
        <div class="col-lg-12 text-center mb-5">
          <h1 class="display-5 fw-bold text-dark">Техника для бизнеса и дома</h1>
          <p class="lead text-muted">Выберите, как вы хотите покупать</p>
        </div>
      </div>

      <div class="row g-4 justify-content-center">
        <!-- B2C Card -->
        <div class="col-md-6 col-lg-5">
          <div class="audience-card card-b2c h-100 text-center p-4 border rounded-4 bg-white shadow-sm">
            <div class="icon-box bg-light-blue mb-3 rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
              <i class="material-icons text-primary fs-3">shopping_basket</i>
            </div>
            <h3 class="h4 fw-bold">Частным лицам</h3>
            <ul class="list-unstyled text-start mx-auto" style="max-width: 250px;">
              <li class="mb-2">✅ Розничные цены</li>
              <li class="mb-2">✅ Быстрая доставка</li>
              <li class="mb-2">✅ Оплата картой</li>
            </ul>
            <a href="{$urls.pages.category}" class="btn btn-primary btn-lg w-100 mt-3">Перейти в каталог</a>
          </div>
        </div>

        <!-- B2B Card -->
        <div class="col-md-6 col-lg-5">
          <div class="audience-card card-b2b h-100 text-center p-4 border rounded-4 bg-white shadow-sm">
            <div class="icon-box bg-light-orange mb-3 rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
              <i class="material-icons text-secondary fs-3">business</i>
            </div>
            <h3 class="h4 fw-bold">Для бизнеса</h3>
            <ul class="list-unstyled text-start mx-auto" style="max-width: 250px;">
              <li class="mb-2">🏢 Оптовые скидки</li>
              <li class="mb-2">📄 Работа с НДС</li>
              <li class="mb-2">🤝 Персональный менеджер</li>
            </ul>
            <a href="#" class="btn btn-secondary btn-lg w-100 mt-3">Получить КП</a>
          </div>
        </div>
      </div>
    </div>
  </section>
{/block}

{block name='hook_home'}
  <!-- Оставляем хуки для модулей (новинки, слайдеры) ниже Hero -->
  {hook h='displayHome'}
{/block}
