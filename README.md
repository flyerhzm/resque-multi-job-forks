lantins-resque-multi-job-forks
==============================

If you have very frequent and fast resque jobs, the overhead of forking and
running your after_fork hook, might get too big. Using this resque plugin, you
can have your workers perform more than one job, before terminating.

Install & Quick Start
---------------------

To install:

    $ gem install lantins-resque-multi-job-forks

You'll need to require the code; perhaps inside your `resque:setup` hook of
your `Rakefile` ?:

    namespace :resque do
      task :setup do
        require 'resque-multi-job-forks'
      end
    end

### Limit Per Fork

You have two limit options available, only one can be used at once.

  * `JOBS_PER_FORK` - number of jobs to process per fork.
  * `MINUTES_PER_FORK` - process jobs for *n* minutes per fork.

**Default:** process jobs for *1 minute* before terminating.

### Usage Example

Process jobs for 5 minutes per fork:

    $ QUEUE=* MINUTES_PER_FORK=5 rake resque:work

Process 5000 jobs per fork:

    $ QUEUE=* JOBS_PER_FORK=5000 rake resque:work

### Resque Hooks

This plugin also defines a new hook, that gets called right before the fork
terminates:

    Resque.before_child_exit do |worker|
      worker.log("#{worker.jobs_processed} were processed in this fork")
    end

Note on Patches/Pull Requests
-----------------------------

  * Fork the project.
  * Make your feature addition or bug fix.
  * Add tests for it. This is important so I don't break it in a
    future version unintentionally.
  * Commit, do not mess with rakefile, version, or history.
    (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
  * Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2010 Mick Staugaard. See LICENSE for details.
