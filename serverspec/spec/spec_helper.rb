require 'serverspec'
require 'net/ssh'

# Serverspec の実行方式を SSH にする
set :backend, :ssh

# CircleCI の環境変数から接続先を取得
set :host, ENV['TARGET_HOST']

# SSH 接続オプション
set :ssh_options, {
  user: 'ec2-user',
  keys: [ENV['SSH_KEY_PATH']],
  auth_methods: ['publickey']
}

# sudo をパスワードなしで使用する
set :sudo_password, nil
