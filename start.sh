#!/bin/sh

#rootユーザーで実行 or sudo権限ユーザー

<<COMMENT
作成者：サイトラボ
URL：https://www.site-lab.jp/
URL：https://www.logw.jp/

目的：CentOS7にてシステム更新（テスト用でもあるので実際の実行はユーザーが'y'を押したら。'n'を押したらキャンセル）

COMMENT

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

#変数
if [ -e /etc/redhat-release ]; then
    DIST="redhat"
    DIST_VER=`cat /etc/redhat-release | sed -e "s/.*\s\([0-9]\)\..*/\1/"`
    #DIST_VER=`cat /etc/redhat-release | perl -pe 's/.*release ([0-9.]+) .*/$1/' | cut -d "." -f 1`

    if [ $DIST = "redhat" ];then
      if [ $DIST_VER = "7" ];then
        echo "インストールスクリプトを開始します"
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
      else
        echo "CentOS7ではないため、このスクリプトは使えません。このスクリプトのインストール対象はCentOS7です。"
      fi
    fi

else
  echo "このスクリプトのインストール対象はCentOS7です。CentOS7以外は動きません。"
  cat <<EOF
  検証LinuxディストリビューションはDebian・Ubuntu・Fedora・Arch Linux（アーチ・リナックス）となります。
EOF
fi

exec $SHELL -l
