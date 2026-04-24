#!/bin/bash

# Создаём структуру папок
mkdir -p config assets/{js,css} templates/{_partials,layouts,catalog/_partials/miniatures,checkout/_partials}

# Создаём config/theme.yml
cat > config/theme.yml << 'EOF'
name: afox_child
display_name: "AFOX Custom Theme"
version: 1.0.0
parent: hummingbird
author:
  name: "AFOX Team"
  email: "dev@afox.su"
meta:
  compatibility:
    from: 9.0.0
    to: ~9.1.0
  framework: bootstrap-v5.3.3
global_settings:
  default_layout: layout-full-width
  configuration:
    PS_IMAGE_QUALITY: webp
modules:
  to_enable:
    - ps_mainmenu
    - ps_searchbar
    - ps_contactinfo
    - ps_linklist
    - ps_customeraccountlinks
    - ps_currencyselector
    - ps_languageselector
    - ps_shoppingcart
  to_disable:
    - ps_socialfollow
    - ps_brandlist
    - ps_supplierlist
hooks:
  modules_to_unhook:
    displayHome:
      - ps_banner
      - ps_imageslider
available_layouts:
  layout-full-width:
    name: "Full Width"
    description: "No side columns"
  layout-both-columns:
    name: "Two Columns"
    description: "Left and right columns"
  layout-left-column:
    name: "Left Column"
    description: "Small left sidebar"
EOF

# Создаём package.json
cat > package.json << 'EOF'
{
  "name": "afox_child",
  "version": "1.0.0",
  "description": "AFOX Custom Theme for PrestaShop 9",
  "scripts": {
    "build": "encore production",
    "watch": "encore dev --watch",
    "dev": "encore dev"
  },
  "dependencies": {
    "@symfony/webpack-encore": "^4.5.0",
    "bootstrap": "^5.3.2",
    "sass": "^1.69.5",
    "sass-loader": "^13.3.2",
    "postcss-loader": "^7.3.3",
    "autoprefixer": "^10.4.16"
  },
  "devDependencies": {
    "@babel/core": "^7.23.3",
    "@babel/preset-env": "^7.23.3",
    "webpack-notifier": "^1.15.0"
  }
}
EOF

# Создаём webpack.config.js
cat > webpack.config.js << 'EOF'
const Encore = require('@symfony/webpack-encore');

if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev');
}

Encore
    .setOutputPath('assets/')
    .setPublicPath('/themes/afox_child/assets')
    .addEntry('app', './assets/js/app.js')
    .addStyleEntry('main', './assets/css/main.scss')
    .splitEntryChunks()
    .enableSingleRuntimeChunk()
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    .enableVersioning(Encore.isProduction())
    .configureBabelPresetEnv((config) => {
        config.useBuiltIns = 'usage';
        config.corejs = 3;
    })
    .enableSassLoader()
    .enablePostCssLoader();

module.exports = Encore.getWebpackConfig();
EOF

# Создаём assets/js/app.js
cat > assets/js/app.js << 'EOF'
import 'bootstrap';
import '../css/main.scss';

document.addEventListener('DOMContentLoaded', () => {
    console.log('AFOX Child Theme Initialized');
});
EOF

# Создаём assets/css/_variables.scss
cat > assets/css/_variables.scss << 'EOF'
:root {
  --color-primary: #2563EB;
  --color-primary-dark: #1D4ED8;
  --color-secondary: #F97316;
  --color-secondary-dark: #EA580C;
  --color-text: #1F2937;
  --color-bg: #F9FAFB;
  --color-surface: #FFFFFF;
  --color-success: #10B981;
  --color-warning: #F59E0B;
  --color-error: #EF4444;
  
  --spacing-xs: 0.25rem;
  --spacing-sm: 0.5rem;
  --spacing-md: 1rem;
  --spacing-lg: 1.5rem;
  --spacing-xl: 2rem;
  
  --radius-sm: 0.25rem;
  --radius-md: 0.5rem;
  --radius-lg: 0.75rem;
  
  --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
  --shadow-md: 0 4px 6px rgba(0,0,0,0.1);
  --shadow-lg: 0 10px 15px rgba(0,0,0,0.1);
  
  --font-sans: 'Inter', system-ui, -apple-system, sans-serif;
  --transition-base: 0.2s ease;
}
EOF

# Создаём assets/css/main.scss
cat > assets/css/main.scss << 'EOF'
@import 'variables';

// Import Bootstrap
@import '~bootstrap/scss/bootstrap';

// Base styles
body {
  font-family: var(--font-sans);
  color: var(--color-text);
  background-color: var(--color-bg);
  line-height: 1.5;
}

// Utility classes
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 var(--spacing-md);
}
EOF

# Создаём templates/index.tpl
cat > templates/index.tpl << 'EOF'
{extends file='parent:index.tpl'}

{block name='content' prepend}
  <!-- afox_child override -->
  <div class="container py-5">
    <h1>Hello from afox_child theme!</h1>
    <p class="lead">PrestaShop 9 + Hummingbird Child Theme</p>
  </div>
{/block}
EOF

# Создаём templates/_partials/header.tpl
cat > templates/_partials/header.tpl << 'EOF'
<!-- afox_child header override -->
<header class="site-header">
  {hook name='displayNav'}
  
  <div class="container">
    <div class="row align-items-center py-3">
      <div class="col-md-3">
        <a href="{$urls.base_url}">
          <img src="{$shop.logo}" alt="{$shop.name}" class="img-fluid">
        </a>
      </div>
      <div class="col-md-6">
        {hook name='displaySearch'}
      </div>
      <div class="col-md-3">
        {hook name='displayTop'}
      </div>
    </div>
  </div>
</header>
EOF

# Создаём templates/_partials/footer.tpl
cat > templates/_partials/footer.tpl << 'EOF'
<!-- afox_child footer override -->
<footer class="site-footer bg-dark text-white py-5">
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <p>&copy; {$shop.name} - {date('Y')}</p>
        {hook name='displayFooter'}
      </div>
    </div>
  </div>
</footer>
EOF

# Создаём templates/layouts/layout-full-width.tpl
cat > templates/layouts/layout-full-width.tpl << 'EOF'
{extends file='parent:layouts/layout-full-width.tpl'}

{block name='head' append}
  <link rel="stylesheet" href="{$assetPath}">
{/block}
EOF

echo "✅ Все файлы созданы!"
echo "📦 Теперь выполните: npm install && npm run build"
echo "🚀 Затем: git add . && git commit -m 'feat: complete theme structure' && git push"