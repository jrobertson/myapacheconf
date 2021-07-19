Gem::Specification.new do |s|
  s.name = 'myapacheconf'
  s.version = '0.1.1'
  s.summary = 'Helps build apache2 virtual host configuration files from a simpler config file.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/myapacheconf.rb']
  s.add_runtime_dependency('polyrex-headings', '~> 0.2', '>=0.2.0')
  s.signing_key = '../privatekeys/myapacheconf.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/myapacheconf'
end
