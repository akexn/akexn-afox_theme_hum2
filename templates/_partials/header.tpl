<!-- afox_child header override -->
<header class="site-header">
  <!-- Top Bar (Контакты и доп. ссылки) -->
  <div class="top-bar d-none d-lg-block">
    <div class="container d-flex justify-content-between align-items-center py-2">
      <div class="top-bar-left">
        <span class="me-3"><i class="material-icons tiny me-1">location_on</i> Москва</span>
        <a href="tel:+74950000000" class="text-white text-decoration-none">+7 (495) 000-00-00</a>
      </div>
      <div class="top-bar-right">
        <a href="#" class="text-white text-decoration-none me-3">Доставка</a>
        <a href="#" class="text-white text-decoration-none me-3">Контакты</a>
        {hook name='displayNav'}
      </div>
    </div>
  </div>

  <!-- Main Header (Лого, Поиск, Действия) -->
  <div class="main-header bg-white py-3 shadow-sm">
    <div class="container">
      <div class="row align-items-center">
        <!-- Логотип -->
        <div class="col-6 col-lg-2 text-center text-lg-start">
          <a href="{$urls.base_url}" class="logo-link">
            <img src="{$shop.logo}" alt="{$shop.name}" class="img-fluid" style="max-height: 50px;">
          </a>
        </div>

        <!-- Поиск -->
        <div class="col-12 col-lg-6 my-2 my-lg-0">
          <div class="search-container">
            {hook name='displaySearch'}
          </div>
        </div>

        <!-- Иконки действий (Корзина, Аккаунт) -->
        <div class="col-6 col-lg-4 text-end">
          <div class="header-actions d-flex justify-content-end align-items-center gap-3">
            <a href="#" class="action-link text-dark" aria-label="Аккаунт">
              <i class="material-icons">person</i>
              <span class="d-none d-md-inline">Войти</span>
            </a>
            <a href="#" class="action-link text-dark position-relative" aria-label="Корзина">
              <i class="material-icons fs-4">shopping_cart</i>
              <span class="badge bg-primary rounded-pill position-absolute top-0 start-100 translate-middle">0</span>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Mobile Bottom Nav (Только для мобильных, пока заглушка) -->
  <div class="mobile-bottom-nav d-lg-none fixed-bottom bg-white border-top d-flex justify-content-around py-2">
     <a href="{$urls.base_url}" class="text-dark text-center text-decoration-none">
       <i class="material-icons d-block">home</i>
       <small>Главная</small>
     </a>
     <a href="#" class="text-dark text-center text-decoration-none">
       <i class="material-icons d-block">search</i>
       <small>Поиск</small>
     </a>
     <a href="#" class="text-dark text-center text-decoration-none">
       <i class="material-icons d-block">shopping_cart</i>
       <small>Корзина</small>
     </a>
  </div>
</header>
