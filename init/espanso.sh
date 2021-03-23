# my package

if [[ is_macos ]];
then
    brew install federico-terzi/espanso/espanso
else
    sudo snap install espanso --classic
fi
espanso install espansos https://github.com/mrgnw/espansos --external

# community packages
espanso install basic-emojis
espanso install mac-symbols
espanso install misspell-en_US --external

echo "\nsecure_input_notification: false" >>~/Library/Preferences/espanso/default.yml

espanso register
espanso start
