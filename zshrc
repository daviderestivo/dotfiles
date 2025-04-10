# On Intel CPUs, Homebrew installs files in `/usr/local'. On Apple
# silicon CPUs, instead files are placed into the `/opt/homebrew'
CPU_BRAND=`sysctl -n machdep.cpu.brand_string`

if [[ "$CPU_BRAND" =~ ^Intel ]]; then
    export HOMEBREW_BASEDIR="/usr/local"
else
    export HOMEBREW_BASEDIR="/opt/homebrew"
fi

# Add Homebrew bin and sbin dirs to the PATH
export HOMEBREW_BINDIR="$HOMEBREW_BASEDIR/bin:$HOMEBREW_BASEDIR/sbin"
export PATH="$HOMEBREW_BINDIR:$PATH"

# Add ~/bin and ~/.local/bin/ to the PATH
export PATH="~/.local/bin:~/bin:$PATH"

# Add ruby bin dir to the PATH
export PATH="$HOMEBREW_BASEDIR/opt/ruby/bin:$PATH"

# Add python3 bin dir to the PATH
export PATH="$HOMEBREW_BASEDIR/opt/python/bin:$PATH"

alias python="python3"
