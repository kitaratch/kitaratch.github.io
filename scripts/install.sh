# scratch-gui のインストール
cd /
git clone --branch v3.6.18 --single-branch https://github.com/LLK/scratch-gui.git
cd scratch-gui
npm install

# microbitMoreのインストール
cd /scratch-gui
git clone -b stretch3 --single-branch https://github.com/microbit-more/mbit-more-v2.git ./microbitMore
sh ./microbitMore/install-stretch3.sh

# pcratch IoT 拡張のインストール（この環境ではビルドは出来ない）
cd /scratch-gui
git clone https://github.com/jcodeorg/pcratch-iot-ext.git
sh ./pcratch-iot-ext/install-stretch3.sh

# scratch-gui のビルド
cd /scratch-gui
npm cache clean --force  # 必要に応じてキャッシュのクリア
NODE_OPTIONS=--openssl-legacy-provider npm run build

# テストサーバーの起動
cd /scratch-gui/build
http-server -p 8080
