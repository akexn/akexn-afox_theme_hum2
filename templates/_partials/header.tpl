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
