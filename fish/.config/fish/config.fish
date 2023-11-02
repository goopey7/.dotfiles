if status is-interactive
    # Commands to run in interactive sessions can go here
end

# opam configuration
source /home/sam/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

function ue
	$HOME/src/uegen.sh $argv
end

alias ue4 'echo Please use ue instead.'
alias ue5 'echo Please use ue instead.'
