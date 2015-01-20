#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => sub {
    my $c = shift;
    $c->render('index');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h2>index</h2>
<form method="post" action="/post">
  <div>
    <span>운송장 번호</span>
    <a href="#" id="waybill" data-type="waybill"></a>
  </div>
  <div>
    <span>주소</span>
    <a href="#" id="address" data-type="address">비어있음</a>
  </div>
</form>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- css -->
    <link rel="stylesheet" href="/assets/components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/components/x-editable/dist/bootstrap3-editable/css/bootstrap-editable.css">
    <link rel="stylesheet" href="/assets/css/address.css">
    <style>
      body { padding: 1em }
    </style>

    <!-- js -->
    <script src="/assets/components/jquery/dist/jquery.min.js"></script>
    <script src="/assets/components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/assets/components/x-editable/dist/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
    <script src="/assets/js/waybill.js"></script>
    <script src="/assets/js/address.js"></script>
    <script src="/assets/js/index.js"></script>

    <title><%= title %></title>
  </head>
  <body>
    <div id="container">
      <h1>Welcome</h1>
      <%= content %>
    </div>
  </body>
</html>
