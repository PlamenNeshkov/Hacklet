# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile +=
  ['bootstrap/bootstrap.min.css',
   'smarty/essentials.css',
   'smarty/layout.css',
   'smarty/header-1.css',
   'smarty/color-scheme/blue.css',
   'jquery/jquery-2.1.4.min.js',
   'smarty/scripts.js',
   'smarty/contact.js',
   '*.png',
   '*.jpg',
   '*.jpeg',
   '*.gif',
   '*.svg',
   '*.eot',
   '*.woff',
   '*.woff2',
   '*.ttf'
   ]
