Gem::Specification.new do |s|
  s.name = 'unichron'
  s.version = '0.1.0'
  s.summary = 'A universal chron tool.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/unichron.rb']
  s.add_runtime_dependency('chronic_cron', '~> 0.6', '>=0.6.1')
  s.signing_key = '../privatekeys/unichron.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/unichron'
end
