# make sure slack is installed
cask install slack

# Install without cloning the whole repo
# github.com/LanikSJ/slack-dark-mode
curl https://raw.githubusercontent.com/LanikSJ/slack-dark-mode/master/dark-theme.css -o dark-theme.css \
  & curl https://raw.githubusercontent.com/LanikSJ/slack-dark-mode/master/event-listener.js -o event-listener.js
curl -L https://raw.githubusercontent.com/LanikSJ/slack-dark-mode/master/slack-dark-mode.sh | sh