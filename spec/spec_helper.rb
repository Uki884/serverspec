require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'

set :backend, :ssh
set :path, '/sbin:/usr/sbin:$PATH'

RSpec.configure do |c|
  c.before :all do
    set :host, ENV['TARGET_HOST']
    options = Net::SSH::Config.for(c.host)
    options[:user] = ENV['SSH_USER']
    # options[:password] = ENV['SSH_PASSWORD']
    set :ssh_options, options
  end
end