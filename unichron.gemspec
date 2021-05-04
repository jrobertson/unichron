Gem::Specification.new do |s|
  s.name = 'unichron'
  s.version = '0.3.5'
  s.summary = 'A universal chron tool.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/unichron.rb']
  s.add_runtime_dependency('subunit', '~> 0.8', '>=0.8.3')
  s.add_runtime_dependency('chronic_cron', '~> 0.6', '>=0.6.2')
  s.add_runtime_dependency('christian_calendar', '~> 0.1', '>=0.1.7')
  s.signing_key = '../privatekeys/unichron.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/unichron'
end
