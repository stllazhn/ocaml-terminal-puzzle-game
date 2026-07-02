# ocaml-terminal-puzzle-game
OCaml/Dune terminal puzzle game with interactive story dialogue, item inspection, inventory actions, and ANSI-colored text.

# OCaml Terminal Puzzle Game

This is an OCaml terminal-based puzzle minigame. The player communicates with a figure trapped inside a strange cube and helps them escape by navigating between cube walls, inspecting objects, picking up items, using items together, and unlocking puzzle conditions.

The project uses colored terminal text for dialogue, narration, item descriptions, hints, and game instructions.

## Features

- Interactive command-line gameplay
- Story dialogue between the player and a trapped figure
- Navigation between different cube walls
- Item inspection system
- Pick-up and drop inventory behavior
- Item-combination puzzle logic
- Hint system
- Map display
- ANSI-colored terminal output
- Built with OCaml and Dune

## Tech Stack

- OCaml
- Dune
- ANSITerminal

## Project Structure

```text
ocaml-terminal-puzzle-game/
├── README.md
├── .gitignore
├── .ocamlformat
├── dune-project
├── minigame.opam
├── bin/
│   ├── dune
│   └── main.ml
└── lib/
    ├── dune
    ├── minigame_conversations.ml
    └── minigame_play.ml
```

## How to Run

Make sure you have OCaml and Dune installed.

First, install the project dependencies:

```bash
opam install dune ANSITerminal
```

Build the project:

```bash
dune build
```

Run the game:

```bash
dune exec bin/main.exe
```

Or, if installed through Dune as a public executable:

```bash
dune exec minigame
```

## How to Play

The game will give instructions in the terminal.

Common commands include:

```text
w / a / s / d    Move between cube walls
m                Show the map
i                Inspect an item
p                Pick up an item
u                Use the currently held item with another item
h                Show a hint
solve            Skip/solve the puzzle
Enter            Continue or back out of an interaction
```

When choosing an item, enter its numeric index:

```text
0
1
2
```

For example, if the game lists several items near the current wall, typing `0` chooses the first item.

## Gameplay Notes

The figure inside the cube can only act when commanded by the player. To progress, the player must explore the cube, inspect objects, collect usable items, and combine the correct objects to unlock the escape sequence.

Some items are holdable, while others can only be inspected or used as part of the environment.

## Notes

The main gameplay logic is in:

```text
lib/minigame_play.ml
```

The dialogue and narration helpers are in:

```text
lib/minigame_conversations.ml
```
