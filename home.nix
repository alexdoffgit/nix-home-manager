{ pkgs, ... }:

{
  home.username = "student";
  home.homeDirectory = "/home/student";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
  	eza
  	bat
  	ripgrep
  	fzf
  	micro
  	neovim
  	yazi
  	helix
  	zoxide
  ];

  programs.zsh = {
    enable = true;

    # PLUGINS & COMPINIT
    # Home Manager automatically runs compinit and sources syntaxHighlighting last
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    # COMMAND ALIASES
    shellAliases = {
      ls = "eza";
      tree = "eza --tree";
      cat = "bat";
    };

    # CUSTOM FUNCTIONS / COMPLETIONS (Uncomment if you add site-functions)
    # completionInit = ''
    #   fpath=(~/.zsh/site-functions $fpath)
    #   autoload -Uz compinit && compinit
    # '';

    # TAB COMPLETION STYLES & KEYBINDINGS
    initContent = ''
       # Tab completion & navigation
       zstyle ':completion:*' menu select
       zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
       zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
    
       # Fix Ctrl + Left / Right word navigation for Windows SSH (;5D / ;5C)
       bindkey '^[[1;5D' backward-word
       bindkey '^[[1;5C' forward-word
    
       # Alternative xterm sequences used by some Windows terminal emulators
       bindkey '^[OD' backward-word
       bindkey '^[OC' forward-word
    '';
  };

  # STARSHIP PROMPT
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Declarative program configurations (generates dotfiles in ~/.config or ~/)
  programs.git = {
    enable = true;
    settings = {
      user.name = "alexdoffgit";
      user.email = "alexdoffacc@gmail.com";
      credential.helper = "cache --timeout=7200";
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;      	
}
