#!/bin/sh

#rootユーザーで実行 or sudo権限ユーザー

<<COMMENT
作成者：サイトラボ
URL：https://www.site-lab.jp/
URL：https://www.logw.jp/

目的：CentOS7にてシステム更新（テスト用でもあるので実際の実行はユーザーが'y'を押したら。'n'を押したらキャンセル）

COMMENT

echo "インストールスクリプトを開始します"
echo "このスクリプトのインストール対象はCentOS7です。"
echo ""

start_message(){
echo ""
echo "======================開始======================"
echo ""
}

end_message(){
echo ""
echo "======================完了======================"
echo ""
}

#umaskの確認
start_message
echo "現在の設定を確認"
umask
echo "ディレクトリを775、ファイルが664になるように変更"
echo "umask 0002"
umask 0002
end_message
#EPELリポジトリのインストール
start_message
yum -y install epel-release
end_message

#gitリポジトリのインストール
start_message
yum -y install git
end_message



# yum updateを実行
echo "yum updateを実行します"
echo ""

start_message
yum  update
end_message
