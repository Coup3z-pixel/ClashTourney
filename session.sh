#!/bin/sh

# Set Session Name
SESSION="Clash Tourney"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # setup Writing window
    tmux rename-window -t 0 'Writing'
    tmux send-keys -t 'Writing' "nvim ." C-m

    # Create and setup pane for hugo server
    tmux new-window -t $SESSION:1 -n 'go'
	tmux send-keys -t "spring" "cd ./backend" C-m
    tmux send-keys -t 'spring' 'mvn spring-boot:run' C-m 'clear' C-m # Switch to bind script?

    # Name first Pane and start zsh
    tmux new-window -t $SESSION:2 -n 'svelte'
	tmux send-keys -t 'react' "cd ./frontend" C-m
    tmux send-keys -t 'react' 'pnpm run dev' C-m 'clear' C-m # Switch to bind script?

	tmux new-window -t $SESSION:3 'postgres'
	tmux send-keys -t 'react' "cd ./frontend" C-m
    tmux send-keys -t 'react' 'pnpm run dev' C-m 'clear' C-m # Switch to bind script?

    # Setup an additional shell
    tmux new-window -t $SESSION:4 -n 'Shell'
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
