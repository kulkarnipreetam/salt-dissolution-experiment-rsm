/*Data first order model*/
data data1;
	input water temp stirs yield;
	z1 = (water - 197.16) / 39.43;
	z2 = (temp - 87.5) / 12.5;
	z3 = (stirs - 3) / 1;
	lines;
	236.59 75 4 51.98
	157.73 75 2 76.87
	197.16 87.5 3 54.81
	236.59 100 4 40.49
	157.73 100 2 67.26
	236.59 100 2 60.26
	236.59 75 2 73.85
	197.16 87.5 3 54.4
	157.73 75 4 58.19
	197.16 87.5 3 51.67
	157.73 100 4 42.12
	197.16 87.5 3 51.54
;
proc print data=data1;

/*Fit first order model*/
proc glm data=data1;
	model yield = z1 z2 z3;
	output out=data1out p=yhat r=e rstudent=tres; proc print;
run;

/*Normality test*/
/* Normal Residuals*/
proc rank normal=blom out=enrm data=data1out;
var e;
ranks enrm;
run;

/*Serial Correlation plot*/
data data1new; set data1out; set enrm;
	label e = "Residuals";
	label yhat = "Estimated Mean boot time";
	label enrm = "Normal Scores";
	id = _n_;
	label id = 'Observation Number';

	goptions reset=all;
	symbol1 v=dot i=join c=black;
	axis1 label=(angle = 90);
	proc gplot data=data1new;
	plot e*id /vref= 0 vaxis=axis1;
run;

proc corr data=data1new;
	var e enrm;
	goption reset = all;
	axis1 label=(angle = 90);
	axis2 offset=(5,5) minor=none;
	symbol1 v=dot c=black;

/*residual vs yhat*/
proc gplot data=data1new;
	plot e*yhat/vref=0 vaxis=axis1 haxis=axis2;
/*studentized residual vs yhat*/
proc gplot data=data1new;
	plot tres*yhat/vref=0 vaxis=axis1 haxis=axis2;
/*normal plot*/
proc gplot data=data1new;
	plot e*enrm/vaxis=axis1;
	
/*Data first order model*/
data data2;
	input water temp stirs yield;
	z1 = (water - 220) / 20;
	z2 = (temp - 110) / 10;
	z3 = (stirs - 6) / 1;
	lines;
	240 100 5 42.04
	200 120 5 28.48
	240 120 7 23.66
	220 110 6 31.8
	240 100 7 27.16
	200 100 5 45.23
	220 110 6 31.4
	200 120 7 24.71
	220 110 6 30.01
	200 100 7 24.77
	240 120 5 26.28
	220 110 6 31.26
;
proc print data=data2;

/*Fit second first-order model*/
proc glm data=data2;
	model yield = z1 z2 z3;
	output out=data2out p=yhat2 r=e2 rstudent=tres2; proc print;
run;

proc glm data=data2;
	model yield = z1 z2 z3 z1*z2 z1*z3 z2*z3 z1*z1;
	output out=data2sout p=yhat2s r=e2s rstudent=tres2s; proc print;
run;

/*Data second order ccd model*/
data data3;
	input water temp stirs yield;
	z1 = (water - 220) / 20;
	z2 = (temp - 110) / 10;
	z3 = (stirs - 6) / 1;
	lines;
	240 100 5 42.04
	200 120 5 28.48
	240 120 7 23.66
	220 110 6 31.8
	240 100 7 27.16
	200 100 5 45.23
	220 110 6 31.4
	200 120 7 24.71
	220 110 6 30.01
	200 100 7 24.77
	240 120 5 26.28
	220 110 6 31.26
	220 110 6 30.87
	220 110 6 28.51
	180 110 6 35.25
	240 120 7 24.55
	220 130 6 21.52
	220 110 6 29.92
	220 90 6 38.71
	220 110 6 32.37
	220 110 6 28.89
	220 110 8 21.25
	200 120 7 26.91
	200 100 7 23.81
	240 100 7 28.11
	220 110 6 33.25
	220 110 6 31.72
	220 110 4 41.04
	220 110 6 30.14
	240 120 5 26.73
	200 120 5 28.92
	220 110 6 34.33
	260 110 6 28.11
	220 110 6 32.55
	240 100 5 39.06
	200 100 5 43.77
;
proc print data=data3;

/*Fit second order ccd model*/
/*RS regression*/
proc sort data=data3;
	by water temp stirs;
proc rsreg data=data3;
	model yield = water temp stirs/ covar=0 lackfit;
run;
