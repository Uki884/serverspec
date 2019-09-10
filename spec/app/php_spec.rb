require 'spec_helper'

  #インストールアプリ確認
  describe package('php-cli') do
    it { should be_installed }
  end

  #PHPモジュール確認
  %w{php-gd php-common php-json php-mbstring php-pdo php-xml php-xmlrpc php-pecl-zip php-pecl-mcrypt php-mysqlnd php-fpm}.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
  #サービス確認
  describe service('php-fpm') do
    it { should be_enabled }
    it { should be_running }
  end

  #バージョン確認
  describe command('php -v |grep PHP') do
    its(:stdout) { should match /7.2.*/ }
  end
  #httpをlistenしてること
  describe port(80) do
    it { should be_listening }
  end
  #httpsをlistenしてること
  # describe port(443) do
  #   it { should be_listening }
  # end
  describe 'PHP設定確認' do
    context php_config('default_mimetype') do
      its(:value) { should eq 'text/html' }
    end
    context php_config('expose_php') do
      its(:value) { should eq '' }
    end
    context php_config('upload_max_filesize') do
      its(:value) { should eq '256M' }
    end
    context php_config('post_max_size') do
      its(:value) { should eq '8M' }
    end
    context php_config('memory_limit') do
      its(:value) { should eq '1024M' }
    end
end

