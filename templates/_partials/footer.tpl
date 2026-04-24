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
