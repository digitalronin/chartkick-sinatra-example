#!/usr/bin/env ruby

require "bundler/setup"
require "sinatra"
require "chartkick"

template :layout do
  <<~LAYOUT
    <html>
    <head>
    <title>Sinatra ERB Chartkick Test</title>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="chartkick.js"></script>
    </head>
    <body>
    <%= yield %>
    </body>
    </html>
  LAYOUT
end

template :index do
  <<~INDEX
    <center>
    <h1>#{Time.now.inspect}</h1>
    <p>
    <%= pie_chart({"Football" => 10, "Basketball" => 5, "Hockey" => 2}) %>
    </p>
    </center>
  INDEX
end

get "/" do
  erb :index
end
