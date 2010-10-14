spec = Gem::Specification.new do |s|
  s.name              = 'lantins-resque-multi-job-forks'
  s.version           = '0.3.0'
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = 'A Resque plugin; allows workers to process multiple jobs per fork.'
  s.homepage          = 'http://github.com/lantins/resque-multi-job-forks/tree/personal_gem'
  s.authors           = ['Mick Staugaard']
  s.email             = 'mick@staugaard.com'
  s.has_rdoc          = false

  s.files             = %w(LICENSE Rakefile README.rdoc)
  s.files            += Dir.glob('{test/*,lib/**/*}')
  s.require_paths     = ['lib']

  s.add_dependency('resque', '>= 1.9.10')
  s.add_development_dependency('test-unit')
  s.add_development_dependency('simplecov', '>= 0.3.0')

  s.description       = <<-EOL
  When your resque jobs are frequent and fast, the overhead of forking and
  running your after_fork might get too big.

  You may limit by either job limit or time limit per fork.
  EOL
end