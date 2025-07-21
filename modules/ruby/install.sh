brew install gnupg openssl@3 zlib

gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys \
    409B6B1796C275462A1703113804BB82D39DC0E3 \
    7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

rvm install 3.3.0 --with-openssl-dir=/opt/homebrew/opt/openssl@3
