function fi --wraps='nvim $(fzf -i -m --preview="bat --color=always --style=plain {}")' --description 'alias fi=nvim $(fzf -i -m --preview="bat --color=always --style=plain {}")'
  nvim $(fzf -i -m --preview="bat --color=always --style=plain {}") $argv
        
end
