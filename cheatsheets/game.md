# Game cheat sheet

`game.bas` loads a saved hero and dungeon, then runs Dungeon of Doom.

## Have these three tapes ready

| Tape | File in this project | Purpose |
| --- | --- | --- |
| Game program | `tapes/game.tap` | Loads and starts the game |
| Hero data | `saves/my-character.tap` | Your saved `HERO` record |
| Dungeon data | `saves/my-dungeon.tap` | Your saved `LEVEL` records |

The data paths are examples; create your own tapes with the creators first.
Files in `saves/` are ignored by Git.

For creating data tapes, see the [character](character.md) and
[dungeon](dungeon.md) cheat sheets.

## Start the game

In VICE's C64 mode, attach `tapes/game.tap` to unit 1, rewind, enter
`LOAD"GAME",1`, select Datasette Play, and enter `RUN` when loading finishes.

Initialization copies the character ROM with a BASIC loop, so allow time for
it to finish. Warp mode speeds up loading; turn it off before playing, since
monsters can act while you are deciding what to do.

## Load your hero and dungeon

Use VICE's **Attach tape image** action when swapping data tapes so the
running game can read them. All tape operations use unit 1.

1. At **PREPARE HERO TAPE**, stop the Datasette, attach
   your hero tape, for example `saves/my-character.tap`, and rewind it.
2. Click the VICE window and press a key at **PRESS ANY KEY**. Select
   Datasette **Play** when requested. Wait for the `HERO` record to load.
3. At **PREPARE DUNGEON TAPE**, stop the Datasette, attach
   your dungeon tape, for example `saves/my-dungeon.tap`, and rewind it.
4. Press a key at **PRESS ANY KEY** and operate Datasette **Play** when
   requested. Wait for the `LEVEL` record to load.
5. When the map appears, check the hero's name and the status display.
   Click the VICE window and use unshifted letter keys.

## Controls

| Key | Action |
| --- | --- |
| B | Turn left: north → west → south → east |
| N | Turn right: north → east → south → west |
| M | Move one cell forward in the direction shown by FACE |
| A | Attack the active monster |
| G | Get or interact with the cell immediately **in front** of you |
| P | Use available healing supplies |
| R | Reveal nearby cells using a torch charge |
| C | Cast a spell; requires aura and a Necronomicon or scrolls |
| S | Save the current hero and level to tape, then end the session |

Check **FACE** before moving. The dungeon creator's A/Z/N/M movement scheme
does not apply here. Walls block movement, and keypresses consume a little
Strength.

## Status and objectives

| Display | Meaning |
| --- | --- |
| STR | Current strength; reaching zero ends the game |
| VIT | Vitality |
| AUR | Aura available for magic |
| FACE | Direction: N, E, S, or W |
| EXP | Experience, displayed as a whole number |

- Face a vase and press **G** to collect one salve and one potion.
- Face a treasure chest and press **G** to increase your treasure tally.
- Face the idol and press **G** to finish the quest and display your score.
  **BREAK IN 340** is the expected end of the program.
- **P** uses a potion for lost Strength and salve for lost Vitality. One
  press can consume one of each if both attributes need restoring.
- **R** reveals an area up to seven cells wide around you. Without a torch
  charge, it displays **NO LIGHT**.
- Safe spaces protect against the nearby monster's attack routine. Traps
  can hold you in place until the escape check succeeds.

Walking onto an exit attempts to load another level. You need at least one
full experience point above the value you had when the hero was loaded;
otherwise the game displays **YOU NEED EXPERIENCE**. Keep the dungeon tape
positioned for the next `LEVEL` record. A further level must have been saved
on the tape for the game to read it.

## Magic reference

After **C**, respond to **USE SPELL NUMBER?** with one digit.

| Number | Effect in the current listing | Required item |
| --- | --- | --- |
| 1 | Destroy the active monster | Necronomicon |
| 2 | Turn your current floor cell into a safe space | Necronomicon |
| 3 | Teleport to a random position | Necronomicon |
| 4 | Increase Strength and Vitality; spend one Aura | Necronomicon and scrolls |
| 5 | Randomly transform your current cell | Scrolls |
| 6 | Restore starting Strength and Vitality; spend one Aura | Scrolls |

All spells require positive Aura to open the magic screen and consume a
charge for the selected spell. **SPELL EXHAUSTED** means its charges are
used up. An unavailable spell number causes the prompt to repeat.

## Save and resume a game

1. Prepare a **new writable checkpoint TAP**, such as
   `saves/game-save.tap`, and attach it to unit 1.
2. Press **S**. At **ANY KEY TO SAVE**, press a key and select Datasette
   **Record** (Record/Play) when requested.
3. Leave recording enabled while the game writes **HERO**, followed by
   **LEVEL**, to that same tape.
4. Wait for saving to finish. The normal save path ends at **BREAK IN 340**.
   Stop and detach the checkpoint tape so the image is fully written.

To resume, start `game.bas` again. At **PREPARE HERO TAPE**, attach and rewind
the checkpoint TAP, then load its `HERO` record. At **PREPARE DUNGEON TAPE**,
keep that same checkpoint tape attached at its current position and continue
playing it to read the following `LEVEL` record.
