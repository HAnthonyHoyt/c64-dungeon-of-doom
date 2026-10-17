# Character creator cheat sheet

`character.bas` creates a hero and saves it to tape for Dungeon of Doom.

## Start the creator

In VICE's C64 mode, attach `tapes/character.tap` to tape unit 1 and rewind it.
At the BASIC prompt, enter `LOAD"CHARACTER",1`, select Datasette **Play**,
and enter `RUN` when loading finishes.

Wait for **CHARACTER CREATION**, then click the VICE window. Use unshifted
letter keys. VICE's warp mode speeds up tape loading.

## Keys

| Key | Attributes screen | Equipment screens |
| --- | --- | --- |
| A / Z | Select the previous / next attribute | Select the previous / next item |
| + | Spend one point to increase the attribute | Buy the selected item at its listed price |
| - | Decrease the attribute and recover one point | Make a price offer; type an amount and press Return |
| Space | Accept the attributes and continue | Finish this shop and continue |

During name entry or a price offer, **Return** submits the text. The minus key
in a shop makes an offer; it does not sell or remove equipment.

## Create a hero

1. Adjust **strength, vitality, agility, intelligence, luck, aura, and
   morality**. The **POINTS** counter shows how many extra points remain.
   An attribute cannot be reduced below 1.
2. **Experience stays at 1.** If its row is selected, move away with **A/Z**
   before pressing Space; that row ignores adjustments and Space.
3. Press **Space** to accept your attributes. Any unspent attribute points
   are left unused. Your class is chosen automatically from the attributes.
4. Visit **ARMOURY**, **ACCOUTREMENTS**, and **EMPORIUM**, in that order.
   Select an item with **A/Z**, then buy it with **+** or make an offer with
   **-**. Press **Space** when finished with each shop. The gold counter
   carries over between shops.
5. At **NAME THY CHARACTER**, prepare your writable hero tape as described
   below. Type a name of **1–10 letters or digits**, then press **Return**.
   Saving begins immediately after the name is accepted.

Spaces and Backspace/Delete are ignored during text entry. If a name exceeds
ten characters, pressing Return makes the program ask for the name again.
There is no menu command to go back to an earlier screen.

## Automatic classes

You do not select a class directly. These are the conditions in the listing;
if several rows match, the later matching row takes priority.

| Class | Requirements |
| --- | --- |
| Wanderer | Default when no other row matches |
| Cleric | Intelligence ≥ 7 and morality ≥ 8 |
| Mage | Intelligence ≥ 9 and aura ≥ 8 |
| Warrior | Strength ≥ 8, morality ≥ 6, and strength + vitality ≥ 11 |
| Barbarian | Strength ≥ 9, vitality + agility ≥ 13, and morality ≤ 5 |

## Save the hero to tape in VICE

1. After loading the creator, create and attach a **separate writable TAP
   image** to tape unit 1, for example `saves/my-character.tap`. Do this
   before submitting the character's name. Files in `saves/` are ignored by Git.
2. Finish the attribute and equipment screens, enter the name, and press
   **Return**. The program displays **ONE MOMENT PLEASE** and opens a tape
   file named **HERO**.
3. When the C64 asks for Record and Play, use VICE's Datasette **Record**
   control (Record/Play) to start recording.
4. Wait for saving to finish. The program then stops at BASIC line 560;
   **BREAK IN 560** is the expected end of this program.
5. Stop and detach the data tape in VICE so the image is fully written.

The program tape `tapes/character.tap` contains the creator. The writable
data tape receives the hero's attributes, equipment, remaining gold, name,
and class. Attach the hero data tape and rewind it when `game.bas` asks for
the hero tape. Dungeon levels belong on their own tape; see the
[dungeon creator cheat sheet](dungeon.md).
