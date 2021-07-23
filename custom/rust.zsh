# rustup install without dialog
+rustup(){ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y; }
rin(){ rustup install $@ }