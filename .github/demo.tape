# Regenerate the README demo:  vhs .github/demo.tape   (from the repo root), on a
# machine where `chezmoi diff --exclude scripts` is empty, as the recording says
# (plain run_ scripts run on every apply, so a bare `chezmoi diff` always lists
# them). The prompt is
# Powerlevel10k's pure preset (.github/demo-prompt.zsh), in a Nerd Font.
# Keep this file pure ASCII - multibyte chars mojibake through ttyd typing.
# On a Mac where Google Chrome quits half a minute into a headless session (seen with
# Chrome 157 and its updater: every recording longer than that dies with "use of
# closed network connection"), hide Chrome from VHS's launcher so it fetches a plain
# Chromium of its own, and turn the browser's own sandbox off inside the profile:
#   VHS_NO_SANDBOX=true sandbox-exec -p '(version 1) (allow default) (deny file-read* (subpath "/Applications/Google Chrome.app") (subpath "/Applications/Google Chrome Canary.app"))' vhs .github/demo.tape
Output .github/demo.gif

Set Shell zsh
Set FontFamily "MesloLGS Nerd Font"
Set FontSize 16
Set Width 920
Set Height 520
Set Padding 16
Set TypingSpeed 55ms
Set Theme "Dracula"

Hide
Type "exec zsh"
Enter
Sleep 2s
Type "setopt interactivecomments; source .github/demo-prompt.zsh; cd; clear"
Enter
Sleep 1s
Show

Sleep 1s
Type "# one repo drives both machines - everything below is chezmoi-managed"
Enter
Sleep 1s
Type "chezmoi managed | head -8"
Enter
Sleep 2.5s
Type "chezmoi diff --exclude scripts"
Enter
Sleep 1.5s
Type "# empty: machine and repo are in sync"
Enter
Sleep 1.5s
Type "grep -cE '^(brew|cask)' ~/.Brewfile"
Enter
Sleep 1s
Type "# every tool is declared, not remembered"
Enter
Sleep 1.5s
Type "kubectl krew list"
Enter
Sleep 2.5s
Type "mise ls"
Enter
Sleep 3.5s
