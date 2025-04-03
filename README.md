# kitaratch-website


# ビルドの方法
docker-compose build
docker-compose up -d
docker exec -it kitaratch-website /bin/bash

# scratch-gui のインストール
cd /
git clone --branch v3.6.18 --single-branch https://github.com/LLK/scratch-gui.git
cd scratch-gui
npm install

# microbitMoreのインストール
cd /scratch-gui
git clone -b stretch3 --single-branch https://github.com/microbit-more/mbit-more-v2.git ./microbitMore
sh ./microbitMore/install-stretch3.sh

# pcratch IoT 拡張のインストール（ビルドはダメヨよ）
cd /scratch-gui
git clone https://github.com/jcodeorg/pcratch-iot-ext.git
# cd pcratch-iot-ext
# npm install
# npm run build
# cd /scratch-gui
sh ./pcratch-iot-ext/install-stretch3.sh
# 確認
# cp ./node_modules/scratch-vm/src/extension-support/extension-manager.js /scripts

# pcratch IoT 拡張のレポジトリ同期
# cd /scratch-gui/pcratch-iot-ext
# git fetch
# git pull
# npm run build

# scratch-gui のビルド
cd /scratch-gui
npm cache clean --force  # 必要に応じてキャッシュのクリア
NODE_OPTIONS=--openssl-legacy-provider npm run build

# テストサーバーの起動
cd /scratch-gui/build
http-server -p 8080




#    以下は不要
cp ./pcratch-iot-ext/dist/pcratchIoT.mjs ./build
http://localhost:8080/pcratchIoT.mjs

# ブランチへの書き込み
git config --global user.email "kito@j-code.org"
git config --global user.name "Koichi Ito"
ls /scratch-gui/pcratch-iot-ext/dist
git checkout -b dist-pages
git branch -r
git add .
git commit -m "Update dist folder contents"
git push origin dist-pages