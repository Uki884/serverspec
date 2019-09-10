describe "efsがマウントされている事" do
  describe command('df -Th |grep fs-a8097a89.efs.ap-northeast-1.amazonaws.com') do
    its(:stdout) { should match /\mnt\/efs/ }
  end
end