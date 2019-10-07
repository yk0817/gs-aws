FROM ruby:2.5.6
# ファイルをworkディレクトリへ追加する
ADD . /work
# ディレクトリを移動する 
WORKDIR /work
# イメージをbuildする際に実行させる
RUN bundle install
# vimインストール
RUN apt-get update && apt-get install -y vim
# container4567ポートを開ける
EXPOSE 4567
# imageをコンテナとして立ち上げた際に実行されるコマンド
CMD ["bundle", "exec", "ruby", "app.rb"] 
