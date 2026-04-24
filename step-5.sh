#!/bin/bash
echo "🦶 Шаг 5: Footer и Глобальные стили..."

# 1. Обновляем main.scss (Добавляем шрифты и импорты)
cat > assets/css/main.scss << 'EOF'
@import 'variables';

/* --- Import Google Fonts & Icons --- */
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
@import url('https://fonts.googleapis.com/icon?family=Material+Icons');

@import '~bootstrap/scss/bootstrap';

/* --- Layout --- */
@import 'layout/header';
@import 'layout/footer';

/* --- Components --- */
@import 'components/product-card';

/* --- Pages --- */
@import 'pages/homepage';
@import 'pages/product';

/* --- Global Base Styles --- */
body {
  font-family: 'Inter', var(--font-sans);
  color: var(--color-text);
  background-color: var(--color-bg);
  line-height: 1.6;
  overflow-x: hidden; /* Prevent horizontal scroll on mobile */
}

a { 
  text-decoration: none; 
  color: inherit; 
  transition: color 0.2s ease;
  
  &:hover {
    color: var(--color-primary);
  }
}

h1, h2, h3, h4, h5, h6 {
  font-weight: 600;
  margin-bottom: 0.75rem;
  color: var(--color-text);
}

// Material Icons override
.material-icons {
  vertical-align: middle;
  font-size: inherit;
}
EOF

# 2. Создаем шаблон Footer
cat > templates/_partials/footer.tpl << 'EOF'
<footer class="site-footer bg-dark text-white pt-5 pb-3">
  <div class="container">
    <div class="row">
      <!-- Col 1: Information -->
      <div class="col-lg-3 col-md-6 mb-4">
        <h5 class="text-uppercase fw-bold mb-3 fs-6 text-primary">Информация</h5>
        <ul class="list-unstyled">
          <li><a href="#" class="text-white-50 mb-2 d-block">О компании</a></li>
          <li><a href="#" class="text-white-50 mb-2 d-block">Доставка и оплата</a></li>
          <li><a href="#" class="text-white-50 mb-2 d-block">Контакты</a></li>
          <li><a href="#" class="text-white-50 mb-2 d-block">Возврат товара</a></li>
        </ul>
      </div>

      <!-- Col 2: My Account -->
      <div class="col-lg-3 col-md-6 mb-4">
        <h5 class="text-uppercase fw-bold mb-3 fs-6 text-primary">Мой аккаунт</h5>
        <ul class="list-unstyled">
          <li><a href="#" class="text-white-50 mb-2 d-block">Мои заказы</a></li>
          <li><a href="#" class="text-white-50 mb-2 d-block">Избранное</a></li>
          <li><a href="#" class="text-white-50 mb-2 d-block">Настройки</a></li>
        </ul>
      </div>

      <!-- Col 3: Newsletter -->
      <div class="col-lg-3 col-md-6 mb-4">
        <h5 class="text-uppercase fw-bold mb-3 fs-6 text-primary">Подписка</h5>
        <p class="text-white-50 small">Подпишитесь на новости и акции.</p>
        <div class="input-group mb-3">
          <input type="email" class="form-control bg-dark border-secondary text-white" placeholder="Email адрес" aria-label="Email">
          <button class="btn btn-primary" type="button"><i class="material-icons tiny">send</i></button>
        </div>
      </div>

      <!-- Col 4: Contact -->
      <div class="col-lg-3 col-md-6 mb-4">
        <h5 class="text-uppercase fw-bold mb-3 fs-6 text-primary">Контакты</h5>
        <div class="text-white-50 small">
           <p class="mb-2"><i class="material-icons me-2 text-primary">location_on</i> г. Москва, ул. Примерная, 10</p>
           <p class="mb-2"><i class="material-icons me-2 text-primary">phone</i> +7 (495) 000-00-00</p>
           <p class="mb-2"><i class="material-icons me-2 text-primary">email</i> info@afox.su</p>
        </div>
      </div>
    </div>
    
    <!-- Bottom Copyright Bar -->
    <hr class="border-secondary my-4">
    <div class="row align-items-center">
      <div class="col-md-6 text-center text-md-start small text-white-50">
        &copy; {date('Y')} <a href="{$urls.pages.index}" class="text-white fw-bold">{$shop.name}</a>. Все права защищены.
      </div>
      <div class="col-md-6 text-center text-md-end">
        {hook name='displayFooter'}
      </div>
    </div>
  </div>
</footer>
EOF

# 3. Создаем CSS для Footer
cat > assets/css/layout/_footer.scss << 'EOF'
.site-footer {
  border-top: 4px solid var(--color-primary);
  font-size: 0.9rem;
  
  h5 {
    letter-spacing: 0.5px;
    color: #fff !important;
  }
  
  a {
    transition: all 0.3s ease;
    display: inline-block;
    
    &:hover {
      color: var(--color-primary) !important;
      transform: translateX(5px);
    }
  }
  
  .input-group {
    .form-control {
      border-right: none;
      &:focus {
        box-shadow: none;
        border-color: var(--color-primary);
        background-color: #212529;
      }
    }
    .btn {
      border-left: none;
      background-color: var(--color-primary);
      border-color: var(--color-primary);
      &:hover {
        background-color: var(--color-primary-dark);
      }
    }
  }
  
  .material-icons {
    font-size: 1.2rem;
  }
}
EOF

echo "✅ Шаг 5 завершен!"
echo " Подвал сайта и шрифты готовы."
echo "🔨 Теперь соберите ассеты: npm run build"
echo "🚀 И запуште: git add . && git commit -m 'feat: add footer and global typography styles' && git push"
