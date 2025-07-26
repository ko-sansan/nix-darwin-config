{ config, pkgs, ... }:

let
  basePackages = with pkgs; [
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

  goPackages = with pkgs; [
    go
    gopls
    go-tools
    goreleaser
  ];

  nodePackages = with pkgs; [
    nodejs_24
    codex
    pnpm
    bun
  ];

  allPackages = basePackages ++ goPackages ++ nodePackages;
in
{
  home.packages = allPackages;

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

  home.sessionVariables = {
    GOPATH     = "${config.home.homeDirectory}/.go";
    GOMODCACHE = "${config.xdg.cacheHome}/go-mod";
    GOBIN      = "${config.home.homeDirectory}/.local/bin";  # go install で PATH に通るように
  };
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];

  home.stateVersion = "25.05";
}

