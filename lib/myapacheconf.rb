#!/usr/bin/env ruby

# file: myapacheconf.rb

require 'polyrex-headings'


class MyApacheConf
  using ColouredText

  attr_reader :to_h, :conf

  def initialize(raw_s, debug: false)

    @debug = debug

    contents = RXFHelper.read(raw_s).first
    puts 'content: ' + contents.inspect if @debug

    s = if contents =~ /^<\?ph / then
      contents
    else
'<?ph schema="sections[title,tags]/section[x]"?>
title: Apache Config
tags: apache    

' + contents

    end

    puts ('s: ' + s.inspect).debug if @debug
    ph = PolyrexHeadings.new(s, debug: debug) 
    
    @to_h = @h = ph.to_h.first.last
    puts @to_h.inspect

    @sip = []
    @extensions = []
    build()

  end


  private

  def build()

    @conf = @h[:proxypassthru][:'port 80'].map do |line|

      host, addr = line.split(/ +/,2)

s = "<VirtualHost *:80>
  ProxyPreserveHost On
  ProxyPass / http://#{addr}/
  ProxyPassReverse / http://#{addr}/
  ServerName #{host}
</VirtualHost>"

    [host, s]

    end.to_h    

  end
  

end

