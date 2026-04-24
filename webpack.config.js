const Encore = require('@symfony/webpack-encore');

if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev');
}

Encore
    // Куда компилировать файлы (локальный путь)
    .setOutputPath('public/assets/')
    // Публичный URL для браузера
    .setPublicPath('/themes/afox_child/assets')
    // Префикс для ключей в manifest.json (исправляет ошибку)
    .setManifestKeyPrefix('assets/')
    
    // Точки входа
    .addEntry('app', './assets/js/app.js')
    .addStyleEntry('main', './assets/css/main.scss')
    
    // Оптимизации
    .splitEntryChunks()
    .enableSingleRuntimeChunk()
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    .enableVersioning(Encore.isProduction())
    
    // Babel для совместимости с браузерами
    .configureBabelPresetEnv((config) => {
        config.useBuiltIns = 'usage';
        config.corejs = 3;
    })
    
    // Препроцессоры
    .enableSassLoader()
    .enablePostCssLoader();

module.exports = Encore.getWebpackConfig();
