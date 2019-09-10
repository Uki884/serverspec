describe "nginxインストール確認" do
    describe package('nginx') do
        it { should be_installed }
    end
    describe service('nginx') do
        it { should be_enabled }
        it { should be_running }
    end
end

describe "nginxバージョン確認" do
    describe command('nginx -v |grep nginx') do
        its(:stderr) { should match /1.17.*/ }
    end
end

describe "nginx設定" do
    describe file('/etc/nginx/nginx.conf') do
    #ファイルが存在してること
    it { should be_file }
    #セキュリティ設定されていること
    its(:content) { should match /server_tokens off;/}
    its(:content) { should match /add_header X-Frame-Options SAMEORIGIN;/}
    its(:content) { should match /add_header X-XSS-Protection "1; mode=block";/}
    its(:content) { should match /add_header X-Content-Type-Options nosniff;/}
    its(:content) { should match /sendfile off;/}
    its(:content) { should match /etag off;/}
    its(:content) { should match /if_modified_since off;/}
    end
    #virtualhost設定確認
    describe file('/etc/nginx/conf.d/moonfield.conf') do
    #ファイルが存在してること
    it { should be_file }
    #80番をlistenしてること
    its(:content) { should match /listen 80;/}
    #ドメインが指定されていること確認
    its(:content) { should match /server_name kts\.m-fld\.jp;/ }
    #httpがhttpsにフォワーディングされること
    #its(:content) { should match /return 301 https://$host$request_uri;/}
    end
end