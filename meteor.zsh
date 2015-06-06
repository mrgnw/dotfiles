alias m='meteor'

# Meteor request:
# Have these as meteor default `meteor create` settings
# 1. Don't create [project].css/html/js
# 2. Create client server public private
mcreate() {
  meteor create $@;
  # Q: can I hide the output from this?
  cd $1
  echo mkdir client server public private;
  echo rm $1.*; # removes the default project.css, html, and js
}
mcreaterun() { mcreate $@; meteor }

# autocorrect
alias mtr='meteor'
alias mtor='meteor'
alias metor='meteor'
alias mteor='meteor'
alias metor='meteor'

# for e2e testing
alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox-bin -p'
