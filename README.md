# kitaratch-website

# ビルドの方法
docker-compose build
docker-compose up -d
docker exec -it kitaratch-website /bin/bash

# ビルドの手順

script/install.sh を参照の事

``` sh
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
cd /scratch-gui/pcratch-iot-ext
git fetch
git pull
cp dist/pcratchIoT.mjs /scratch-gui/node_modules/scratch-vm/src/extensions/pcratchIoT/
ls /scratch-gui/node_modules/scratch-vm/src/extensions/pcratchIoT/

# scratch-gui のビルド
cd /scratch-gui
npm cache clean --force  # 必要に応じてキャッシュのクリア
NODE_OPTIONS=--openssl-legacy-provider npm run build

# テストサーバーの起動
cd /scratch-gui/build
http-server -p 8080
```
