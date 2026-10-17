# Dungeon of Doom for the C64

Dungeon of Doom is a game described in the Usborne Publishing book; "Write your own fantasy games for
your microcomputer" by Les Howarth and Cheryl Evans.  In that book, the reader is encouraged to type
out the game from the source listings in the book into their own microcomputer.  Supported models
include the the Commodore 64, VIC-20, BBC Micro, Acorn Electron and the Sinclair ZX Spectrum.

In this repository, you can find the C64 version of the code for your review.  To learn more about
how to use the applications, please be sure to check out the Usborne website and download your copy
of the book for free.

* https://usborne.com/browse-books/features/computer-and-coding-books/

## How to play

Before you can explore a dungeon, you need **at least one saved dungeon level and one saved
character**. From there, you can then load the `game` program to play the game.  If you need
help, I suggest you read the [cheat sheets](#cheat-sheets) for help with creating characters
and levels, saving and loading tapes, game controls, and magic.

## Loading the programs

Use VICE in **C64 mode**. Start with a fresh or reset C64 for each program, then choose either
of these two loading methods.

### Copy and paste the BASIC source

1. Open `character.bas`, `dungeon.bas`, or `game.bas` in a text editor and copy the entire listing.
   Keep the source lowercase; uppercase text can become graphics characters when pasted into VICE.
2. At the C64's `READY.` prompt, choose VICE's **Edit → Paste**.
   Wait for the whole listing to finish entering. If the final line is still waiting at the cursor,
   press **Return** to submit it.
3. Enter `RUN` and press **Return** to start the program.

### Load a tape for a more authentic experience

1. Use VICE's **Attach datasette image** action to attach the program tape.
2. Enter the matching command at the C64's BASIC prompt and press **Return**:

   | Program | Tape image | Load command |
   | --- | --- | --- |
   | Character creator | `tapes/character.tap` | `LOAD"CHARACTER",1` |
   | Dungeon creator | `tapes/dungeon.tap` | `LOAD"DUNGEON",1` |
   | Game | `tapes/game.tap` | `LOAD"GAME",1` |

3. When prompted to press Play on tape, select VICE's Datasette **Play** control.
4. Wait for loading to finish and `READY.` to appear, then enter `RUN` and press **Return**.

Both methods start the same programs. You still need writable tape images to save your character
and dungeon and load them into the game. Initialization takes a little time; VICE's warp mode can
speed up loading, but turn it off before playing.

## Project Structure

The `tapes/` directory contains the program tape images: `character.tap`, `dungeon.tap`, and
`game.tap`. Use the `saves/` directory for your character, dungeon, and game saves.

## Cheat sheets

* [Character creator](cheatsheets/character.md)
* [Dungeon creator](cheatsheets/dungeon.md)
* [Game](cheatsheets/game.md)
