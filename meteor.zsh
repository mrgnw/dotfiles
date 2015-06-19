alias m='meteor'

# Meteor request:
# Have these as meteor custom `meteor create` settings:
# 1. Don't create [project].css/html/js
# 2. Create client server public private
mcreate() {
  # Hides the output from `meteor create $@`
  { meteor create $@; } &> /dev/null
  cd $1
  mkdir client server public private;
  rm $1.*; # removes the default project.css, html, and js
}

# autocorrect
alias m='meteor'
alias mtr='meteor'
alias mrt='meteor'
alias mtor='meteor'
alias metor='meteor'
alias mteor='meteor'
alias metor='meteor'

# for e2e testing
alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox-bin -p'
