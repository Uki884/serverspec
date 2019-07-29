require 'rake'
require 'rspec/core/rake_task'
require 'yaml'
require 'highline/import'

argv = ARGV
env = argv.length < 2 ? 'development' : argv[1]

case env
when 'production' then
  yaml_file = 'production.yml'
when 'staging' then
  yaml_file = 'staging.yml'
when 'development' then
  yaml_file = 'development.yml'
else
  puts 'Error: Invalid argument, choose one out of production, staging, development'
  exit(1)
end

properties = YAML.load_file("properties/#{yaml_file}")

ENV['SSH_USER'] = ask("SSHログインするユーザー名を入力してください: ") { |q| q.echo = true }
# ENV['SSH_PASSWORD'] = ask("Enter ssh password: ") { |q| q.echo = false }

desc "Run serverspec to all hosts"
task :serverspec => 'serverspec:all'

namespace :serverspec do
  task :all => properties.keys.map {|key| 'serverspec:' + key }
  properties.keys.each do |key|
    desc "Run serverspec to #{key}"
    RSpec::Core::RakeTask.new(key.to_sym) do |t|
      ENV['TARGET_HOST'] = properties[key][:hostname]
      t.pattern = 'spec/{' + properties[key][:roles].join(',') + '}/*_spec.rb'
      t.fail_on_error = false
    end
  end
end