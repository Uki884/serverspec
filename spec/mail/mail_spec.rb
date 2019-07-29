describe "sendmailが導入されてること" do
    describe package('sendmail') do
        it { should be_installed }
    end
    describe service('sendmail') do
        it { should be_enabled }
        it { should be_running }
    end
end

describe "sendmailでテストメール送信" do
    describe command('echo テストメール |sendmail hayashi@keylink.co.jp') do
    its(:exit_status) { should eq 0 }
    end
end