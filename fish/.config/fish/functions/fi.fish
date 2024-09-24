function fi --wraps='nvim ' --wraps='nvim $(fzf -m --preview="bat --color=always {}")' --wraps='nvim $(fzf -m -i --preview="bat --color=always {}")' --description 'alias fi=nvim $(fzf -m -i --preview="bat --color=always {}")'
  nvim $(fzf -m -i --preview="bat --color=always {}") $argv
        
end
