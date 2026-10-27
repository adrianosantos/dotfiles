# The concierge's folder

The sessions that start here belong to the concierge of a session host: Claude
Code's Remote Control server, which launchd keeps running beside the Claude desktop
app (`claude-concierge`; "The concierge" in the dotfiles README). The phone reaches
them when it cannot reach the desktop app's own sessions, as after the app has
relaunched.

What a session here is for:

- Bringing the desktop app's sessions back after a relaunch: list them, and send
  each one a short message, since a session's Remote Control comes back with its
  next message.
- Short tasks from the phone that belong to no project.

What it is not for:

- Work on a project. Open that project's own session, in the project's own folder,
  so it reads that project's instructions and keeps that project's memory.

No other session starts in this folder, so the concierge's sessions keep an agent
memory of their own. The dotfiles create this folder on a session host only: edit
this file in the dotfiles source, `dot_config/claude-concierge/`, not here.
