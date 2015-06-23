alias m='meteor'
alias mongo='meteor mongo'

mcreate() {
  # Creates the project, hides the output from `meteor create $@`
  { meteor create $@; } &> /dev/null
  cd $1;

  # removes the default project.css, html, and js
  rm $1.*;

  # 2. Create directories client server public private
  mkdir client server public private;
}

# autocorrect
alias mtr='meteor'
alias mrt='meteor'
alias mtor='meteor'
alias metor='meteor'
alias mteor='meteor'
alias metor='meteor'

# for e2e testing
alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox-bin -p'
