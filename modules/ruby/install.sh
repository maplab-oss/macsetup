brew install rbenv ruby-build

rbenv versions | grep -q "3.3.0" || rbenv install 3.3.0
rbenv global 3.3.0
