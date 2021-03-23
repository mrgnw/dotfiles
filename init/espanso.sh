brew install federico-terzi/espanso/espanso || sudo snap install espanso --classic

# community packages
espanso install basic-emojis
espanso install mac-symbols
espanso install misspell-en_US --external

echo "\nsecure_input_notification: false" >>~/Library/Preferences/espanso/default.yml

espanso register
espanso start
