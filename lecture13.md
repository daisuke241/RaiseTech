# 第13回課題

## CircleCIのサンプルにServerSpecとAnsibleの処理を追加する

- [ServerSpecとAnsibleの処理を追加した .circleci/config.yml](.circleci/config.yml)

### CircleCIでCloudfomationを実行

#### 実行結果

![CircleCIでCloudfomationを実行](./images/lecture13-1.png)

- [cloudfomationのテンプレート](templates/multi-resource.yml)

### CircleCIでAnsibleを実行

#### Ansible実行でインストールしたモジュール

- [Git](ansible/roles/git/tasks/main.yml)
- [Nginx](ansible/roles/nginx/tasks/main.yml)
- [MySQL](ansible/roles/mysql/tasks/main.yml)
- [Node](ansible/roles/node/tasks/main.yml)
- [RVM](ansible/roles/rvm/tasks/main.yml)
- [Bundler](ansible/roles/bundler/tasks/main.yml)

#### 実行結果

![CircleCIでAnsibleを実行](./images/lecture13-2.png)

 - [inbentory](ansible/inventory/hosts.ini)

 - [playbooks](ansible/playbooks/site.yml)

### CircleCIでServerSpecを実行

#### 実行結果

![CircleCIでServerSpecを実行](./images/lecture13-3.png)

- [target/sample_spec.rb](serverspec/spec/target/sample_spec.rb)
- [spec_helper.rb](serverspec/spec/spec_helper.rb)

- [Rakefile](serverspec/Rakefile)
