#!/usr/bin/env wolframscript

t = Flatten[Import["/home/pi/Desktop/temperature.txt", "Data"]];
r = Flatten[Import["/home/pi/Desktop/rh.txt", "Data"]];

pt=ListLinePlot[{t - 10, t, t + 10}, PlotRange -> {{1,288}, {0, 50}}, 
 Frame -> True, FrameStyle -> Black, 
 PlotStyle -> {{Black, PointSize[0.005]}, {PointSize[.02], 
    Red}, {Black, PointSize[0.005]}}, 
 FrameLabel -> {"Time step", "Temperature (C)"}, Joined -> False ,GridLines -> {{72, 144, 216}, None}, GridLinesStyle -> 
 Directive[Dashed, Medium, Blue],
FrameTicks -> {{All, 
   All}, {{{72, "6am"}, {144, "12pm"}, {216, "6pm"}, {288, 
     "12am\nmid-night"}}, All}}];

pr=ListLinePlot[{r - 10, r, r + 10}, PlotRange -> {{1,288}, {0, 100}}, 
 Frame -> True, FrameStyle -> Black, 
 PlotStyle -> {{Black, PointSize[0.005]}, {PointSize[.02], 
    Blue}, {Black, PointSize[0.005]}}, 
 FrameLabel -> {"Time step", "Relative Humidity %"}, Joined -> False , GridLines -> {{72, 144, 216}, None}, GridLinesStyle -> 
 Directive[Dashed, Medium, Blue],
FrameTicks -> {{All, 
   All}, {{{72, "6am"}, {144, "12pm"}, {216, "6pm"}, {288, 
     "12am\nmid-night"}}, All}}];

tfilename="/home/pi/Desktop/T-" <>  Riffle[ToString /@ Date[][[;; 3]], "-"] <> ".png";
(*Export["/home/pi/Desktop/tempws.png", pt]*)
Export[tfilename, pt]

rfilename="/home/pi/Desktop/rh-" <>  Riffle[ToString /@ Date[][[;; 3]], "-"] <> ".png";
(*Export["/home/pi/Desktop/rhws.png", pr]*)
Export[rfilename, pr]
