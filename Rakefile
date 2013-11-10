require 'rake'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'rspec/core/rake_task'

task :default => [:spec, :lint]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

desc "Run puppet in noop mode and check for syntax errors."
task :validate do
   Dir['manifests/**/*.pp'].each do |path|
     sh "puppet parser validate --noop #{path}"
   end
end
