# shell
シェルスクリプト置き場、CentOS7専用となります。**centos7 minimal インストール** した状態で何もはいっていない状態で必要なファイルを実行してください
※自己責任で実行してください
## [start.sh](https://github.com/site-lab/shell/blob/master/start.sh)
* epelインストール
* gitのインストール
* yumupdateの実行

## テスト環境
* conohaのVPS
* メモリ：512MB
* CPU：1コア
* SSD：20GB

### さくらのVPS
* メモリ：512MB
* CPU：1コア
* SSD：20GB

### 実行方法
SFTPなどでアップロードをして、rootユーザーもしくはsudo権限で実行

**sh start.sh** ←同じ階層にある場合

**sh /home/ユーザー名/start.sh** ユーザー階層にある場合（rootユーザー実行時）
