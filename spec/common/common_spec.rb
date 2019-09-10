require 'spec_helper'
describe "ホスト設定" do
  # #ホスト名確認
  describe command('hostname') do
    its(:stdout) { should match /kts.m-fld.jp/ } #//にホスト名記載
  end

#タイムゾーン確認
  describe command('date') do
    its(:stdout) { should match /JST/ }
  end
  #SELinux確認
  describe selinux do
    it { should be_disabled }
  end
end