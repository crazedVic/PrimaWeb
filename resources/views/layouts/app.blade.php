<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prima Canadensis</title>
    
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    
    <!-- Legacy CSS files (loaded after Vite for backward compatibility) -->
    <link rel="stylesheet" type="text/css" href="{{ asset('css/reset-fonts-grids.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/prima.css') }}" />
    
    
  </head>
  <body>
    <div id="doc3">

      <div id="hd">
        <div id="owlleft"></div>
        <div id="owlright"></div>
        <div id="title"></div>
      </div>

      <div id="bd">
        <div id="yui-main">
          <div class="yui-b">
            <div class="yui-g">
              @yield('content')
           </div>
          </div>
        </div>

      <div id="ft">
        <hr />
        <a href="https://www.arrai.com" target="_blank">Website hosting donated by array innovations</a>
		<p class="spf4">Schlaraffia&reg; und Allschlaraffia&reg; are Registred Trademarks of Verband Allschlaraffia&reg; in Bern (CH) </p>
      </div>

    </div>
    <script src="{{ asset('js/menu.js') }}"></script>
  </body>
</html>

