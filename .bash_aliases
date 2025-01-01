# some more aliases
if [[ -n $(type -P gvim) ]]; then
	alias vi='gvim -p'
elif [[ -n $(type -P vim) ]]; then
	alias vi='vim -p'
fi
