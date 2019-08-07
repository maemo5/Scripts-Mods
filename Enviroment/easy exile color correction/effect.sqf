/*	Easy color correction for Exile.			
	Thanks to MGTDB for showing me the way on this.
 	
	Installation: 
	Add this file to your Exile.Altis.pbo in the main directory. 
	Add the following line of code to the very top of your InitPlayerLocal.sqf file:
	
	call compileFinal preprocessFileLineNumbers "effect.sqf"; // color correction script
	
	Comment out or uncomment any one of the preset colors listed in the effect.sqf or feel
	free to add your own. 
	
	To generate your own correction:
	Paste any one of the presets from effect.sqf into the Eden debug console. Make your changes, then copy those changes to a new
	preset in the effect.sqf file. 
	
	So easy, even I can do it.
	
	Syntax: Explains what the numbers affect.
	
	[
		brightness, 
		contrast, 
		offset, 
		[blendR, blendG, blendB, blendA], 
		[colorizeR, colorizeG, colorizeB, colorizeA], 
		[weightR, weightG, weightB, 0],
		[a, b, angle, cx, cy, innerRCoef, interpCoef]  // I didn't alter these vales in any of the presets, hence only 3 sets of variables.
	];

	Defaults:
	Arma 3 defaults
	[
		1, 
		1, 
		0, 
		[0, 0, 0, 0], 
		[1, 1, 1, 1], 
		[0.299, 0.587, 0.114, 0],
		[-1, -1, 0, 0, 0, 0, 0]
	];


*/







ppEffectDestroy ExileClientPostProcessingColorCorrections;
ppEffectDestroy ExileClientPostProcessingBorderVignette;

// Arma 3 default.

//	"ColorCorrections" ppEffectEnable true;    
//	"ColorCorrections" ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0.299, 0.587, 0.114, 0]];   
//	"ColorCorrections" ppEffectCommit 0;


// Exile default...I think.

//	"ColorCorrections" ppEffectEnable true;    
//	"ColorCorrections" ppEffectAdjust [.65, 1.08, -0.04, [0.2, 0.4, 0.8, -0.22], [1, 1, 1.3, 1.3], [0, 0.5, .5, 0.0]];   
//	"ColorCorrections" ppEffectCommit 0;


// Blueish. Very dark during daylight.

//	"ColorCorrections" ppEffectEnable true;    
//	"ColorCorrections" ppEffectAdjust [.35, 1.48, -0.04, [0.6, 0.4, 0, -0.22], [1, 1, 1.8, 1.3], [0, 0.5, .5, 0.0]];   
//	"ColorCorrections" ppEffectCommit 0;

// Apocalypse yellow

//	"ColorCorrections" ppEffectEnable true;    
//	"ColorCorrections" ppEffectAdjust [.55, .85, 0, [0, 0, 4, -0.98], [.25, .70, 0, 1.3], [.50, .50, .50, 0]];   
//	"ColorCorrections" ppEffectCommit 0;


//Silent Hill...no shit...lots of blue. Very dark during daylight.

//	"ColorCorrections" ppEffectEnable true;    
//	"ColorCorrections" ppEffectAdjust [.55, .85, 0, [1, .05, -.09, -0.98], [0, 0, 0, .95], [0, 0, .09, 0]];   
//	"ColorCorrections" ppEffectCommit 0;

//Less Blue (this is my favorite) Very dark during daylight.

//	"ColorCorrections" ppEffectEnable true;     
//	"ColorCorrections" ppEffectAdjust [.55, .85, 0.1, [1, .4, 0, -0.25], [0, -1, -1, 0.7], [0, 0, .09, 0]];    
//	"ColorCorrections" ppEffectCommit 0; 

//B&W with a touch of blue.

//	"ColorCorrections" ppEffectEnable true;     
//	"ColorCorrections" ppEffectAdjust [1, 0.60, 0, [0, 0, 0, 0], [1, 1, 1.2, 0], [1, 1, -1, 0]];    
//	"ColorCorrections" ppEffectCommit 0;

//Angry red planet

//	"ColorCorrections" ppEffectEnable true;     
//	"ColorCorrections" ppEffectAdjust [.70, 0.90, 0, [0, 0, 0, 0], [2, 1, 1, 0], [0, 1, 1, 0]];    
//	"ColorCorrections" ppEffectCommit 0;

//Rad blasted

//	"ColorCorrections" ppEffectEnable true;     
//	"ColorCorrections" ppEffectAdjust [.50, 0.90, 0, [0, 0, 0, 0], [1.9, 1.6, 1, .60], [0, 1, 1, 0]];    
//	"ColorCorrections" ppEffectCommit 0;

//Rad scorched...right after that nuke went off
	
//	"ColorCorrections" ppEffectEnable true;     
//	"ColorCorrections" ppEffectAdjust [.30, 1.6, 0, [0, 0, 0, 0], [1.9, 1.6, 1, .50], [0, 1, 1, 0]];    
//	"ColorCorrections" ppEffectCommit 0;

// Desert baked sand

//	"ColorCorrections" ppEffectEnable true;     
//	"ColorCorrections" ppEffectAdjust [1.10, 1.15, 0.25, [0, .25, .80, -0.25], [0, -1, -1, 0.7], [0, 0, .09, 0]];    
//	"ColorCorrections" ppEffectCommit 0;

//Realistic Color Correction theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]];
//	"ColorCorrections" ppEffectCommit 0;

//Post Apocalyptic theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [1, 0.9, -0.002, [0.0, 0.0, 0.0, 0.0], [1.0, 0.6, 0.4, 0.6],  [0.199, 0.587, 0.114, 0.0]];  
//	"ColorCorrections" ppEffectCommit 0;  

//Nightstalkers theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [1, 1.1, 0.0, [0.0, 0.0, 0.0, 0.0], [1.0,0.7, 0.6, 0.60], [0.200, 0.600, 0.100, 0.0]];
//	"ColorCorrections" ppEffectCommit 0;

//OFP Gamma theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.6, 1.4, 0.6, 0.7],  [0.199, 0.587, 0.114, 0.0]];  
//	"ColorCorrections" ppEffectCommit 1;  

//Golden autumn theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1.8, 1.8, 0.3, 0.7],  [0.199, 0.587, 0.114, 0.0]];  
//	"ColorCorrections" ppEffectCommit 0;  

//Africa theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust[ 1, 1.3, 0.001, [-0.11, -0.65, -0.76, 0.015],[-5, -1.74, 0.09, 0.86],[-1.14, -0.73, 1.14, -0.09]];
//	"ColorCorrections" ppEffectCommit 0;

//Afghan theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [0.9, 0.9, 0, [0, 0.1, 0.25, -0.14], [1, 1, 1, 1.26], [0.15, 0.09, 0.09, 0.0]];
//	"ColorCorrections" ppEffectCommit 0;

//Middle East theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [0.9, 1, 0, [0.1, 0.1, 0.1, -0.1], [1, 1, 0.8, 0.528],  [1, 0.2, 0, 0]];
//	"ColorCorrections" ppEffectCommit 0;

//Real Is Brown theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [1,1,0,[0.1,0.2,0.3,-0.3],[1,1,1,0.5],[0.5,0.2,0,1]];
//	"ColorCorrections" ppEffectCommit 0;

//Gray Tone theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [1.0, 1.0, 0.0,[1.0, 1.0, 1.0, 0.0],[1.0, 1.0, 0.9, 0.35],[0.3,0.3,0.3,-0.1]];
//	"ColorCorrections" ppEffectCommit 0;

//Cold Tone theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [1.0, 1.0, 0.0,[0.2, 0.2, 1.0, 0.0],[0.4, 0.75, 1.0, 0.60],[0.5,0.3,1.0,-0.1]];
//	"ColorCorrections" ppEffectCommit 0;

//Winter Blue theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [1.1, 1.3, 0.0, [0.5, 0.5, 0.1, -0.1], [0.4, 0.75, 1.0, 0.60], [0.5,0.3,1.0,-0.1]];
//	"ColorCorrections" ppEffectCommit 0;

//Winter White theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [1, 1, 0, [0.31, 0.31, 1.0, 0.1], [0.85, 0.85, 0.92, 0.48], [1 , 1, 1, 0.03]];
//	"ColorCorrections" ppEffectCommit 0;

//Mediterranean theme

//	"ColorCorrections" ppEffectEnable true;
//	"ColorCorrections" ppEffectAdjust [1.01, 1.18, -0.04, [1.0, 1.4, 0.8, -0.04], [0.55, 0.55, 0.72, 1.35],  [0.699, 1.787, 0.314, 20.03]];  
//	"ColorCorrections" ppEffectCommit 1;