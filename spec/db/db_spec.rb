describe "MySQLにrootユーザでログインできる" do
    describe command('mysql -h mf-kts-db.crqlrnx9g0bw.ap-northeast-1.rds.amazonaws.com -P 3306 -u root -pkts_demo -e "SELECT user FROM mysql.user;"') do
        its(:exit_status) { should eq 0 }
    end
end