describe "MySQLにrootユーザでログインできる" do
    describe command('mysql -h ******.ap-northeast-1.rds.amazonaws.com -P 3306 -u root -p*** -e "SELECT user FROM mysql.user;"') do
        its(:exit_status) { should eq 0 }
    end
end
