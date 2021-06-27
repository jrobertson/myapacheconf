# Introducing the MyApacheConf gem

    require 'myapacheconf'

    s = "# Apache



    ## ProxyPassThru



    ### Port 80



    www.jamesrobertson.me.uk 192.168.4.22:2022

    s1.jamesrobertson.me.uk 192.168.4.22:4012

    "
    mac = MyApacheConf.new(s)
    mac.conf.keys #=> ["www.jamesrobertson.me.uk", "s1.jamesrobertson.me.uk"]
    puts mac.conf['www.jamesrobertson.me.uk']

output:
<pre>
&lt;VirtualHost *:80&gt;
  ProxyPreserveHost On
  ProxyPass / http://192.168.4.22:2022/
  ProxyPassReverse / http://192.168.4.22:2022/
  ServerName www.jamesrobertson.me.uk
&lt;/VirtualHost&gt;
</pre>

## Resources

* myapacheconf https://rubygems.org/gems/myapacheconf

myapacheconf apache conf vhost apache2 
