# Dungeon of Doom for the C64

Dungeon of Doom is a game described in the Usborne Publishing book; "Write your own fantasy games for
your microcomputer" by Les Howarth and Cheryl Evans.  In that book, the reader is encouraged to type
out the game from the source listings in the book into their own microcomputer.  Supported models
include the the Commodore 64, VIC-20, BBC Micro, Acorn Electron and the Sinclair ZX Spectrum.

In this repository, you can find the C64 version of the code for your review.  To learn more about
how to use the applications, please be sure to check out the Usborne website and download your copy
of the book for free.

* https://usborne.com/browse-books/features/computer-and-coding-books/

## Notes to self

The current version of game.bas has a couple of bugs that cause the game to crash

* Reading data at line 2950 sometimes runs out of data unless I add extra
* Should the game actually load, it hits a 'out of memory' error on line 60
  * This one feels like an issue where there are too many 'gosubs'

This could be the result of bugs in the character.bas or dungeon.bas code, because we might not be saving the data correctly.  It could be a case that I have some errors in my transcription form the book.  Or it could be a bug in the original code that the authors missed.  So I'm not sure what's going on.

I'm still very new at debugging BASIC games so this has been interesting.

With this branch, the point is to label everything and give me an idea of what's going on, and then my hopes are that some of the issues will become more obvious as I learn to understand what BASIC code is and does, specially on the C64.
