if [[ `uname` == "Darwin" ]]; then
	eval $(/usr/local/homebrew/bin/brew shellenv)
else
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
