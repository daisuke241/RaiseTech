# 第11回課題

## Serverspec テスト

### テスト実行コマンド
rspec spec/localhost/sample_spec.rb

### 前提条件

- OS : Amazon Linux 2
- RDS : MySQL
- S3
- port : 80
- 必要なGemやパッケージ : ruby 3.2.3, Bundler 2.3.14, Rails 7.1.3.2, Node v17.9.1, yarn 1.22.19, git, RVM, Active Storage, serverspec, puma, systemd, rspec, 

- ディレクトリ構造
  /home/ec2-user/serverspec-sample/
  ├──Rakefile
  ├── spec/
       ├── localhost/
       │      └── sample_spec.rb
       └── spec_helper.rb

## テストコード本体

[テストコード本体](spec/localhost/sample_spec.rb)


### RSpec 実行結果

$ rspec spec/localhost/sample_spec.rb

Package "git"
  is expected to be installed

Package "nginx"
  is expected to be installed

Command "ruby -v"
  stdout
    is expected to match /3\.2\.3/
  exit_status
    is expected to eq 0

Command "bash -lc 'cd /home/ec2-user/raisetech-live8-sample-app && bundle exec rails -v'"
  stdout
    is expected to match /Rails 7\.1\.3\.2/
  exit_status
    is expected to eq 0

Command "bash -lc 'rvm -v'"
  stdout
    is expected to match /rvm \d+\.\d+\.\d+/
  exit_status
    is expected to eq 0

Command "node -v"
  stdout
    is expected to match /v17\.9\.1/
  exit_status
    is expected to eq 0

Command "yarn -v"
  stdout
    is expected to match /1\.22\.19/
  exit_status
    is expected to eq 0

Command "mysql -u admin -pPassword -h rds-mysql-cfn.c9uo824ccan0.ap-northeast-1.rds.amazonaws.com -e "SHOW TABLES LIKE 'active_storage_blobs';" lect_cfnDB"
  stdout
    is expected to match /active_storage_blobs/
  exit_status
    is expected to eq 0

Command "mysql -u admin -pPassword -h rds-mysql-cfn.c9uo824ccan0.ap-northeast-1.rds.amazonaws.com -e "SHOW TABLES LIKE 'active_storage_attachments';" lect_cfnDB"
  stdout
    is expected to match /active_storage_attachments/
  exit_status
    is expected to eq 0

Command "aws s3 ls s3://s3bucket-cfn-2508"
  exit_status
    is expected to eq 0

File "//home/ec2-user/raisetech-live8-sample-app/tmp/sockets/puma.sock"
  is expected to exist

Port "80"
  is expected to be listening

Command "curl -o /dev/null -w "%{http_code}\n" -s http://127.0.0.1:80/"
  stdout
    is expected to match /^200$/

Finished in 4.18 seconds (files took 1.23 seconds to load)
20 examples, 0 failures
