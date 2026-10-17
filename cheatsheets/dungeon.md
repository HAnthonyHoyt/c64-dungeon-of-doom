# Dungeon creator cheat sheet

`dungeon.bas` creates 15 × 15 dungeon levels for Dungeon of Doom.

## Start the editor

In VICE's C64 mode, attach `tapes/dungeon.tap` to tape unit 1 and rewind it.
At the BASIC prompt, enter `LOAD"DUNGEON",1`, select Datasette **Play**,
and enter `RUN` when loading finishes.

Wait for **LEVEL GENERATOR** and **THIS IS LEVEL: 1**, then click the VICE
window. Use unshifted letter keys. Initialization takes time; VICE's warp
mode speeds it up.

## Keys

Move to a cell, then press a number to replace its contents.

| Key | Action |
| --- | --- |
| A | Move up |
| Z | Move down |
| N | Move left |
| M | Move right |
| 0 | Erase the cell |
| 1 | Wall |
| 2 | Vase |
| 3 | Chest |
| 4 | Idol |
| 5 | Entrance / starting position |
| 6 | Exit |
| 7 | Trap |
| 8 | Safe place |
| 9 | Random guard; press again to choose another random guard |
| H | Show help; press a key to advance each of the ten messages |
| S | Save the level; requires an entrance |
| F | Stop the editor without saving |

The cursor starts in the top-left cell and stays inside the 15 × 15 grid.

## Make a first level

1. Press **5** to place an entrance in the starting cell.
2. Press **M** four times to move four cells right.
3. Press **6** to place an exit.
4. Add walls, objects, traps, or guards elsewhere as desired.
5. Follow the save steps below.

Keep one entrance tile on the map. Each press of **5** records a new starting
position but leaves any earlier entrance tiles in place. Erasing or replacing
the entrance tile does not clear the recorded starting position.

## Save levels to tape in VICE

1. After the editor has loaded, use VICE's tape image controls to create and
   attach a **separate writable TAP image** to tape unit 1, for example
   `saves/my-dungeon.tap`. Files in `saves/` are ignored by Git.
2. Make sure the level has an entrance (**5**), then press **S**.
3. Wait for **ANY KEY TO SAVE**, then press a key.
4. When the C64 asks for Record and Play, use VICE's Datasette **Record**
   control (Record/Play) to start recording.
5. Wait until the editor shows the next level number and a blank grid. The
   previous level has been written as a tape file named **LEVEL**.
6. Stop the Datasette. Keep the tape at its current position so the next
   saved level follows the previous one; **do not rewind between saves**.

Saving clears the editing grid, increases the level number by one, and moves
the cursor back to the top-left cell. Finish each level before saving it.

When the game asks for the dungeon tape, attach this level tape and rewind it
to the first level you want it to read. The `tapes/dungeon.tap` program tape
contains the editor only. Character data belongs on a separate **HERO** tape
created with `character.bas`; see the [character creator cheat sheet](character.md).

