# Regenerate the README demo:  bash .github/demo-setup.sh, then
# vhs .github/demo.tape, then gifsicle -O3 --lossy=30 --colors 64 -b .github/demo.gif
# (all from the repo root), on a Mac. The setup captures a
# real `up` (run it right after an `up` that left nothing to upgrade), and the
# recording's `up` replays that capture: VHS's terminal stopped drawing partway
# through a real `up` run inside it. The prompt is Powerlevel10k's pure preset
# (.github/demo-prompt.zsh), in a Nerd Font, with the kube context shown while a
# kcx command is typed. The last command lists kcx's demo profile
# (.github/demo-kcx-profile.toml, the one kcx's own README demo uses), read through
# KCX_PROFILES, and KUBECONFIG is .github/demo-kubeconfig.yaml, so the machine's
# own profiles and clusters never show. Framerate 20 keeps the GIF small.
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
Set Framerate 20

Hide
Type "exec zsh"
Enter
Sleep 2s
Type "setopt interactivecomments; export KCX_PROFILES=$PWD/.github/demo-kcx-profile.toml KUBECONFIG=$PWD/.github/demo-kubeconfig.yaml; up() { sed -n 1,4p /tmp/dotfiles-demo-up.replay; sleep 2; sed -n '5,$p' /tmp/dotfiles-demo-up.replay; }; source .github/demo-prompt.zsh; cd; clear"
Enter
Sleep 1s
Show

Sleep 1s
Type "up"
Enter
Sleep 7s
Type "# one repo drives both machines - everything below is chezmoi-managed"
Enter
Sleep 1s
Type "chezmoi managed | head -8"
Enter
Sleep 2.5s
Type "mise ls"
Enter
Sleep 3.5s
Type "kcx profile ls"
Sleep 1.5s
Enter
Sleep 4s
