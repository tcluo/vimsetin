# Install
```
$ ./install.sh
$ vi vimrc 
  :PlugInstall

# Follow https://github.com/Valloric/YouCompleteMe to install YouCompleteMe
$ cd vimsetin/plugged/YouCompleteMe
$ ./install.py --clang-completer

# Follow https://github.com/BurntSushi/ripgrep to install ripgrep that fzf used
$ brew install ripgrep
```

# C/C++ Navigation
```
# Follow https://github.com/Andersbakken/rtags to install rtags
$ brew install rtags
$ brew services start rtags

# Generate compile_commands.json
$ pip install scan-build
$ intercept-build <build_command>

# Import compile_commands.json
$ rc -J
```
