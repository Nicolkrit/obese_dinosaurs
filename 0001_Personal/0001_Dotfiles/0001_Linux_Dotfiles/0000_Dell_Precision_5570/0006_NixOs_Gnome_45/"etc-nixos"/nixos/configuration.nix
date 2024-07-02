{ inputs, config, lib, pkgs, ... }:
{
  imports =

    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Main upgrade channel
  #system.autoUpgrade.channel = "https://nixos.org/channels/unstable/";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
  };

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "alt-intl";
  };

  # Configure console keymap
  console.keyMap = "dvorak";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable bluetooth
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;

  # Fonts
  fonts.fonts = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
];

  # Aliases for the shell (bash)
  environment.interactiveShellInit = ''
    alias gs='git status'
    alias cl='clear'
    alias reb='reboot'
    alias shut='shutdown -h now'
    alias .1="cd .."
    alias .2="cd .. && cd .."
    alias .3="cd .. && cd .. && cd .."
    alias .4="cd .. && cd .. && cd .. && cd .."
    alias .5="cd .. && cd .. && cd .. && cd .. && cd .. "
    alias neo="neofetch"
  '';



  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.krit = {
    isNormalUser = true;
    description = "Krit Nicol";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };



  nixpkgs.config = {
  # Allow unfree packages
    allowUnfree = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # Install packages for the entire system (all users)
    environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      python3
      jetbrains.clion
      jetbrains.idea-ultimate
      jetbrains.webstorm
      jetbrains.pycharm-professional
      bluej
      rofi
      polybar
      openjdk
      neofetch
      brave
      kate
      firefox
      thunderbird
      google-chrome
      kile
      texlive.combined.scheme-full
      tikzit
      protonvpn-gui
      discord
      emacs
      alsa-tools
      notion
      obsidian
      gnome.gnome-keyring
      protonmail-bridge
      tmux
      gitkraken
      chatgpt-cli
      shell_gpt
      perl536Packages.W3CLinkChecker
      signal-desktop
      vlc
      cider
      handbrake
      starship
      neovim
      obs-studio
    ];

    nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "steam"
      "notion"
      "obsidian"
      "github-desktop"
    ];

    nixpkgs.config.permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?



}
