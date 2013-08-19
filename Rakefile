#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "event_api_49st"
  t.test_files = FileList["test/event_api_49st/*_test.rb"]
  t.verbose = true
end

task :default => ["test"]

