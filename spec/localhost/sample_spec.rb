require 'spec_helper'

# 変数宣言
listen_port = 80
s3_bucket = "s3bucket-cfn-2508"

# git インストール確認
describe package('git') do
  it { should be_installed }
end

# nginx インストール確認
describe package('nginx') do
  it { should be_installed }
end

# Ruby バージョン確認
describe command('ruby -v') do
  its(:stdout) { should match /3\.2\.3/ }
  its(:exit_status) { should eq 0 }
end

# Rails バージョン確認
describe command("bash -lc 'cd /home/ec2-user/raisetech-live8-sample-app && bundle exec rails -v'") do
  its(:stdout) { should match /Rails 7\.1\.3\.2/ }
  its(:exit_status) { should eq 0 }
end

# RVM バージョン確認
describe command("bash -lc 'rvm -v'") do
  its(:stdout) { should match /rvm \d+\.\d+\.\d+/ }
  its(:exit_status) { should eq 0 }
end

# Node バージョン確認
describe command('node -v') do
  its(:stdout) { should match /v17\.9\.1/ }
  its(:exit_status) { should eq 0 }
end

# Yarn バージョン確認
describe command('yarn -v') do
  its(:stdout) { should match /1\.22\.19/ }
  its(:exit_status) { should eq 0 }
end

# Active Storage のテーブル確認
%w[active_storage_blobs active_storage_attachments].each do |table|
  describe command("mysql -u admin -pPassword -h rds-mysql-cfn.c9uo824ccan0.ap-northeast-1.rds.amazonaws.com -e \"SHOW TABLES LIKE '#{table}';\" lect_cfnDB") do
    its(:stdout) { should match /#{table}/ }
    its(:exit_status) { should eq 0 }
  end
end

# S3 バケット確認
describe command("aws s3 ls s3://#{s3_bucket}") do
  its(:exit_status) { should eq 0 }
end

# Puma の UNIX ソケット確認
describe file('//home/ec2-user/raisetech-live8-sample-app/tmp/sockets/puma.sock') do
  it { should exist }
end

# port が LISTEN 状態にあるか確認
describe port(listen_port) do
  it { should be_listening }
end

# HTTPレスポンスコードが200（成功）確認
describe command("curl -o /dev/null -w \"%{http_code}\\n\" -s http://127.0.0.1:#{listen_port}/") do
  its(:stdout) { should match /^200$/ }
end