1   rem character creator
10  gosub 1060
20  print chr$(147)
25  poke 53280,0:poke 53281,0
30  let j=1:let h=mp:let h$="points"
40  gosub 810:gosub 900
50  let k=1:let p=t+1
60  print hm$;left$(cu$,p);spc(1);">";
70  gosub 720
80  if k=5 then goto 70
90  if i$="+" and h>0 then let f(j,k)=f(j,k)+1:let h=h-1:gosub 920
100 if i$="-" and f(j,k)>1 then let f(j,k)=f(j,k)-1:let h=h+1:gosub 920
110 let c=1
120 if f(1,4)>6 and f(1,8)>7 then let c=2
130 if f(1,4)>8 and f(1,7)>7 then let c=3
140 if f(1,1)>7 and f(1,8)>5 and f(1,1)+f(1,2)>10 then let c=4
150 if f(1,1)>8 and f(1,2)+f(1,3)>12 and f(1,8)<6 then let c=5
160 let m$=c$(c)
170 gosub 860
180 if i$<>" " then goto 70
190 let h=gc:let h$="gold coins:"
200 for j=2 to 4
210 let k=1:let p=t+1
220 let m$="choose well sire!"
230 gosub 810
240 gosub 900
250 print hm$;left$(cu$, p);spc(1);">";
260 gosub 720
270 let n=8*(j-2)+k
280 let m$="make your choice"
290 gosub 680
300 let br=0:let of=0
310 if i$="+" then let of=f(j,k):gosub 610
320 if i$="-" then let br=int(rnd(1)*3+1):gosub 570
330 gosub 860
340 if i$ <>" " then goto 260
350 next j
360 print hm$;left$(cu$,2);spc(1);"name thy character";
370 print hm$;left$(cu$,3);spc(1);left$(b$,w-2);:print hm$;left$(cu$,3);spc(1);
380 x=1:y=3:gosub 1700:n$=in$
390 if len(n$)>10 then goto 360
400 print hm$;left$(cu$,3);spc(1);"one moment please";
410 print hm$;left$(cu$,3);spc(1);
420 let o=d*3
430 let s$=chr$(o+as)
440 for i=1 to 8
450 let s$=s$+chr$(f(1,i)+as)
460 next i
470 for i=1 to o
480 let s$=s$+chr$(o(i)+as)
490 next i
500 let s$=s$+chr$(h+as)
510 let s$=s$+chr$(as)
520 let s$=s$+n$+" -"+c$(c)
530 open 1,1,1,"hero"
540 print#1,s$
550 close 1
560 stop
570 let m$="":gosub 860
580 print hm$;left$(cu$, 2);spc(2);"your offer";
590 x=14:y=2:gosub 1700:of=val(in$)
600 gosub 680
610 if o(n)>0 and n<23 then let m$="you have it sire":return
620 let pr=f(j,k)-br
630 if h<pr then let m$="you cannot afford":return
640 if of>=pr and y=1 then let o(n)=o(n)+p(n):let h=h-pr:let m$="tis yours'"
650 if of<pr and y=1 then let m$="offer rejected"
660 if h<0 then let h=0
670 return
680 let y=0
690 if mid$(o$(n),c,1)="1" then let y=1
700 if y=0 then let m$="not for "+c$(c)
710 return
720 get i$
730 if i$="" then goto 720
740 print bg$(3);
750 print hm$;left$(cu$,p);spc(1);" ";
760 if i$="a" and k>1 then let k=k-1
770 if i$="z" and k<d then let k=k+1
780 let p=k*2+t-1
790 print hm$;left$(cu$,p);spc(1);">";
800 return
810 print bg$(2);:print bg$(0);
820 print hm$;left$(cu$,0);spc(0);left$(b$,w);
830 print hm$;left$(cu$,0);spc(0);f$(j,9)
840 let bg=2:let fg=3:let t=1:let l=2
850 gosub 980
860 print bg$(0);:print bg$(2);
870 print hm$;left$(cu$,2);spc(2);left$(b$,17);hm$;left$(cu$,2);spc(2);m$;
875 print hm$;left$(cu$,3);spc(15);left$(b$,4);
880 print hm$;left$(cu$,3);spc(2);h$;hm$;left$(cu$,3);spc(15);h;" ";
890 return
900 let bg=3:let fg=2:let t=5:let l=15
910 gosub 980
920 print bg$(0);:print bg$(3);
930 for i=1 to 8
940 let y=t+(i-1)*2+1
945 print hm$;left$(cu$,y);spc(15);left$(b$,5);
950 print hm$;left$(cu$,y);spc(2);f$(j,i);hm$;left$(cu$,y);spc(16);f(j,i);" ";
960 next i
970 return
980 print hm$;left$(cu$,t);spc(0);
990 print bg$(fg);:print left$(b$,w);
1000 print bg$(fg);:print bg$(bg);
1010 for i=1 to l
1020 print bg$(fg);" ";bg$(bg);left$(b$,w-2);bg$(fg);" ";
1030 next i
1040 print bg$(fg);:print left$(b$,w);
1050 return
1060 gosub 1600
1070 let d=8
1080 dim f(4,d+1)
1090 dim f$(4,d+1)
1100 dim c$(5)
1110 dim o(d*3)
1120 dim o$(d*3)
1130 dim p(d*3)
1140 data "00001","00011","10011","10011","10011","00011","11111","10011"
1150 data "00011","00011","10011","11111","00011","11011","11011","11111"
1160 data "11100","00100","11100","10100","11100","11100","11111","11111"
1170 for i=1 to d*3
1180 read o$(i)
1190 next i
1200 for i=1 to 8
1210 let f(1,i)=int(rnd(1)*5+1)+2
1220 next i
1230 let f(1,5)=1
1240 data 20,16,12,15,8,10,8,6
1250 data 18,15,9,9,14,8,6,6
1260 data 20,15,14,12,10,8,6,6
1270 for j=2 to 4
1280 for i=1 to 8
1290 read f(j,i)
1300 next i
1310 next j
1320 data 5,4,3,3,2,2,1,1
1330 data 5,4,3,1,2,1,3,1
1340 data 4,3,2,2,3,1,1,1
1350 for i=1 to d*3
1360 read p(i)
1370 next i
1380 data "strength","vitality","agility","intelligence"
1390 data "experience","luck","aura","morality","character creation"
1400 data "2 hand sword", "boardsword", "shortsword"
1410 data "axe","mace","flail","dagger","gauntlet","armoury"
1420 data "heavy armour","chain armour","leather armour","heavy robe"
1430 data "gold helmet","headpiece","shield","torch","accoutrements"
1440 data "necronomicon","scrolls","ring","mystic amulet","sash","cloak"
1450 data "healing salve","potions","emporium"
1460 for j=1 to 4
1470 for i=1 to 9
1480 read f$(j,i)
1490 next i
1500 next j
1510 data "wanderer","cleric","mage","warrior","barbarian"
1520 for i=1 to 5
1530 read c$(i)
1540 next i
1550 let mp=3+int(rnd(1)*5+1)
1560 let gc=120+int(rnd(1)*60+1)
1570 let m$="":let as=65
1580 let b$="":for i=1 to w:let b$=b$+" ":next i
1590 return
1600 let w=40: rem set up details
1610 gosub 4000
1650 return
1700 in$=""
1710 get i$:if i$=chr$(13) then return
1720 if i$>"/" and i$<"[" then let in$=in$+i$:print hm$;left$(cu$,y);spc(x);in$;
1730 goto 1710
4000 bg$(0)=chr$(146):bg$(1)=chr$(18)+chr$(28)
4010 bg$(2)=chr$(18)+chr$(158):bg$(3)=chr$(18)+chr$(5)
4020 hm$=chr$(19):cu$="":for i=1 to w:let cu$=cu$+chr$(17):next i
4030 poke 650,255:return
