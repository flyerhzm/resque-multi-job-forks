$LOAD_PATH.unshift 'lib'

require 'fileutils'
require 'rake/testtask'
require 'yard/rake/yardoc_task'

task :default => :test

# Test task.
Rake::TestTask.new(:test) do |task|
  task.test_files = FileList['test/test_*.rb']
  task.verbose = true
end

# docs task.
YARD::Rake::YardocTask.new :yardoc do |t|
    t.files   = ['lib/**/*.rb']
    t.options = ['--output-dir', "doc/",
                 '--files', 'LICENSE',
                 '--readme', 'README.rdoc',
                 '--title', 'lantins-resque-multi-job-forks documentation']
end