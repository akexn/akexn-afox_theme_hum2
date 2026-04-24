#!/bin/bash
echo "🎨 Шаг 2: Создание Header и Hero-секции..."

# 1. Обновляем HEADER (Шапка)
cat > templates/_partials/header.tpl << 'EOF'
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
EOF

# 2. Обновляем HERO-СЕКЦИЮ (Главная страница)
cat > templates/index.tpl << 'EOF'
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
EOF

# 3. Обновляем CSS (Стили)
cat > assets/css/layout/_header.scss << 'EOF'
.site-header {
  z-index: 1000;
  
  .top-bar {
    background-color: var(--color-text);
    color: #fff;
    font-size: 0.875rem;
    
    a:hover {
      color: var(--color-primary);
    }
  }

  .main-header {
    border-bottom: 1px solid var(--color-surface-border, #eee);
  }

  .action-link {
    display: flex;
    flex-direction: column;
    align-items: center;
    line-height: 1;
    
    &:hover {
      color: var(--color-primary) !important;
    }
  }
  
  .mobile-bottom-nav {
    z-index: 999;
    padding-bottom: env(safe-area-inset-bottom);
  }
}
EOF

cat > assets/css/pages/_homepage.scss << 'EOF'
.hero-section {
  background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
  
  .audience-card {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    border: 1px solid #eee !important;
    
    &:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
    }
    
    &.card-b2c {
      border-top: 4px solid var(--color-primary) !important;
    }
    
    &.card-b2b {
      border-top: 4px solid var(--color-secondary) !important;
    }
  }
}
EOF

# Добавляем импорты в main.scss (перезаписываем, чтобы добавить новые файлы)
cat > assets/css/main.scss << 'EOF'
@import 'variables';
@import '~bootstrap/scss/bootstrap';

// Layout
@import 'layout/header';
@import 'layout/footer';

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

// Utility overrides
a {
  text-decoration: none;
}
EOF

# Заглушки для отсутствующих SCSS файлов, чтобы сборка не падала
touch assets/css/layout/_footer.scss
touch assets/css/pages/_product.scss

echo "✅ Шаг 2 завершен!"
echo " Выполните: npm run build"
echo "🚀 Затем: git add . && git commit -m 'feat: add header and hero section' && git push"
