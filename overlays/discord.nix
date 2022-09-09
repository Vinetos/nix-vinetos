# This overlays replace the src of the discord package by the latest available online.
# If a new version is found, it will be replaced automatically.
# 
# This overlay can be used to select a client for Discord by replacing the url.
# e.g: Discord Canary or Discord PTB
#
# See https://support.discord.com/hc/fr/articles/360035675191-Discord-Testing-Clients

self: super: 
{ 
  discord = super.discord.overrideAttrs (_: { 
      src = builtins.fetchTarball "https://discord.com/api/download?platform=linux&format=tar.gz";
  });
}
