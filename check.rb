#!/usr/bin/env ruby

lib = File.expand_path("..", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bundler'
Bundler.setup

require 'delcom_904008'
require 'open-uri'

light = Delcom::SignalIndicator.new
begin
  colour = open("http://url-to-greenscreen/colour").read
  light.send(colour)
ensure
  light.close
end
