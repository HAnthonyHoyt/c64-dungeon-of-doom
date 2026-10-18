# Bugs and possible improvements

The BASIC listings in this project aim to preserve the C64 version of *Write your own
fantasy games for your microcomputer* by Les Howarth and Cheryl Evans. This includes the
book's general conversion rules and C64-specific replacements. This does mean we will be
keeping any and all bugs discovered in project.

This page records known limitations and proposed improvements. Line references are BASIC
line numbers. Book references use printed page numbers.

Thanks to [ajfclark](https://github.com/ajfclark) for the bug reports and suggestions
that informed this page.

## Random-number initialization

All three programs call `RND(1)` without first initializing a varying random seed.
Equivalent reset/load/run sequences can therefore produce the same character attributes,
monster choices, and game outcomes.

An improvement is to call `RND(-TI)` once after human input and before the first random
choice. `TI` supplies a timer value, and the input adds variation even if the user
automatically starts the program at a predictable time. Assign the result to a variable
rather than printing an otherwise unused random number. Keep subsequent random choices
as `RND(1)`; reseeding on every choice is unnecessary.

| Program | Suggested placement |
| --- | --- |
| Character creator | Add a keypress prompt before the attribute rolls at 1200–1220, then seed once. This also precedes the starting points and gold calculations at 1550–1560. |
| Dungeon generator | Seed once after an initial keypress, before the first guard selection at 240. |
| Game | Seed after loading the hero, before returning from that routine. |

## Normal exits: STOP versus END

The book uses `STOP` at the programs' normal exits:

| Program | BASIC line |
| --- | --- |
| Dungeon generator | 220 |
| Character creator | 560 |
| Game | 340 |

Replacing these with `END` would avoid the `BREAK IN ...` message and return quietly to
`READY.`.

## Optional source cleanup

These changes are not required to run the programs and can make comparison with the book
less direct.

### Omit LET

`LET` is optional in Commodore BASIC. Removing it saves token space and may improve the
load time and performance of the programs.

### Combine consecutive PRINT statements

Consecutive prints can sometimes be combined without changing their output:

```basic
print bg$(2);:print bg$(0);
```

is equivalent to:

```basic
print bg$(2);bg$(0);
```

Preserve the final semicolon, or its absence, to retain newline behavior. Remove
redundant control sequences where appropriate before combining statements. Keep the C64
screen editor's 80-character logical-line limit in mind when editing listings intended
for paste.
