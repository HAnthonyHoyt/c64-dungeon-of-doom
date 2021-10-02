1 rem dungeon generator
5 gosub 5000
10 gosub 610
20 print chr$(147):poke 53280,0:poke 53281,0
30 let bg=2:let fg=1:let t=0:let l=3:let lw=w-3:gosub 280
40 print bg$(0);:print bg$(2);
50 print hm$;left$(cu$, 1);spc(1);"level generator";
60 print hm$;left$(cu$, 2);spc(1);"this is level:";le;
70 print hm$;left$(cu$, 3);spc(1);"press h for help"
80 let bg=3:let fg=2:let t=5:let l=15:let lw=15:gosub 280
90 let x=1:let y=1
100 get i$
110 if i$="h" then gosub 360
120 if i$="a" and y>1 then let y=y-1
130 if i$="z" and y<15 then let y=y+1
140 if i$="n" and x>1 then let x=x-1
150 if i$="m" and x<15 then let x=x+1
160 if i$>"/" and i$<":" then gosub 230
170 print bg$(0);:print bg$(3);
180 print hm$;left$(cu$, y+5);spc(x);chr$(os);
190 print hm$;left$(cu$, y+5);spc(x);chr$(r(x,y));
200 if i$="s" and ix>0 then gosub 450:goto 20
210 if i$<>"f" then goto 100
220 stop
230 let i=val(i$)
240 if i=9 then let i=8+int(rnd(1)*3+1)
250 if i=5 then let ix=x:let iy=y
260 let r(x,y)=c0+i
270 return
280 print hm$;left$(cu$,t);spc(0);
290 print bg$(fg);:print left$(b$, lw+2)
300 print bg$(fg);:print bg$(bg);
310 for i=1 to l
320 print bg$(fg);" ";bg$(bg);left$(b$,lw);bg$(fg);" "
330 next i
340 print bg$(fg);:print left$(b$, lw+2);
350 return
360 print bg$(3);:print bg$(1);
370 for h=1 to 10
380 print hm$;left$(cu$, 4);spc(1);h$(h);:gosub 430
390 print hm$;left$(cu$, 4);spc(1);left$(b$,w-2);
400 next h
410 rem leave out this line
420 return
430 get g$:if g$="" then goto 430
440 return
450 print hm$;left$(cu$, 4);spc(1);"one moment please.";
460 let s$=""
470 for j=1 to 15
480 for k=1 to 15
490 let s$=s$+chr$(r(k,j))
500 next k
510 next j
520 let s$=s$+chr$(ix+os):let s$=s$+chr$(iy+os)
530 let s$=s$+chr$(le+os)
540 print hm$;left$(cu$, 4);spc(1);"any key to save   ";:gosub 430
550 open 1,1,1,"level"
555 for i=0 to 2
560 print#1,mid$(s$,i*76+1,76)
565 next i
570 close 1
580 print hm$;left$(cu$, 4);spc(1);left$(b$,w)
590 let le=le+1:gosub 700
600 return
610 dim r(15,15),h$(10)
620 gosub 790
630 data "press any key","to move a z n m","1 wall   2 vase"
640 data "3 chest 4 * idol *","5 way in  6 exit","7 trap","8 safe place"
650 data "9 guard","0 to erase","s to save"
660 let le=1
670 for i=1 to 10
680 read h$(i)
690 next i: gosub 810
700 for j=1 to 15
710 for k=1 to 15
720 let r(j,k)=c0
730 next k
740 next j
750 let ix=0:let iy=0
760 let b$="":for i=1 to w:let b$=b$+" ":next i
770 return
790 os=96:c0=os+6:w=40:gosub 4000
800 return
810 rem read characters
820 for i=0 to 7:read a:poke 36352+i,255-a:next i
830 for i=0 to 95:read a:poke 36400+i,255-a:next i
840 return
1000 data 255,255,255,255,255,255,255,255
1010 data 0,0,0,0,0,0,0,0
1020 data 85,170,85,170,85,170,85,170
1030 data 0,60,24,60,126,126,126,60
1040 data 0,56,100,114,95,73,41,31
1050 data 20,42,20,20,93,93,62,99
1060 data 60,126,255,255,255,253,255,255
1070 data 60,102,195,129,129,129,133,129
1080 data 129,66,36,0,0,36,66,129
1090 data 0,60,66,66,66,66,60,0
1100 data 76,158,170,190,84,30,37,88
1110 data 0,56,84,124,56,44,68,102
1120 data 0,8,28,42,127,85,65,34
4000 bg$(0)=chr$(146):bg$(1)=chr$(18)+chr$(28)
4010 bg$(2)=chr$(18)+chr$(158):bg$(3)=chr$(18)+chr$(5)
4020 hm$=chr$(19):cu$="":for i=1 to w:let cu$=cu$+chr$(17):next i
4030 poke 650,255:return
5000 poke 52,128:poke 56,128
5010 poke 56334,peek(56334) and 254:poke 1,peek(1) and 251
5020 for i=0 to 2047:poke 34816+i,peek(53248+i):next i
5030 poke 1,peek(1) or 4
5040 poke 56334,peek(56334) or 1
5050 poke 56578,peek(56578) or 3
5060 poke 56576,(peek(56576) and 252) or 1
5070 poke 53272,2:poke 648,128
5080 return