{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    ripgrep
    fd
    bat
    zoxide
    starship
    atuin
    eza
    sd
    fzf
    jq
    neovim
    gh
    lazygit
    lazydocker
  ];

  programs.git = {
    enable = true;

    userName = "Koichiro Okamoto";
    userEmail = "koichirookamoto@icloud.com";

    aliases = {
      st = "status";
      co = "checkout";
      ci = "commit";
      br = "branch";
      lg = "log --oneline --graph --all";
      last = "log -1 HEAD";
      fix = "commit --fixup";
      r = "rebase -i";
    };

    extraConfig = {
      core = {
        editor = "nvim";
      };
      pull = {
        rebase = true;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      la = "eza -la";
      tree = "eza --tree";
    };
  };

  programs.starship.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      keymap_mode = "vim-insert";
    };
  };

  home.stateVersion = "24.05";
}

