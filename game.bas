1 rem game module
5 gosub 5000:poke 53281,0
10 gosub 2500
20 gosub 2010
30 gosub 1770
39 rem input handling
40 get i$
50 if i$="a" and dx<255 then gosub 870
60 if i$="c" and f(7)>0 and o(17)+o(18)>0 then gosub 990
70 if i$="g" then gosub 1410
80 if i$="p" then gosub 1660
90 if i$="r" then gosub 1690
100 if i$="s" then gosub 2260
110 if i$="b" then let nf=nf-1
120 if i$="n" then let nf=nf+1
130 if nf>4 then let nf=1
140 if nf<1 then let nf=4
150 if i$="m" then let nx=nx+d(nf,1): let ny=ny+d(nf,2)
160 if ny>15 then let ny=15
170 if ny<1 then let ny=1
180 if nx<1 then let nx=1
190 if nx>15 then let nx=15
200 let rh=r(nx,ny)
210 if rh=c1 then x=nx:y=ny:gosub 570:nx=ox:ny=oy:f(1)=f(1)-0.03
220 if rh=c6 then let tx=nx:let ty=ny:let tf=1
230 if tf=1 then let nx=tx:let ny=ty
240 if f(1) > s1*.8 and int(rnd(1)*8+1)<f(6) then let tf=0
250 if i$>"" then let f(1)=f(1)*0.99
260 if f(1) < s1 then let f(1)=f(1)+(f(2)/1100)
270 gosub 480
280 if ox<>nx or oy<>ny then let x=ox:let y=oy:gosub 570
290 let ox=nx:let oy=ny
300 if dx<255 then gosub 620
310 if f(1)>0 and fi<1 and rh<>c5 then gosub 40
320 if rh=c5 then let m$=t$(12):gosub 430: gosub 1760: goto 40
330 if f(1)<1 then gosub 810
340 print hm$;left$(cu$,10);spc(0);:stop
350 poke vs+1,j:poke vs+4,33
355 poke vs+4,32:return
360 poke vs+8,j:poke vs+11,129
365 poke vs+11,128:return
370 print bg$(2);
380 print hm$;left$(cu$,5);spc(0);m$;
390 get i$
400 if i$="" then goto 390
410 print hm$;left$(cu$,5);spc(0);left$(b$,w);:let m$=""
420 return
430 print bg$(2);
440 print hm$;left$(cu$,5);spc(0);m$;
450 for d=1 to 200: next d
460 print hm$;left$(cu$,5);spc(0);left$(b$,w);:let m$=""
470 return
479 rem subroutine here
480 print bg$(1);
490 print hm$;left$(cu$,ny+5);spc(nx);mid$(f$,nf,1);
500 print bg$(1);
510 print hm$;left$(cu$,8);spc(16);int(f(1));chr$(157);" ";
520 print hm$;left$(cu$,11);spc(16);int(f(2));chr$(157);" ";
530 print hm$;left$(cu$,14);spc(16);int(f(7));chr$(157);" ";
540 print hm$;left$(cu$,17);spc(16);mid$("nesw.",nf,1);
550 print hm$;left$(cu$,20);spc(16);int(f(5));
560 return
569 rem subroutine here
570 print bg$(1);
580 let rm=r(x,y):print hm$;left$(cu$,y+5);spc(x);chr$(rm);
590 if abs(dx)<4 or rm<=c7 then return
600 let mt=rm:let m=mt-c2:let mv=m/16:let ms=m*6:let dx=3:let lx=x:let ly=y
610 return
619 rem subroutine here
620 let dx=lx-nx:let sx=sgn(dx):let dy=ly-ny:let sy=sgn(dy)
630 let mx=lx-(mv*sx):let my=ly-(mv*sy):let rm=r(mx,my)
640 if rm>c0 and rm<>mt then let my=ly:let mx=lx
650 let r(lx,ly)=c0:let x=lx:let y=ly:gosub 570
660 let r(mx,my)=mt:let x=mx:let y=my:gosub 570
670 let lx=mx:let ly=my:let h=0
680 if abx(dx)<=1 and abs(dy)<=1 and rh<>c7 then let h=m*.5:let j=h:gosub 350
690 if h*12<f(6)+f(3) then return
700 let m$=t$(5):gosub 430:gosub 360
710 let h=h/(3+o(9) + o(10) + o(11) + o(12) + o(13) + o(14))
720 let f(1)=f(1)-h:let f(2)=f(2)-(h/101)
730 let i=1:let wb=0:let mb=int(rnd(1)*m+1)
740 let j=mt:gosub 350:gosub 360
750 if mb=1 and o(i)>0 then gosub 780
760 if i<11 then let i=i+1:gosub 750
770 return
779 rem subroutine here
780 let o(i)=0:let m$=t$(8)+" "+w$(i):gosub 430
790 let mb=0:gosub 360:let j=i:gosub 350
800 return
809 rem subroutine here
810 let nf=5:let f(1)=0:gosub 440
820 print hm$;left$(cu$,5);spc(1);"thou has expired!"
830 for j=150 to 1 step -4
840 gosub 350: gosub 360: gosub 570: gosub 480
850 next j
860 return
870 let m$=t$(int(rnd(1)*3+1)):gosub 360
880 let h=f(1)+o(1)+o(2)+o(3)+o(4)+o(5)+o(7)+o(8)+int(rnd(1)*f(6)+1)
890 if f(3)+f(6)<int(rnd(1)*m+1)+2 then let m$=t$(4):let ht=0
900 let ms=ms-h:gosub 430
910 let f(1)=f(1)-(h/100):let f(5)=f(5)+.05
920 if ms<1 then gosub 940
930 return
940 let dx=255:let ms=0:let r(mx,my)=c0
950 let f(5)=f(5)+.1
960 let m$=t$(6):gosub 430
970 for j=200 to 150 step -8: gosub 350: gosub 360: next j
980 gosub 570: return
990 gosub 480: print bg$(2);
1000 print hm$;left$(cu$,1);spc(0);"you may use magicks";
1010 if o(17)>0 then print hm$;left$(cu$,2);spc(0);"from necronomicon";
1020 if o(18)>0 then print hm$;left$(cu$,3);spc(0);"from the scrolls";
1030 print hm$;left$(cu$,0);spc(4);"consult the lore";
1040 let m$="use spell number?": gosub 370
1050 let sl=val(i$)
1060 if sl=0 or (o(17)=0 and sl<5) or (o(18)=0 and sl>3) or sl>6 then goto 1040
1070 let m(sl)=m(sl)-1:let x=nx:let y=ny
1080 if m(sl)<0 then let m$=t$(9):let sl=7
1085 print bg$(2);
1090 for j=1 to 5: print hm$;left$(cu$,j);spc(0);left$(b$,w);:next j: gosub 570
1100 on sl gosub 1140,1190,1220,1280,1300,1390,1130
1110 let f(5)=f(5)+.2
1120 gosub 430
1130 return
1140 for j=1 to 12
1150 gosub 350: gosub 360
1160 next j
1170 if dx<255 then let x=mx:let y=my: gosub 940
1180 return
1190 if rh=c0 then let r(nx,ny)=c7
1200 let j=100: gosub 350: let j=200: gosub 350
1210 return
1220 let nx=int(rnd(1)*13+1):let ny=int(rnd(1)*13+1)
1230 for j=0 to 255 step 8
1240 gosub 360: gosub 350
1250 next j
1260 gosub 480
1270 return
1280 f(2)=f(2)+int(rnd(1)*m(sl)+1):f(1)=f(1)+int(rnd(1)*m(sl)+1):f(7)=f(7)-1
1290 return
1300 for j=1 to 30
1310 let r(nx,ny)=int(rnd(1)*8+1)+1+c0
1320 gosub 350: gosub 570
1330 next j
1340 if rh<=c7 then let dx=255: let ms=0
1350 for j=1 to 20 step 4
1360 gosub 350
1370 next j
1380 return
1390 let f(2)=s2:let f(1)=s1:let f(7)=f(7)-1
1400 return
1410 let gx=nx+d(nf,1):let gy=ny+d(nf,2)
1420 if gx<0 then let gx=0
1430 if gy<0 then let gy=0
1440 if gx>15 then let gx=15
1450 if gy>15 then let gy=15
1460 let gt=r(gx,gy):if gt>c1 and gt<c4 then let r(gx,gy)=c0
1470 if gt=c2 then let o(23)=o(23)+1:let o(24)=o(24)+1
1480 if gt=c3 then let tr=tr+1
1490 if gt=c4 then gosub 1550
1500 let x=gx:let y=gy: gosub 570
1510 if gt>c1 and gt<c4 then let j=gt: gosub 350: let j=gt+5: gosub 350
1520 return
1530 let j=o(24)+o(23)*10:gosub 350
1540 return
1550 print bg$(2);
1560 print hm$;left$(cu$,1);spc(0);" thy quest is over! ";
1570 for i=1 to 18
1580 let j=t(i): gosub 350
1590 let x=nx:let y=ny
1600 for n=1 to 4: let nf=n: gosub 480: next n
1610 next i
1620 let ms=0
1630 print hm$;left$(cu$,2);spc(1);"thy score=";
1635 print int((tr*10)+(gc*f(5))+f(1)+f(2)+f(3))
1640 let fi=1
1650 return
1660 if o(24)>0 and f(1)<s1 then let f(1)=s1:let o(24)=o(24)-1
1670 if o(23)>0 and f(2)<s2 then let f(2)=s2:let o(23)=o(23)-1
1680 return
1690 if lt=0 then let m$=t$(7): gosub 430: return
1700 for y=ny-3 to ny+3
1710 for x=nx-3 to nx+3
1720 for (x>0 and x<16) and (y>0 and y<16) then gosub 570
1730 next x: next y
1740 let lt=lt-1
1750 return
1760 if f(5)<s3+1 then let m$=t$(11):let nx=ox:let ny=oy:gosub 430: return
1770 print chr$(147):print hm$;left$(cu$,3);spc(0);"prepare dungeon tape"
1780 let m$=t$(10): gosub 370
1790 open 1,1,0,"level"
1795 s$="":for i=1 to 3
1800 input#1,tp$:s$=s$+tp$
1805 next i
1810 close 1
1820 let i=1
1830 for y=1 to 15
1840 for x=1 to 15
1850 let r(x,y)=asc(mid$(s$,i,1))
1860 let i=i+1
1870 next x
1880 next y
1890 let ix=asc(mid$(s$,i,1))-os
1900 let iy=asc(mid$(s$,i+1,1))-os
1910 let le=asc(mid$(s$,i+2,1))-os
1920 if le>f(5) then gosub 1960: goto 1760
1930 gosub 2790
1940 let nx=ix:let ny=iy:let ox=nx:let oy=ny:let dx=255
1950 return
1960 print:print"level too deep"
1970 print "rewind tape"
1980 print "to position"
1990 print "for level";f(5)
2000 return
2010 print chr$(147):print hm$;left$(cu$,3);spc(0);"prepare hero tape"
2020 let m$=t$(10): gosub 370
2030 open 1,1,0,"hero"
2040 input#1,s$
2050 close 1
2060 let p=2
2070 let ot=asc(mid$(s$,1,1))-as
2080 for i=1 to 8
2090 let f(i)=asc(mid$(s$,p,1))-as
2100 let p=p+1
2110 next i
2120 for i=1 to ot
2130 let o(i)=asc(mid$(s$,p,1))-as
2140 let p=p+1
2150 next i
2160 let gc=asc(mid$(s$,p,1))-as
2170 let tr=asc(mid$(s$,p+1,1))-as
2180 let c$=right$(s$,len(s$)-(p+1))
2190 let s1=f(1):let s2=f(2):let s3=f(5)
2200 for i=1 to 2
2210 for j=1 to 3
2220 let m((i-1)*3+j)=o(16+i)*f(7)
2230 next j: next i
2240 if o(16)=1 then let lt=20
2250 return
2260 let m$="one moment please": gosub 430
2270 let s$="":let t$=""
2280 for y=1 to 15
2290 for x=1 to 15
2300 let t$=t$+chr$(r(x,y))
2310 next x:next y
2320 let t$=t$+chr$(os+nx)
2330 let t$=t$+chr$(os+ny)
2340 let t$=t$+chr$(os+le)
2350 let s$=s$+chr$(as+ot)
2360 for i=1 to 8
2370 let s$=s$+chr$(f(i)+as)
2380 next i
2390 for i=1 to ot
2400 let s$=s$+chr$(o(i)+as)
2410 next i
2420 let s$=s$+chr$(gc+as)
2430 let s$=s$+chr$(tr+as)
2440 let s$=s$+c$
2450 let m$="any key to save": gosub 370
2460 open 1,1,1,"hero":print#1,s$:close 1
2465 open 1,1,1,"level":for i=0 to 2
2470 print#1,mid$(t$,i*76+1,76)
2475 next i:close 1
2480 let fi=1
2490 return
2499 rem major setup subroutine
2500 let c$="role playing game":let b$=""
2510 let w=40: let os=96
2520 for i=1 to w:let b$=b$+" ":next i
2530 dim r(15,15),f(8),o(24)
2540 dim w$(11),t$(12)
2550 dim m(6),d(4,2),t(18)
2560 data "gr sword","sword","axe","mace","flail","dagger","armour","armour"
2570 data "armour", "helmet", "headpc."
2580 for i=1 to 11
2590 read w$(i)
2600 next i
2610 data "a good blow","well hit sire","thy aim is true","missed!","hit thee!!"
2620 data "the monster is slain","no light","broken thy ","spell exhausted"
2630 data "press any key","you need experience","exit from this level"
2640 for i=1 to 12
2650 read t$(i)
2660 next i
2670 data 0,-1,1,0,0,1,-1,0
2680 for i=1 to 4:read d(i,1),d(i,2):next i
2690 let fi=0:let dx=255:let nf=0
2700 let tx=0:let ty=0:let tf=0:let tr=0
2710 let mx=0:let my=0:let dy=12:let f$=""
2720 let nx=1:let ny=1:let re=0:let lt=0
2730 for i=1 to 5
2740 let f$=f$+chr$(os+i)
2750 next i
2760 data 69,117,73,121,81,129,69,117,73,121,81,129,89,137,97,145,101,149
2770 for i=1 to 18:read t(i):next i: gosub 2930
2780 return
2790 poke 53280,0:poke 53281,1:print bg$(1);
2795 print chr$(147);:for i=0 to 998:print chr$(32);:next i
2797 poke 33767,160:poke 56295,2
2800 print hm$;chr$(144);bg$(0);
2810 print c$;left$(b$,w-len(c$));
2820 print bg$(2);
2830 for i=1 to 5:print left$(b$,w);:next i
2835 print bg$(1);:print bg$(0);
2840 print bg$(1);chr$(144);
2850 for i=1 to 15:print hm$;left$(cu$,5+i);spc(1);left$(b$,15);:next i
2860 print bg$(1);
2870 print hm$;left$(cu$,7);spc(16);"str";
2880 print hm$;left$(cu$,10);spc(16);"vit";
2890 print hm$;left$(cu$,13);spc(16);"aur";
2900 print hm$;left$(cu$,16);spc(16);"face";
2910 print hm$;left$(cu$,19);spc(16);"exp";
2920 return
2930 rem *** user def'd characters ***
2940 gosub 4000
2950 for i=0 to 143:read a: poke 36352+i,255-a:next i
2960 vs=54272
2970 poke vs+24,15
2980 poke vs+5,9:poke vs+6,0
2990 poke vs+12,9:poke vs+13,0
3000 poke vs+7,0:poke vs,0
3170 let as=65:let c0=os+6
3180 let c1=c0+1:let c2=c0+2:let c3=c0+3:let c4=c0+4
3190 let c5=c0+6:let c6=c0+7:let c7=c0+8:let c8=c0+12
3200 return
3500 data 255,255,255,255,255,255,255,255
3510 data 56,56,16,56,84,16,40,68
3520 data 28,28,8,30,40,40,20,18
3530 data 56,56,16,84,56,40,68,40
3540 data 56,56,16,120,148,20,40,72
3550 data 0,0,0,0,8,209,254,221
3560 data 0,0,0,0,0,0,0,0
3570 data 85,170,85,170,85,170,85,170
3580 data 0,60,24,60,126,126,126,60
3590 data 0,56,100,114,95,73,41,31
3600 data 20,42,20,20,93,93,62,99
3610 data 60,126,255,255,255,253,255,255
3620 data 60,102,195,129,129,129,133,129
3630 data 129,66,36,0,0,36,66,129
3640 data 0,60,66,66,66,66,60,0
3650 data 76,158,170,190,84,30,37,88
3660 data 0,56,84,124,56,44,68,102
3670 data 0,8,28,42,127,85,65,34
4000 bg$(0)=chr$(146):bg$(1)=chr$(18)+chr$(28)
4010 bg$(2)=chr$(18)+chr$(31):bg$(3)=chr$(18)+chr$(5)
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