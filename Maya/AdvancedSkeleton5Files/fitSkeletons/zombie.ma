//Maya ASCII 2018ff07 scene
//Name: zb.ma
//Last modified: Mon, Apr 02, 2018 01:54:27 PM
//Codeset: 936
requires maya "2018ff07";
requires -nodeType "Unfold3DOptimize" "Unfold3D" "1.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201712072005-f3f6410b30";
fileInfo "osv" "Microsoft Windows 8 Business Edition, 64-bit  (Build 9200)\n";
createNode transform -s -n "persp";
	rename -uid "76970FF0-4AA9-905E-6193-CD896C37CAF6";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.87726456317228108 19.514814227876073 47.260180036328642 ;
	setAttr ".r" -type "double3" -15.305266384381046 2.199999999999906 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "FF2F11D0-4BC7-41A1-41E4-58AF63143BE4";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 51.212650705225784;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "D48C519F-4686-CD14-1D66-2598FF4F3159";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "015535CB-43EB-D12D-8038-DE8901BCAE6E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "7F5543CE-4B01-2E06-D082-CAADC8F1CD6F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "E653CC46-4623-EEDB-8C39-398679CDF3F7";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "61525AF9-4C10-6F8C-CC9F-E49BC7AB5A67";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "8C758411-44D4-6606-5C08-57A82F60E454";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "FitSkeleton";
	rename -uid "48044E0A-4E67-2DE3-282B-5EA81709F0B5";
	addAttr -ci true -k true -sn "visGeo" -ln "visGeo" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "visGeoType" -ln "visGeoType" -min 0 -max 3 -en "cylinders:boxes:spheres:bones" 
		-at "enum";
	addAttr -ci true -sn "visCylinders" -ln "visCylinders" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "visBoxes" -ln "visBoxes" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "visSpheres" -ln "visSpheres" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "visBones" -ln "visBones" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "lockCenterJoints" -ln "lockCenterJoints" -dv 1 -min 
		0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "visGap" -ln "visGap" -dv 0.75 -min 0 -max 1 -at "double";
	addAttr -ci true -k true -sn "visPoleVector" -ln "visPoleVector" -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "visJointOrient" -ln "visJointOrient" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "visJointAxis" -ln "visJointAxis" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "preRebuildScript" -ln "preRebuildScript" -dt "string";
	addAttr -ci true -sn "postRebuildScript" -ln "postRebuildScript" -dt "string";
createNode nurbsCurve -n "FitSkeletonShape" -p "FitSkeleton";
	rename -uid "D720B044-48C8-EDBF-1292-A38316E16B0A";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.4528509759057693 1.5019380482142313e-16 -2.4528509759057697
		2.1240611576287402e-16 2.1240611576287402e-16 -3.4688551166060195
		-2.4528509759057693 1.5019380482142308e-16 -2.4528509759057688
		-3.4688551166060213 1.1011170549256675e-32 -1.7982606179876648e-16
		-2.4528509759057693 -1.501938048214231e-16 2.4528509759057693
		-3.4747758948907039e-16 -2.1240611576287417e-16 3.4688551166060217
		2.4528509759057693 -1.5019380482142308e-16 2.4528509759057688
		3.4688551166060213 -2.8965747010693275e-32 4.7304654747573513e-16
		2.4528509759057693 1.5019380482142313e-16 -2.4528509759057697
		2.1240611576287402e-16 2.1240611576287402e-16 -3.4688551166060195
		-2.4528509759057693 1.5019380482142308e-16 -2.4528509759057688
		;
createNode joint -n "Root" -p "FitSkeleton";
	rename -uid "A5248300-494B-CB67-2BDE-4AB053A92801";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.1966955475770101e-16 5.9675512125923422 -1.0978404440931309 ;
	setAttr -l on ".tx";
	setAttr ".r" -type "double3" -2.8249000307521022e-30 2.5444437451708134e-14 -1.2722218725854067e-14 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90 12.889414339875415 89.999999999999986 ;
	setAttr ".dl" yes;
	setAttr ".typ" 1;
	setAttr ".otp" -type "string" "Mid";
	setAttr -k on ".fat" 1.0321846196405366;
	setAttr -k on ".fatY" 0.64999999999999991;
	setAttr -k on ".fatZ";
createNode joint -n "Hip" -p "Root";
	rename -uid "ED138147-4FDD-BDC3-2D50-3987E2A2980D";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" -0.11658256674063594 -0.060018332251797979 -0.98298795859668808 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 154.14025229206547 -4.6284404421763243 172.60496475802159 ;
	setAttr ".dl" yes;
	setAttr ".typ" 2;
	setAttr -k on ".fat" 0.52823565828662755;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Knee" -p "Hip";
	rename -uid "DA276028-4BA6-AE9F-CD7C-3CB4B21BA855";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.9808383553685247 -1.1324274851176597e-14 -1.1102230246251565e-15 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.9083328088781107e-14 4.7708320221952752e-15 -42.554060424352521 ;
	setAttr -k on ".fat" 0.3643004539907776;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Ankle" -p "Knee";
	rename -uid "A055B63C-43A4-D8A7-4A61-39B55E1D0501";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "worldOrient" -ln "worldOrient" -min 0 -max 5 -en "xUp:yUp:zUp:xDown:yDown:zDown" 
		-at "enum";
	setAttr ".t" -type "double3" 2.3187445534768139 -8.8817841970012523e-16 1.9984014443252818e-15 ;
	setAttr ".ro" 3;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 23.105740725071552 4.7668720284767492 22.300413815530913 ;
	setAttr ".pa" -type "double3" 3.1147589914174403 -1.2104724556304993 -11.405913270501992 ;
	setAttr ".dl" yes;
	setAttr ".typ" 4;
	setAttr -k on ".fat" 0.22465194662764612;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
	setAttr -k on ".worldOrient" 3;
createNode joint -n "Heel" -p "Ankle";
	rename -uid "D29B79F6-4621-2488-6C36-858B7E2D57C4";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.36999999999999988 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.90726338643503379 -0.47821939584561257 0.13117405654552083 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Heel";
	setAttr -k on ".fat" 0.22465194662764612;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Toes" -p "Ankle";
	rename -uid "5F2A384A-4609-8027-55C9-AFA22AAD6BDE";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.47276715453487866 1.0215024870005029 -5.773159728050814e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.1720470080454897 -0.96191921653339107 72.627856041152214 ;
	setAttr ".pa" -type "double3" -0.00019030234564052423 0.00053514845282692043 25.864574245063647 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Toes";
	setAttr -k on ".fat" 0.18215022699538877;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "FootSideInner" -p "Toes";
	rename -uid "A8C23656-406B-87E4-D406-56BDD21048F8";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.29999999999999993 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.20239261244492773 -0.31339394501750445 -0.69301418427710293 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "BigToe";
	setAttr -k on ".fat" 0.18215022699538877;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "FootSideOuter" -p "Toes";
	rename -uid "DF1AC986-492C-ACC7-6B1A-B3BF66CF47CC";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.29999999999999993 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.31281802645075013 -0.47369698695279416 0.66675445294630609 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "PinkyToe";
	setAttr -k on ".fat" 0.18215022699538877;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "ToesEnd" -p "Toes";
	rename -uid "FD693F0B-416C-B42D-24EE-CDAF7800BC1A";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.29999999999999993 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.1804760267812506 -1.9984014443252818e-15 5.5511151231257827e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "ToesEnd";
	setAttr -k on ".fat" 0.18215022699538877;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Spine1" -p "Root";
	rename -uid "8A5C1332-4C96-C09F-3E87-8A97954B97B4";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1.477376426915626 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.1774045757778895 -4.4408920985006262e-16 -3.5858125223393277e-16 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 1.6187905020339993e-15 1.1660870042626811e-14 4.7708320221952742e-14 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.589524409355784e-17 -3.0637015603188956e-15 15.806855637765858 ;
	setAttr -k on ".fat" 1.0321846196405366;
	setAttr -k on ".fatY" 0.65;
	setAttr -k on ".fatZ";
createNode joint -n "Chest" -p "Spine1";
	rename -uid "4A9C5F61-4A39-6D4D-5602-E18D9B703D8F";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.9648641757382697 1.9984014443252818e-15 -3.9989028859386611e-16 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -5.1640060091999586e-15 -5.3958910253161941e-14 1.6061801141390758e-13 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 7.8844455169687607e-15 -5.2838783090534313e-15 10.93340741507228 ;
	setAttr ".dl" yes;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Chest";
	setAttr -k on ".fat" 1.0321846196405366;
	setAttr -k on ".fatY" 0.64999999999999991;
	setAttr -k on ".fatZ";
createNode joint -n "Scapula" -p "Chest";
	rename -uid "D64DEED8-4020-A7BB-E7AF-228CECDF435F";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.65 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.0966701987153655 0.247607314771634 -0.43257786346440963 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -8.4266898941176791 81.334312320563058 -13.9053676529079 ;
	setAttr ".otp" -type "string" "PropA1";
	setAttr -k on ".fat" 0.39465882515667577;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Shoulder" -p "Scapula";
	rename -uid "4218C666-43D1-FAB2-78AA-5982FA3C948B";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.4531475004223933 -2.042810365310288e-14 -6.5725203057809267e-14 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.0034026895945159e-14 71.487274973485725 3.8958403940797921 ;
	setAttr ".pa" -type "double3" -4.1293130717023516e-07 0 0 ;
	setAttr ".dl" yes;
	setAttr ".typ" 10;
	setAttr -k on ".fat" 0.39465882515667577;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Elbow" -p "Shoulder";
	rename -uid "6FC5CB9B-4448-0885-193F-F8948B6A773C";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.8227105556890892 0 -6.4837024638109142e-14 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 6.3611093629270335e-15 4.7708320221952752e-15 26.72828681149732 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "22";
	setAttr -k on ".fat" 0.27322534049308311;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Wrist" -p "Elbow";
	rename -uid "C53A9698-4FB2-18C9-F672-6CA0DA08F56A";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.2632632843523988 3.7747582837255322e-15 9.7699626167013776e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 78.735660637487257 -6.301550992939247 -13.977010173551768 ;
	setAttr ".dl" yes;
	setAttr ".typ" 12;
	setAttr -k on ".fat" 0.10321846196405358;
	setAttr -k on ".fatY" 2.3100000000000005;
	setAttr -k on ".fatZ";
createNode joint -n "MiddleFinger1" -p "Wrist";
	rename -uid "03A83CA4-47EE-E17C-C090-97BE79641EF2";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.720894952597527 2.6645352591003757e-15 -1.7763568394002505e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -68.205546588246449 12.823420228265299 -37.448548511712097 ;
	setAttr ".pa" -type "double3" -2.490303168013669e-17 3.8068719241856406 -4.0949047407001542 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "21";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "MiddleFinger2" -p "MiddleFinger1";
	rename -uid "59F1438B-4742-F1DD-0B92-DAA338449A7A";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.7672632769971921 1.5543122344752192e-15 1.0658141036401503e-14 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.169406169773195 18.837791497053182 -1.4230378483163888 ;
	setAttr ".pa" -type "double3" 0 0 2.5199999009299203 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "20";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "MiddleFinger3" -p "MiddleFinger2";
	rename -uid "13779631-4C82-0612-FFE5-D1AA3312B0B5";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.48666574058114964 2.2204460492503131e-16 -4.4408920985006262e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.8874020028163585 -23.244945971659146 1.6174022673466419 ;
	setAttr ".pa" -type "double3" 0 0 3.6712939054552742 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "19";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "MiddleFinger4" -p "MiddleFinger3";
	rename -uid "68D2C6E3-47A5-9734-B4F3-8D936E71D141";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.11999999999999991 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.45607977684574763 -1.1102230246251565e-15 2.6645352591003757e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "18";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "ThumbFinger1" -p "Wrist";
	rename -uid "F0122C56-4AAC-F054-7845-2BB444E34EA6";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.43168574948945881 -0.031162663366083976 -0.90313666499028666 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -160.02701567981839 28.463809373589296 -19.653925255154768 ;
	setAttr ".pa" -type "double3" -34.462082586865911 -8.7285733235282201 -1.7903981777634761 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "4";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "ThumbFinger2" -p "ThumbFinger1";
	rename -uid "080ABD60-4B9A-5B91-790B-50AA1E612E28";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.59459810412844405 -4.4408920985006262e-15 4.4408920985006262e-16 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -4.4403879116345824 16.68457123418624 -5.0040359075836953 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "3";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "ThumbFinger3" -p "ThumbFinger2";
	rename -uid "CF1D9D99-4492-A323-FA72-05815455EFC2";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.5968670029459906 8.8817841970012523e-16 -2.4424906541753444e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.7529760575632511 -9.5889878271758331 4.1344818859921517 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "2";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "ThumbFinger4" -p "ThumbFinger3";
	rename -uid "0DE35650-4B44-AB99-BE7A-50BB7CD5DC8E";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.11999999999999991 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.63143857145085924 8.8817841970012523e-16 0 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "1";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "IndexFinger1" -p "Wrist";
	rename -uid "4B0AAFA2-4CEB-919F-D544-25B150D230DB";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.6709138514073796 0.16466745855191967 -0.45633322010078836 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -73.110818249801 13.394380208783359 -34.089129783866674 ;
	setAttr ".pa" -type "double3" 0.065532877363568762 20.527688987272207 -2.5422327562497964 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "8";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "IndexFinger2" -p "IndexFinger1";
	rename -uid "2B8F6DCC-46F7-BB7D-3A43-4F9987D29BC8";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.76223815808451967 -1.5543122344752192e-15 5.3290705182007514e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.32729727950165211 21.308877060685042 0.57467763213356171 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "7";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "IndexFinger3" -p "IndexFinger2";
	rename -uid "D59BDCA7-441E-43F0-FFAE-DCB323041C3A";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.46686693562944104 -4.4408920985006262e-16 -1.3322676295501878e-14 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.2772232453457568 -16.545592915624088 -1.4595045203597332 ;
	setAttr ".pa" -type "double3" 0 0 5.7600000490223469 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "6";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "IndexFinger4" -p "IndexFinger3";
	rename -uid "53E3036A-4A80-AA03-09D6-C59E760E35A0";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.11999999999999991 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.51329415896389463 6.6613381477509392e-16 5.3290705182007514e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "5";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Cup" -p "Wrist";
	rename -uid "6201025C-4E8F-A665-75FB-95B1495567C4";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.13210822329802374 -0.028221535485833726 0.027998705335774199 ;
	setAttr ".r" -type "double3" 5.7920882519464502e-14 -7.6588393461779873e-14 2.2945652059874697e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.25779963809257844 -5.3924663167539997 -2.7411338893670383 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "17";
	setAttr -k on ".fat" 0.072860090798155516;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "PinkyFinger1" -p "Cup";
	rename -uid "5750AEFE-4D0D-B9EC-5A46-018D49C48E2E";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.508054724213804 -0.42269529482455237 0.54155011918382989 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -67.3007938629801 17.68514469823123 -37.0063029445257 ;
	setAttr ".pa" -type "double3" -0.21586850671656455 -15.856897343794616 -7.9762775885025459 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "12";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "PinkyFinger2" -p "PinkyFinger1";
	rename -uid "2FC052AD-493E-7361-30C1-FA869501B76F";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.65784886961023226 2.9976021664879227e-15 3.5527136788005009e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 11.639746799405694 9.2436429881543702 -0.25887400823151713 ;
	setAttr ".pa" -type "double3" 0 0 0.71999997359174039 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "11";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "PinkyFinger3" -p "PinkyFinger2";
	rename -uid "66CD8A6C-409D-2909-2AFA-CCBC36F9A907";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.44796180887375225 8.8817841970012523e-16 -1.7763568394002505e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.69836780139990062 -18.979672484931136 -0.77286282518958183 ;
	setAttr ".pa" -type "double3" 0 0 5.7599997887354624 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "10";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "PinkyFinger4" -p "PinkyFinger3";
	rename -uid "07242065-4C3E-6C32-22B7-8ABF01289719";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.11999999999999991 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.40375862413285013 -8.8817841970012523e-16 3.5527136788005009e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "9";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "RingFinger1" -p "Cup";
	rename -uid "5C561D82-4B96-8B85-0AD7-1B8921D45489";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.6131729907838279 -0.10337373991541998 0.17735409290701654 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -72.506200096781654 16.108566764785447 -41.69666476392652 ;
	setAttr ".pa" -type "double3" -0.07133019936876682 -2.835223641928581 -1.4417652325251511 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "16";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "RingFinger2" -p "RingFinger1";
	rename -uid "D6D8C8FA-44BA-83A2-B363-829F47BB90EE";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.74882539350164379 2.3314683517128287e-15 2.2204460492503131e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.8300653178343742 11.998554736519017 1.7214832450552391 ;
	setAttr ".pa" -type "double3" 0 0 -2.1600000310934706 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "15";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "RingFinger3" -p "RingFinger2";
	rename -uid "7CF36C61-4B1F-1DE1-E2CE-9085FA5C7ED0";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.44265602915626445 -4.4408920985006262e-16 -2.6645352591003757e-15 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.67242269118371922 -24.776389091072335 3.8198445181961893 ;
	setAttr ".pa" -type "double3" 0 0 4.3200001190538568 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "14";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "RingFinger4" -p "RingFinger3";
	rename -uid "9ED6BD26-41F7-DCE6-8FCE-87BE87EE8C70";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.11999999999999991 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.46637144621084037 -2.2204460492503131e-16 8.8817841970012523e-16 ;
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "13";
	setAttr -k on ".fat" 0.072860090798155475;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Neck" -p "Chest";
	rename -uid "1B923BBC-43BE-CAF0-982C-36A3B5C9B81F";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.936464369148716 9.7699626167013776e-15 2.7654465774451184e-15 ;
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.6682346948262344e-14 -1.2747352389367254e-14 8.3754293736657868 ;
	setAttr ".pa" -type "double3" -1.7940447748746266e-16 6.8425179703803005e-15 0 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "37";
	setAttr -k on ".fat" 0.6071674233179627;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Head" -p "Neck";
	rename -uid "63B1B5AF-4265-502D-AA82-5B836B466F56";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "global" -ln "global" -min 0 -max 10 -at "long";
	setAttr ".t" -type "double3" 1.54876726772609 6.2172489379008766e-15 -3.6696966787584852e-16 ;
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".ro" 5;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.3305254618997875e-14 -1.5171246993115446e-14 -22.226278086628511 ;
	setAttr ".otp" -type "string" "36";
	setAttr -k on ".fat" 0.21250859816128692;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Eye" -p "Head";
	rename -uid "5DF074CA-465D-B4B2-845A-9596089CAD65";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "noFlip" -ln "noFlip" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "noMirror" -ln "noMirror" -dv 1 -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.3295376941752064 2.6410321940932877 -1.2171189101962749 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.5135860840929552e-14 7.0209404831219683e-15 90.290363105833421 ;
	setAttr ".pa" -type "double3" 8.9959671327899885e-14 -89.999999999998849 0 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Eye";
	setAttr -k on ".fat" 0.12143348466359251;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "EyeEnd" -p "Eye";
	rename -uid "6A885150-4C66-3FF1-B2BE-9C879276A505";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.19999999999999996 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.1699949787837283 -1.0658141036401503e-14 -6.6613381477509392e-16 ;
	setAttr ".r" -type "double3" 15.943578395557601 -0.25535337936060021 0.054080155178905319 ;
	setAttr ".ro" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "24";
	setAttr -k on ".fat" 0.12143348466359251;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Jaw" -p "Head";
	rename -uid "68EF3AB9-444A-26F1-9717-008D6850A2FD";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" -0.10292103011343912 0.93088015795937396 -3.9692005319380843e-16 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 3.0175001904515055e-15 1.6915836004624824e-15 3.3077768687220577e-13 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -9.3191962591990896e-15 1.3839814657214718e-14 121.4508002142792 ;
	setAttr ".otp" -type "string" "31";
	setAttr ".radi" 0.5;
	setAttr -k on ".fat" 0.12143348466359251;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "JawEnd" -p "Jaw";
	rename -uid "75702407-4672-B415-95F3-12997AF87EEA";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.19999999999999996 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.5149466709737518 1.5987211554602254e-14 -7.425053958268505e-17 ;
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "25";
	setAttr -k on ".fat" 0.12143348466359251;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint1" -p "Jaw";
	rename -uid "E589E4C0-4488-9466-A699-AE87456251BF";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.35819940672672912 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.91985409431795873 -0.083262924862768983 -1.9855920579647117e-15 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" -2.7291942199301682e-15 1.9083328088780466e-14 -2.8020686743693588e-12 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.2331028832702996e-14 4.8187499499653135e-16 -16.277884868753844 ;
	setAttr ".radi" 0.5;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint2" -p "joint1";
	rename -uid "49C9F121-4381-2C87-356B-7CAD57A72FED";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.25788621237332432 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.35819940672673889 -1.9539925233402755e-14 -1.1930436862652432e-16 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 9.8189424926306319e-16 1.8292754241935533e-14 -6.654515532292043e-12 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.664838120349898e-14 1.0394536361688898e-14 6.1449969299365153 ;
	setAttr ".radi" 0.5;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint3" -p "joint2";
	rename -uid "13935DE1-433F-89C0-22D3-85BD9A319EB8";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.21854668483352313 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.25788621237331988 -3.1974423109204508e-14 -8.2335019183249097e-17 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 4.6030281064722132e-16 1.7836833226004022e-14 3.1058116464491247e-12 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.4708935894637396e-14 -4.8289010465853728e-15 2.9565288589767404 ;
	setAttr ".radi" 0.5;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint4" -p "joint3";
	rename -uid "DFF876A3-43FF-2D0E-EDA9-67B559FC3F21";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.20708304029818247 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.21854668483352713 1.5987211554602254e-14 -6.8036089265208539e-17 ;
	setAttr -l on ".tz";
	setAttr ".r" -type "double3" 1.2980003065873709e-16 1.7698514747843353e-14 -7.8828059933397329e-13 ;
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.2114376853475448e-15 -4.5523404025743285e-15 0.84039375170603958 ;
	setAttr ".radi" 0.5;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint5" -p "joint4";
	rename -uid "F1330973-4F20-0DF2-E727-048F2ADECDA4";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 0.20708304029818292 0 -6.3967403426461328e-17 ;
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "HeadEnd" -p "Head";
	rename -uid "4CCED497-4F54-E08E-21E2-62A6EDCD8E50";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 4.3124456774584061 1.7555401576885288e-15 9.3044062568773374e-17 ;
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "23";
	setAttr -k on ".fat" 0.21250859816128692;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "Eye1" -p "Head";
	rename -uid "56C3A06A-4B54-1D39-DE5D-02945C97C1E4";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	addAttr -ci true -k true -sn "noFlip" -ln "noFlip" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "noMirror" -ln "noMirror" -dv 1 -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.32326063646601 2.7067047405095543 1.296501724340841 ;
	setAttr ".ro" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.5136036456062132e-14 7.0205618766793676e-15 90.288929925016021 ;
	setAttr ".pa" -type "double3" 8.9959671327899885e-14 -89.999999999998849 0 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "Eye";
	setAttr -k on ".fat" 0.12143348466359251;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "EyeEnd1" -p "Eye1";
	rename -uid "52B15B38-47F4-7C64-B87B-56BFC05D67AC";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.19999999999999996 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.1699948762281021 -7.1054273576010019e-15 2.2204460492503131e-16 ;
	setAttr ".r" -type "double3" 15.943578395557601 -0.25535337936060021 0.054080155178905319 ;
	setAttr ".ro" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".typ" 18;
	setAttr ".otp" -type "string" "24";
	setAttr -k on ".fat" 0.12143348466359251;
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint6" -p "Head";
	rename -uid "8D6FD295-4627-9D22-657A-C2B9C7C71737";
	addAttr -ci true -k true -sn "noMirror" -ln "noMirror" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.21250859816128692 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.8747113072173995 2.6645728407682254 -2.3679956229374821 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" -3;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint7" -p "Head";
	rename -uid "DA1CAF7D-41AA-A2A2-16B2-83998A7376BE";
	addAttr -ci true -k true -sn "noMirror" -ln "noMirror" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.21250859816128692 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.4202217218040865 3.2430862475812736 -1.5990053843983949 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" -3;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint8" -p "Head";
	rename -uid "5417A4EC-4DBA-28EE-111D-39A97D444479";
	addAttr -ci true -k true -sn "noMirror" -ln "noMirror" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.21250859816128692 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.0471210888385993 3.4626358214713231 -0.69721057842447942 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" -3;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint9" -p "Head";
	rename -uid "24A156C7-490A-2F80-EC76-AEB0BFA6F022";
	addAttr -ci true -k true -sn "noMirror" -ln "noMirror" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.21250859816128692 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.0471210888385993 3.4626358214713231 0.65790108138969228 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" -3;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint10" -p "Head";
	rename -uid "C1EB004F-4D0F-2BA7-9D66-ABBA5825F2C4";
	addAttr -ci true -k true -sn "noMirror" -ln "noMirror" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.21250859816128692 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 2.4180115926532704 3.21999256806677 1.7528764019062346 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" -3;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode joint -n "joint11" -p "Head";
	rename -uid "D5308BB5-4CEC-2A62-FCDC-0E97045D2A40";
	addAttr -ci true -k true -sn "noMirror" -ln "noMirror" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -k true -sn "fat" -ln "fat" -dv 0.21250859816128692 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatY" -ln "fatY" -dv 1 -min 0 -at "double";
	addAttr -ci true -k true -sn "fatZ" -ln "fatZ" -dv 1 -min 0 -at "double";
	addAttr -ci true -sn "fatYabs" -ln "fatYabs" -at "double";
	addAttr -ci true -sn "fatZabs" -ln "fatZabs" -at "double";
	setAttr ".t" -type "double3" 1.874711307217396 2.6645728407682236 2.4181959557526604 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" -3;
	setAttr -k on ".fat";
	setAttr -k on ".fatY";
	setAttr -k on ".fatZ";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "64D1E8D0-480B-C2D6-DD45-E9865AA3C137";
	setAttr -s 25 ".lnk";
	setAttr -s 25 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "ADA2C5FF-4A02-2D00-4F6F-329299625F74";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "56F067BC-4078-E60F-7610-D8BF986E3291";
createNode displayLayerManager -n "layerManager";
	rename -uid "C2691FAE-483D-9F2B-4A9D-668C60388796";
createNode displayLayer -n "defaultLayer";
	rename -uid "8B581F80-4430-8B05-490C-F4932F879293";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "02AFF0D2-453C-50AC-C30C-5B8A937C1FB7";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "04A366BA-483D-AD54-8BBA-EBBC3208A47D";
	setAttr ".g" yes;
createNode renderLayerManager -n "AdvancedSkeleton_renderLayerManager";
	rename -uid "5D03CD1C-4637-16B1-E268-F8B44BBB039D";
createNode renderLayer -n "AdvancedSkeleton_defaultRenderLayer1";
	rename -uid "FB4F4657-42BF-4215-A941-3FB96D21685F";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "9F2EE772-48DE-4777-0694-739E0FDC86C0";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 653\n            -height 327\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 653\n            -height 327\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 653\n            -height 327\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1313\n            -height 702\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n"
		+ "                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                -selectionOrder \"display\" \n                -expandAttribute 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n"
		+ "                -showCurveNames 0\n                -showActiveCurveNames 0\n                -clipTime \"on\" \n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 0\n                -outliner \"graphEditor1OutlineEd\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n"
		+ "                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n"
		+ "                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n"
		+ "                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n"
		+ "                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n"
		+ "                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n"
		+ "                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n"
		+ "            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n"
		+ "            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1313\\n    -height 702\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1313\\n    -height 702\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 50 -size 100 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels yes -displayOrthographicLabels yes -displayAxesBold yes -perspectiveLabelPosition edge -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "837CED9C-4610-1F25-55E7-9788580D703B";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode shadingEngine -n "blinn1SG";
	rename -uid "FAC65716-4D12-CBFD-591F-9794263D36C2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "72A305C7-48E9-AAC1-D1F6-6594074D6B9A";
createNode file -n "file1";
	rename -uid "6E9A05FB-4D82-62F9-3C3E-DF9D478ACDD7";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/zombie-AVATAR/js_ao.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture1";
	rename -uid "070414F9-4AA9-91AF-8E43-3E8A3221FBAC";
createNode file -n "file2";
	rename -uid "51A13726-49C9-2C0D-83B4-9ABD1995A9B2";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/pvz/zombie/zombie-AVATAR/js_normals.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture2";
	rename -uid "65EF7BDC-4AD4-6C01-1D6E-969F5CED5961";
createNode bump2d -n "bump2d1";
	rename -uid "FCC8E937-4925-9E3F-F8FB-F4B4C63FB3D9";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode shadingEngine -n "blinn2SG";
	rename -uid "99093081-42B8-98C0-E106-708A15742C23";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "684D6C65-48B7-464E-3B31-3EAC011AFE82";
createNode shadingEngine -n "blinn3SG";
	rename -uid "62D17C3F-4CC7-C472-3743-1299557BC826";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
	rename -uid "6E06BB07-4C0C-261B-23A4-FDAE441E70F3";
createNode shadingEngine -n "blinn4SG";
	rename -uid "61BA1D55-42F1-F78D-5299-8C81078478C6";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
	rename -uid "BE2D3CA8-4F10-A43E-1885-7CA507E11261";
createNode file -n "file3";
	rename -uid "B8CE4DEC-4615-00E3-3C2B-2CB3C6ECED7E";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/zombie-AVATAR/glq_ao.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture3";
	rename -uid "EDFE7633-4441-34BB-A780-DE975AB693F2";
createNode file -n "file4";
	rename -uid "CC52CF0C-475F-1B96-FB28-7DA7D775C91A";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/pvz/zombie/zombie-AVATAR/glq_normals.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture4";
	rename -uid "AE3F8E0F-4D4F-0502-152B-46BEAE903050";
createNode bump2d -n "bump2d2";
	rename -uid "99383570-45CB-2D25-7F88-66A8B465F764";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "file5";
	rename -uid "482C8653-4858-E816-1149-3392A7B485B7";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/zombie-AVATAR/qsy_ao.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture5";
	rename -uid "514960AC-4A3F-8FF7-9A4D-6DAC71830C07";
createNode file -n "file6";
	rename -uid "B7A704B3-4C31-C781-582B-0CB0928AFF14";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/pvz/zombie/zombie-AVATAR/qsy_normals.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture6";
	rename -uid "F51CDF9C-42E4-AEB6-FF47-5CBC6F4F2453";
createNode bump2d -n "bump2d3";
	rename -uid "DE84478E-41AB-AEAC-0134-1FA0AF1F902F";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "file7";
	rename -uid "7B15E180-41E8-FB64-6734-BAAB15FC3990";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/zombie-AVATAR/qf_AO.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture7";
	rename -uid "498B3196-4A84-B9DB-A6A8-FDABAF2F14E7";
createNode shadingEngine -n "lambert3SG";
	rename -uid "55FC7B80-4E28-AC4F-B13C-0E91FCE7DAAC";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
	rename -uid "1D6E574A-4AAF-DDC0-D801-F09E671A7C88";
createNode file -n "file8";
	rename -uid "B59883A2-4B34-3CD3-3759-258208FFC8F6";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/normal zombie body style2.jpg";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture8";
	rename -uid "E07B0A20-41E6-117E-6A3D-87AC90A025A2";
createNode groupId -n "groupId4301";
	rename -uid "7F1B8A6A-417F-C800-9D8E-CCB9C4974B04";
	setAttr ".ihi" 0;
createNode file -n "file9";
	rename -uid "592C7FBC-4739-9A8B-5439-AC8E83EAD2BC";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/uv.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture9";
	rename -uid "93217A65-4B37-1B3F-16D6-6C8126E7F036";
createNode groupId -n "groupId4310";
	rename -uid "38359CE0-43F4-5796-D378-1CB78A35A14B";
	setAttr ".ihi" 0;
createNode groupId -n "groupId4311";
	rename -uid "367978C1-4DCD-B76D-6D9F-8F87DF865826";
	setAttr ".ihi" 0;
createNode groupId -n "groupId4314";
	rename -uid "877C3F11-4FF2-C3EE-20A6-55A39C289D71";
	setAttr ".ihi" 0;
createNode groupId -n "groupId4315";
	rename -uid "80ED19C0-4468-CE9D-9EFE-CD891522FAB1";
	setAttr ".ihi" 0;
createNode groupId -n "groupId4316";
	rename -uid "C32CD8C5-4BF7-B2F5-85F6-568C48943F28";
	setAttr ".ihi" 0;
createNode groupId -n "groupId4317";
	rename -uid "160F733F-4978-859E-1A25-38AF9CFF775F";
	setAttr ".ihi" 0;
createNode groupId -n "groupId4318";
	rename -uid "E0A15F2C-4536-5217-DC36-9AB66D702867";
	setAttr ".ihi" 0;
createNode groupId -n "groupId4319";
	rename -uid "5BC09A38-49AF-10EA-41F0-148A45263B19";
	setAttr ".ihi" 0;
createNode groupId -n "groupId4320";
	rename -uid "EDF2A36D-455D-630C-ADE6-8486E75E3D9B";
	setAttr ".ihi" 0;
createNode Unfold3DOptimize -n "Unfold3DOptimize2";
	rename -uid "869965A5-431F-2DB3-45CD-82842F06887D";
	setAttr ".im" -type "mesh" 


		"v"	0

		"e"	0;
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 677 691 692 693 694
		 695 696 697 698 699 700 701 702 703 704 705 706
		 707 708 709 710 711 712 713 714 715 736 737 738
		 741 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 784 0.27472109 0.25054258 0.1983377 0.21315315
		 0.035264 0.064913459 0.064352557 0.030123999 0.181032 0.19816646 0.089897953 0.064015001
		 0.221743 0.220145 0.27686852 0.28395501 0.16510549 0.19661489 0.19471776 0.16004001
		 0.102219 0.096873 0.044032998 0.071243048 0.109051 0.152494 0.158712 0.107312 0.056217
		 0.080346867 0.081530996 0.055468999 0.233493 0.244692 0.25352001 0.20412301 0.18190943
		 0.18523356 0.092578605 0.076636001 0.17546199 0.096786827 0.076177351 0.147614 0.146962
		 0.196942 0.19316912 0.17145586 0.11433113 0.090308756 0.093973003 0.11252683 0.14374125
		 0.14158371 0.11278509 0.108408 0.14410301 -0.15243989 -0.14775795 -0.48015505 -0.56966865
		 -1.2572943 -1.2570308 0.20243201 0.219961 0.82986319 0.79724967 0.79810238 0.82973188
		 0.79525447 0.75122976 0.75729525 0.85912323 0.85786784 0.71899664 0.71972221 0.75231785
		 0.75440431 0.72731817 0.72602856 0.77875161 0.77986884 0.82244337 0.77730525 0.77294064
		 0.8175199 1.1577711 1.0943413 1.0943198 1.1404169 1.1769451 0.74599063 0.71757603
		 0.71806157 0.74298263 0.827371 0.79045439 0.78911334 0.82757854 0.6921525 0.6921525
		 0.19299901 0.18196 0.14158371 0.14410301 0.88860744 0.88860744 0.86271381 0.16077
		 0.156914 0.85535687 0.88860738 0.88860738 0.85652381 0.74999678 0.78511906 0.75159025
		 0.71749306 0.71474856 0.75703073 0.85604751 0.82850361 0.18544333 0.17410408 0.1746618
		 0.19431132 0.1596995 0.19796 0.17417701 0.15935899 0.1178135 0.12611049 0.155348
		 0.138519 0.1765715 0.172111 0.12573403 0.14443135 0.15046178 0.13476439 0.152594
		 0.157574 0.28393841 0.27671954 0.29099119 0.3031885 0.31383601 0.33708501 0.323046
		 0.298435 0.36879101 0.35066316 0.410072 0.435444 0.43353501 0.41078901 0.259516 0.26805401
		 0.25869301 0.24732199 0.28037801 0.27126801 0.296294 0.333404 0.327252 0.297061 0.66813099
		 0.67587 0.66276199 0.64011002 0.57973278 0.5902096 0.60237253 0.58799052 0.66643298
		 0.679245 0.67515898 0.66179299 0.649059 0.64734399 0.65497833 0.66708428 0.67634398
		 0.68335402 0.64956802 0.64327788 0.6377064 0.6559695 0.63660097 0.56764698 0.571307
		 0.55396199 0.55320799 0.63497299 0.60832298 0.60207599 0.57281101 0.56305599 0.5582
		 0.56588101 0.53506899 0.53860599 0.54238951 0.5721007 0.57384801 0.54223597 0.70840001
		 0.706644 0.696459 0.68788803 0.60929799 0.61229199 0.62120903 0.60358101 0.61883903
		 0.564547 0.57375002 0.58157504 0.59392601 0.554452 0.73798001 0.74768502 0.73584002
		 0.73209399 0.70739245 0.717134 0.70744401 0.69525999 0.684515 0.68342799 0.66923499
		 0.67165798 0.715424 0.70426899 0.69065702 0.67521697 0.64686197 0.64281398 0.66468102
		 0.595819 0.62409699 0.61770803 0.58355302 0.613069 0.55397099 0.589845 0.63940698
		 0.53885102 0.52546602 0.531066 0.56111002 0.55374086 0.62637001 0.68120384 0.57713997
		 0.69113499 0.60992497 0.55615401 0.585186 0.56412703 0.72682399 0.71952498 0.73867202
		 0.70536 0.719585 0.50022799 0.49381599 0.50753099 0.61860901 0.63538897 0.65207303
		 0.66298902 0.65779901 0.675313 0.69182497 0.67579502 0.51929849 0.529176 0.54163402
		 0.498247 0.51671797 0.62067556 0.63207543 0.56151003 0.56968999 0.58747399 0.57707399
		 0.58915299 0.60338098 0.60096598 0.580634 0.58184069 0.59106249 0.60413402 0.61427701
		 0.61766601 0.604545 0.64033002 0.648027 0.63529801 0.62787801 0.5526529 0.55957776
		 0.66502202 0.67123902 0.66051698 0.65368098 0.68139499 0.690189 0.51284701 0.72704804
		 0.27699599 0.288941 0.30626801 0.30446774 0.32001975 0.3456195 0.37559855 0.38145301
		 0.38605988 0.41238099 0.43885699 0.26816699 0.32215208 0.34460098 0.33993769 0.31850398
		 0.30184853 0.29818642 0.35644621 0.36252686 0.391839 0.38064301 0.41325399 0.40775299
		 0.39368099 0.40020299 0.42750999 0.42183799 0.42768201 0.438014 0.46466535 0.45697039
		 0.50561899 0.47949401 0.48641601 0.51244599 0.391781 0.36721799 0.40274701 0.41840899
		 0.415656 0.43697801 0.413212 0.43375099 0.459079 0.46667501 0.353845 0.36658499 0.39248401
		 0.36937201 0.395679 0.37578601 0.48747501 0.458949 0.42177999 0.45891401 0.31143501
		 0.33427799 0.34911099 0.30744401 0.32459301 0.283997 0.44925901 0.29400599 0.439971
		 0.75954109 0.7552098 0.76623225 0.77042574 0.88352656 0.86719239 0.85649896 0.86976147
		 0.81459022 0.83192044 0.8414185 0.82248062 0.80419517 0.79852593 0.84448618 0.76697868
		 0.76630306 0.77954435 0.7789821 0.79570287 0.79253161 0.81305295 0.82295382 0.82748306
		 0.82253641 0.77908003 0.76511246 0.7586419 0.77572304 1.1168891 1.1225001 1.1363322
		 1.1293882 0.78199279 0.78473085 0.79034978 1.1634467 1.185503 1.1796901 1.1546947
		 0.8751356 0.88634652 0.8132593 0.81601828 0.76390582 0.77601105 1.1413903 1.1369926
		 1.1174492 0.8785373 0.88816035 0.88771713 0.8766638 0.8079704 0.80989087 0.87495506
		 0.88611591 0.85780776 0.84082133 0.83422673 0.83959889 0.8403517 0.84166628 0.8431704
		 0.84049261 0.85391283 0.88367665 0.87828946 0.8498776 0.83486789 0.81847674 0.82744128
		 0.82638001 0.85686302 0.81832021 0.82758075 0.82899219 0.81046695 0.85020578 0.81892508
		 0.79382527 0.79165137 0.8039645 0.81302798 1.1161811 1.2411842 1.2440928 1.2502502
		 1.0919383 1.0951952 1.1035023 1.0980682 1.2170953 1.2184615 0.339744 0.11539003 0.114513
		 0.097107999 0.38534221 0.080810614 0.054135501 0.1644415 0.1074385 0.19264415 0.26165101
		 0.211335 0.080208451 0.052946653 0.10755128 0.16954948 0.19551647 0.26890001 0.21776469
		 0.10890733 0.083516225 0.0866445 0.11164125 0.14052051 0.13646501 0.16744974 0.16113757
		 0.18939625 0.18326434 0.222201 0.57061797 0.54381257 0.580028 0.58505899 0.60037202
		 0.5898149 0.58248162 0.5933128 0.56207532 0.57281131 0.58059424 0.57082897 0.60400701
		 0.60033202 0.61159199 0.61361003 0.62712419 0.6114583 0.61298299 0.62419802 0.63813299
		 0.63972032 0.62767398 0.62742198 0.61346889 0.60649198 0.63977802 0.62729698 0.61427701
		 0.60413402 0.64033002 0.62787801 0.58522999 0.57500601 0.57154274 0.57510102 0.56481951
		 0.56654602 0.55397999 0.55666798 0.56895649 0.59896803 0.56167287 0.62173909 0.60037202
		 0.58974677 0.58248162 0.5933128 0.56207532 0.57281131 0.58051878 0.57082897 0.60400701
		 0.60033202 0.61159199 0.61361003 0.62712419 0.6114583 0.61298299 0.62419802 0.63813299
		 0.63972032 0.62767398 0.62742198 0.61346889 0.60649198 0.63977802 0.62729698 0.61427701
		 0.60413402 0.64033002 0.62787801 0.58522999 0.57500601 0.57154274 0.57510102 0.56481951
		 0.56654602 0.55397999 0.55666798 0.56895649 0.59896803 0.56167287 0.62173909 0.60037202
		 0.58983624 0.58248162 0.5933128 0.56207532 0.57281131 0.58061659 0.57082897 0.60400701
		 0.60033202 0.61159199 0.61361003 0.62712419 0.6114583 0.61298299 0.62419802 0.63813299
		 0.63972032 0.62767398 0.62742198 0.61346889 0.60649198 0.63977802 0.62729698 0.61427701
		 0.60413402 0.64033002 0.62787801 0.58522999 0.57500601 0.57154274 0.57510102 0.56481951
		 0.56654602 0.55397999 0.55666798 0.56895649 0.59896803 0.56167287 0.62173909 0.60037202
		 0.58976978 0.58248162 0.5933128 0.56207532 0.57281131 0.58054698 0.57082897 0.60400701
		 0.60033202 0.61159199 0.61361003 0.62712419 0.6114583 0.61298299 0.62419802 0.63813299
		 0.63972032 0.62767398 0.62742198 0.61346889 0.60649198 0.63977802 0.62729698 0.61427701
		 0.60413402 0.64033002 0.62787801 0.58522999 0.57500601 0.57154274 0.57510102 0.56481951
		 0.56654602 0.55397999 0.55666798 0.56895649 0.59896803 0.56167287 0.62173909 0.88860738
		 0.75509453 0.7555331 0.71750247 0.71972036 0.79791689 0.79403293 0.71868956 0.88860744
		 1.1479032 1.1684432 1.1889831 1.2089252 1.2307271 1.2466892 0.76815492 0.1401 0.1401
		 0.116041 0.116422 0.6921525 1.6355324 2.6097937 2.6346517 3.6121001 0.71819293 0.6921525
		 0.6921525 0.83767158 0.76875949 0.75750083 0.7577107 0.75419289 0.74978328 0.74541873
		 0.89771074 0.89286453 0.87944543 0.85834837 0.83508074 0.81589228 0.75478393 0.75611836
		 0.7519384 0.77154785 0.79051161 0.80058712 0.80823523 0.82750183 0.85801572 0.88959581
		 0.89890951 0.89844769 0.8970319 1.1296991 1.1107363 1.0967642 0.32672304 0.35444766
		 0.82633686 0.85442162 0.8886075 0.6921525 0.6921525 0.6921525 0.8886075 0.85607922
		 0.82958049 0.78120112 0.75545788 0.72891814 0.6921525 0.85249877 0.8886075 0.81044221
		 0.81654924 0.80465984 0.6921525 0.8559339 0.79094154 1.2159886 1.2139239 0.88860738
		 0.64298701 0.64719701 0.61087298 0.60258299 0.57351798 0.56759602 0.54477602 0.66723961
		 0.65533096 0.63127387 0.62064898 0.59044403 0.58126199 0.55868953 0.55194902 0.60258299
		 0.60037202 0.57082897 0.57351798 0.60258299 0.63207543 0.63186598 0.60037202 0.57082897
		 0.57351798 0.60037202 0.57082897 0.60258299 0.55957776 0.55877203 0.60037202 0.57082897
		 0.57351798 0.6172601 0.61547172 0.61359 0.60293055 ;
	setAttr ".mve" -type "floatArray" 784 0.7421056 0.81144524 0.78246135 0.7301718
		 0.65376598 0.65949529 0.72816396 0.72844201 0.81890202 0.83270442 0.80721128 0.81787699
		 0.66868901 0.63180304 0.63091052 0.67413098 0.62601048 0.62932664 0.66326368 0.65630198
		 0.630804 0.66567099 0.62096453 0.62556589 0.49346301 0.50277197 0.52684802 0.520684
		 0.47670901 0.48436075 0.51486522 0.50898302 0.472579 0.466618 0.49893001 0.51722997
		 0.49564356 0.52123076 0.44108102 0.430215 0.87033802 0.82561755 0.8334403 0.822043
		 0.86486799 0.87647003 0.88961935 0.88238192 0.86939788 0.86667466 0.85621202 0.85806751
		 0.87593293 0.40179762 0.40918171 0.39751101 0.387254 1.0435125 1.1623927 1.1577322
		 1.0580548 1.1455929 1.0418699 0.43492699 0.422205 0.42994225 0.43131286 0.36953205
		 0.3682079 0.48164049 0.45745733 0.41207132 0.42029914 0.36261639 0.40418676 0.41750219
		 0.23222473 0.24359289 0.24456993 0.23728707 0.23574491 0.24188843 0.14018489 0.14584494
		 0.091103017 0.091103017 0.69826782 0.70378208 0.65964621 0.6546616 0.65772688 0.14566587
		 0.1439517 0.091103017 0.091103017 0.24025661 0.24039561 0.23189048 0.23425213 0.4043228
		 0.41659147 0.39592299 0.412034 0.40179762 0.387254 0.41207665 0.42419177 0.4401935
		 0.459739 0.42785099 0.23486404 0.23354563 0.23816767 0.24014547 0.19489598 0.19865206
		 0.22465175 0.23387316 0.1984279 0.3574768 0.24439508 0.24554631 0.77633375 0.76484638
		 0.7342965 0.73124647 0.6711815 0.68853652 0.70838398 0.68606102 0.726726 0.68522096
		 0.70477098 0.72555399 0.80101049 0.78311902 0.75734007 0.74733365 0.76831788 0.78415829
		 0.80533552 0.78862798 0.94051075 0.91525817 0.89833498 0.92103618 0.93876302 0.947272
		 0.98060101 0.967637 0.93783802 0.973997 0.914294 0.90360498 0.914868 0.93171102 0.846237
		 0.86045098 0.86490798 0.848625 0.87760299 0.88977802 0.65133297 0.64840001 0.70798397
		 0.70452601 0.62142301 0.62616599 0.650249 0.62313402 0.84620851 0.83661556 0.84452498
		 0.86594403 0.59880197 0.59410501 0.610663 0.58804798 0.59194499 0.58264798 0.55985582
		 0.56523746 0.58808303 0.56571501 0.8224355 0.81618011 0.81063938 0.80623305 0.58380699
		 0.61658698 0.63452399 0.63734901 0.61943501 0.65946001 0.66365302 0.63705897 0.85920501
		 0.87608302 0.87102503 0.85492897 0.86034501 0.849599 0.83207393 0.83727384 0.84108102
		 0.835576 0.84955102 0.89247602 0.89259398 0.85310799 0.58744103 0.58216798 0.58629102
		 0.594625 0.59173203 0.609478 0.60578299 0.60988152 0.59684402 0.61187899 0.61425298
		 0.62766403 0.63243997 0.623303 0.62726951 0.64310348 0.64773202 0.63382602 0.80188501
		 0.80975002 0.80862498 0.79869097 0.65598202 0.67288601 0.65913999 0.70824403 0.71773201
		 0.702205 0.68133402 0.950746 0.954005 0.97629797 0.97242999 0.914554 0.92952901 0.88961399
		 0.92973602 0.94401699 0.92300099 0.91582799 0.89526802 0.89700019 0.68988103 0.61407936
		 0.661973 0.61969203 0.69246 0.66453099 0.69976097 0.70579702 0.638475 0.620713 0.64376903
		 0.611929 0.60416597 0.91519499 0.90016198 0.899454 0.84677601 0.87781602 0.83374798
		 0.86496198 0.91026998 0.900379 0.82611001 0.82999301 0.90764099 0.89051104 0.89984602
		 0.88574702 0.88117599 0.56241852 0.56186533 0.81829798 0.81218499 0.832807 0.83304
		 0.79106998 0.80345899 0.81879401 0.80130601 0.57215631 0.56998622 0.77616102 0.77723002
		 0.80756003 0.79713601 0.770648 0.79106301 0.801588 0.77455097 0.59043962 0.58678418
		 0.770917 0.77516001 0.79406101 0.78942299 0.78027302 0.783696 0.91909802 0.64987552
		 0.84323901 0.85813302 0.88150299 0.90461415 0.91728485 0.92690682 0.92112565 0.906753
		 0.92798895 0.89560801 0.88867801 0.83289498 0.7605235 0.7681244 0.78621882 0.77857327
		 0.75551379 0.77351844 0.79598713 0.77539527 0.77706099 0.80783802 0.79404801 0.807827
		 0.805035 0.787054 0.79578698 0.813254 0.82228702 0.790214 0.80260992 0.82202202 0.70525199
		 0.700589 0.68669999 0.68986303 0.86192298 0.85960102 0.81766897 0.85857701 0.78244901
		 0.73824799 0.726358 0.67741501 0.69186401 0.67752701 0.71288002 0.651425 0.65846097
		 0.64071 0.64536703 0.71718103 0.75573301 0.74549901 0.65201801 0.67181897 0.628277
		 0.63234502 0.637555 0.81449401 0.83006901 0.80079401 0.85374099 0.63465601 0.66153699
		 0.83038884 0.81797141 0.81756741 0.82872164 0.92348593 0.9511897 0.94444799 0.92071611
		 0.95933908 0.94943577 0.95955038 0.97149271 0.97965145 0.96584159 0.93624693 0.93279177
		 0.90560442 0.905545 0.93234801 0.90374428 0.93175966 0.91198009 0.89857996 0.90443975
		 0.91671723 0.79708582 0.80444658 0.80104095 0.78996348 0.48063076 0.45155871 0.45216572
		 0.48646975 0.88341326 0.8591128 0.88293111 0.49459034 0.50034779 0.54057175 0.54346025
		 0.88352329 0.88120598 0.85334545 0.87664992 0.84059197 0.83763438 0.48883289 0.5104683
		 0.51298791 0.80829781 0.80560571 0.82378143 0.82430935 0.8133018 0.82794803 0.85295469
		 0.85153818 0.89809549 0.91014981 0.89217967 0.88387126 0.8497721 0.87168324 0.80939955
		 0.82665205 0.78046626 0.79186517 0.79698741 0.78874707 0.89666021 0.80029339 0.77796495
		 0.78650886 0.91750139 0.90862811 0.92302692 0.98305315 0.99085182 0.96837711 0.88992101
		 0.80469656 0.79064232 0.79472685 0.78650922 0.48627675 0.53388071 0.50894612 0.51061076
		 0.51061076 0.48287773 0.45374674 0.47344971 0.5445317 0.50622314 0.846497 0.81855631
		 0.797068 0.727898 0.95298076 0.55344605 0.54857302 0.56128347 0.55831051 0.55815005
		 0.54330999 0.55607349 0.58785605 0.5838685 0.59185547 0.59198356 0.59126389 0.58287585
		 0.59070349 0.89133781 0.88606954 0.87713724 0.88027871 0.88699794 0.90093076 0.89442575
		 0.91340256 0.90276873 0.92413986 0.85206503 0.83404303 0.82774097 0.59896803 0.59667403
		 0.56243497 0.56748044 0.55246162 0.54654801 0.55757409 0.55506665 0.56971711 0.57321203
		 0.77017099 0.74946153 0.74836397 0.77126801 0.72652012 0.72922021 0.71755397 0.71515602
		 0.72409499 0.74519897 0.74718899 0.70869398 0.70993531 0.71055597 0.76486599 0.768655
		 0.77723002 0.77616102 0.770648 0.77455097 0.52642602 0.53737003 0.52682149 0.51647198
		 0.52866149 0.53952301 0.53859198 0.52167898 0.51820773 0.72455102 0.52026516 0.70919955
		 0.56243497 0.56734091 0.55246162 0.54654801 0.55757409 0.55506665 0.56957483 0.57321203
		 0.77017099 0.74946153 0.74836397 0.77126801 0.72652012 0.72922021 0.71755397 0.71515602
		 0.72409499 0.74519897 0.74718899 0.70869398 0.70993531 0.71055597 0.76486599 0.768655
		 0.77723002 0.77616102 0.770648 0.77455097 0.52642602 0.53737003 0.52682149 0.51647198
		 0.52866149 0.53952301 0.53859198 0.52167898 0.51820773 0.72455102 0.52026516 0.70919955
		 0.56243497 0.56752419 0.55246162 0.54654801 0.55757409 0.55506665 0.56975901 0.57321203
		 0.77017099 0.74946153 0.74836397 0.77126801 0.72652012 0.72922021 0.71755397 0.71515602
		 0.72409499 0.74519897 0.74718899 0.70869398 0.70993531 0.71055597 0.76486599 0.768655
		 0.77723002 0.77616102 0.770648 0.77455097 0.52642602 0.53737003 0.52682149 0.51647198
		 0.52866149 0.53952301 0.53859198 0.52167898 0.51820773 0.72455102 0.52026516 0.70919955
		 0.56243497 0.567388 0.55246162 0.54654801 0.55757409 0.55506665 0.56962794 0.57321203
		 0.77017099 0.74946153 0.74836397 0.77126801 0.72652012 0.72922021 0.71755397 0.71515602
		 0.72409499 0.74519897 0.74718899 0.70869398 0.70993531 0.71055597 0.76486599 0.768655
		 0.77723002 0.77616102 0.770648 0.77455097 0.52642602 0.53737003 0.52682149 0.51647198
		 0.52866149 0.53952301 0.53859198 0.52167898 0.51820773 0.72455102 0.52026516 0.70919955
		 0.24453083 0.26127633 0.30374581 0.30508813 0.25554112 0.30555806 0.24833381 0.35525757
		 0.35428235 0.45679271 0.46652973 0.47626674 0.47953075 0.47829372 0.48669076 0.86133063
		 0.41036299 0.41036299 0.41786301 0.45733199 0.35476643 0.99823141 1.0571456 0.057145596
		 0.18562552 0.2442904 0.24413696 0.23935822 0.48583516 0.88410705 0.8847031 0.86328846
		 0.84355932 0.83289242 0.81882614 0.87807137 0.92548573 0.95498973 0.97802174 0.99286735
		 1.0021681 0.93161803 0.905065 0.79771358 0.78144491 0.77762914 0.7799449 0.77375716
		 0.76885384 0.77237386 0.7867316 0.80189723 0.82307255 0.84944737 0.54634875 0.54634422
		 0.5407297 0.89376563 0.90420258 0.19737951 0.19468991 0.19970195 0.19956969 0.30541375
		 0.25148645 0.29741296 0.3023321 0.30315885 0.24690939 0.25402105 0.25173843 0.14072236
		 0.13757923 0.14185452 0.93097073 0.93451279 0.94145149 0.091103017 0.091103017 0.94776922
		 0.66173077 0.69953823 0.091103017 0.56181902 0.57736897 0.56498897 0.56735098 0.57792199
		 0.58292001 0.59795398 0.56413323 0.55884033 0.56086993 0.56122798 0.56876898 0.57097399
		 0.58574766 0.58931297 0.56735098 0.56243497 0.57321203 0.57792199 0.56735098 0.56186533
		 0.56085002 0.56243497 0.57321203 0.57792199 0.56243497 0.57321203 0.56735098 0.58678418
		 0.58570403 0.56243497 0.57321203 0.57792199 0.81688285 0.82554036 0.83465004 0.82488322 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize3";
	rename -uid "C13331FF-41A5-E986-F313-58B256C69605";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize4";
	rename -uid "C9BC82A6-41BA-C4EE-2EF9-0CBFAD981A2B";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize5";
	rename -uid "369C5B0A-4017-92A8-3896-DC900EA701E0";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize6";
	rename -uid "CB669401-4D82-5766-5164-B1BBB8FACF15";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize7";
	rename -uid "993FBD97-4402-B578-589A-64BAA6E1EC14";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize8";
	rename -uid "1C46CF4A-4F50-E0AF-7600-3B9C9B2B0161";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize9";
	rename -uid "65E6BBC6-4B68-1DF1-2C06-63B91E0A6E0A";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize10";
	rename -uid "4E0888E5-40EB-0B44-82A4-538BA0BCD69F";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize11";
	rename -uid "08B53BA6-42CE-3820-D328-B5A5BA19EB17";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize12";
	rename -uid "19E56761-44D7-1956-9848-0FB402932B68";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize13";
	rename -uid "A31070AD-46AC-D06E-DC71-91835BC9C0AB";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize14";
	rename -uid "7778C782-4B25-A80F-A0E2-DCAEBF699AD6";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize15";
	rename -uid "8DA08969-4E1F-DF12-34D7-E99E48DD8B41";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize16";
	rename -uid "8198BE98-4C5C-0E00-BADD-65AFC15754ED";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize17";
	rename -uid "58D1C76E-49E8-4D7E-383C-77BD57C6B363";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize18";
	rename -uid "6C846E0A-4033-4EEB-467E-10AF1F0FEB16";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize19";
	rename -uid "96A103CE-4742-9CDF-E6A2-AA97A60C2222";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize20";
	rename -uid "9B0733BF-40CD-5F73-A75C-56825964F9C3";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize21";
	rename -uid "29AA809C-4A66-A944-19A1-56A1AF721F47";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize22";
	rename -uid "353014D6-4E59-F83A-0D6C-62B07943088C";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize23";
	rename -uid "61EC1714-4EBF-5C1E-8C24-AC9B48319A00";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize24";
	rename -uid "01BF3592-4FB6-62DB-EEE1-7FB0D6F28091";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize25";
	rename -uid "FD909D42-43BC-3E20-6C0C-FEB1615AAC46";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize26";
	rename -uid "71F54897-4C75-8021-13E3-F3A26F97A2E3";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize27";
	rename -uid "73E78346-440F-6057-95FA-FFBB0E13CEE9";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize28";
	rename -uid "B1C412C1-4E06-CA09-31FA-3994A1A59D9D";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize29";
	rename -uid "47D705B6-4FE5-2CDC-9EC9-12A967FB808B";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize30";
	rename -uid "70686373-4516-6F02-D8D3-DFA08EA27741";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize31";
	rename -uid "C3B6D8A2-4617-2CAC-B339-A299E0DE8908";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize32";
	rename -uid "D68B8529-4B8B-1629-4F43-98B5867D253A";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize33";
	rename -uid "8BFFCFC0-4654-6EB8-A940-8BBCF76A2C28";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize34";
	rename -uid "FA4EEA84-44C9-2909-3E65-F0AF2F8602C6";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize35";
	rename -uid "2D2D81CC-4170-63F3-51BA-0F881BBCB175";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize36";
	rename -uid "9B1569B2-4D2F-6437-236E-058AE37BC449";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize37";
	rename -uid "A61E2B4A-49AE-F21B-66A3-A7921D19DAFD";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize38";
	rename -uid "953F603B-4CC6-3C41-BA46-5BB2647D5A93";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize39";
	rename -uid "834F4347-4239-451B-2CA9-FC97647C1139";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize40";
	rename -uid "F8F2203E-47FD-22D3-3AF6-1A9FDEE2FDB0";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize41";
	rename -uid "19754D10-4F5E-BB2B-79F4-8EB40BDC0345";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize42";
	rename -uid "92EE5C4E-4627-0FAF-10A6-19B4ADADE366";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize43";
	rename -uid "B0A1452A-43BE-9461-9C42-32BED8367966";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize44";
	rename -uid "4AD9C51D-41CD-AEC5-F59B-AC95CAC22939";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize45";
	rename -uid "34A7E199-40D2-25E3-4003-B38E21DD3892";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize46";
	rename -uid "F64BD400-4AB6-8F4A-60FE-308FDF372486";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize47";
	rename -uid "3EDE4A0A-410F-D83D-893D-CB920925A323";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize48";
	rename -uid "294A4B8F-46AF-004A-058E-9886344CF0E8";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize49";
	rename -uid "5018E7E0-45EB-B995-835A-D6A81024AB30";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize50";
	rename -uid "29F168BD-4969-C3CC-6ECF-F6B1A21310CD";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize51";
	rename -uid "10B2DD11-4122-71EB-4494-4FB73F6DF84B";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 103 376 377 378 379 380 381
		 382 383 384 385 386 387 388 389 390 391 392 393
		 394 395 396 397 398 399 400 401 402 403 404 409
		 410 411 416 417 418 419 420 421 425 426 427 428
		 429 430 431 432 433 434 435 436 437 438 439 440
		 441 442 443 444 445 446 447 448 449 450 451 452
		 453 454 455 456 457 458 459 679 693 694 695 696
		 697 698 699 700 701 702 703 704 705 706 707 708
		 709 710 711 712 713 714 715 716 717 738 739 740
		 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV6";
	rename -uid "B5534AEC-4828-4A42-A028-EB998BBCBA36";
	setAttr ".uopa" yes;
	setAttr -s 103 ".uvtk";
	setAttr ".uvtk[376]" -type "float2" -0.010447383 -0.0040999055 ;
	setAttr ".uvtk[377]" -type "float2" -0.010169685 -0.0062869191 ;
	setAttr ".uvtk[378]" -type "float2" -0.0091536045 -0.0059142709 ;
	setAttr ".uvtk[379]" -type "float2" -0.0087849498 -0.0041095018 ;
	setAttr ".uvtk[380]" -type "float2" 0.0047049839 0.0070896707 ;
	setAttr ".uvtk[381]" -type "float2" 0.0033168378 0.0076685064 ;
	setAttr ".uvtk[382]" -type "float2" 0.0026992527 0.0096024498 ;
	setAttr ".uvtk[383]" -type "float2" 0.0035699578 0.0078966282 ;
	setAttr ".uvtk[384]" -type "float2" 0.0091043888 0.01976379 ;
	setAttr ".uvtk[385]" -type "float2" 0.0041029071 0.01445746 ;
	setAttr ".uvtk[386]" -type "float2" 0.0055571934 0.011404529 ;
	setAttr ".uvtk[387]" -type "float2" 0.011549005 0.014806487 ;
	setAttr ".uvtk[388]" -type "float2" 0.01860714 0.018215299 ;
	setAttr ".uvtk[389]" -type "float2" 0.014532387 0.025617599 ;
	setAttr ".uvtk[390]" -type "float2" 0.0018325094 0.011910353 ;
	setAttr ".uvtk[391]" -type "float2" 0.0055661798 0.012975097 ;
	setAttr ".uvtk[392]" -type "float2" 0.00040566921 0.0067257285 ;
	setAttr ".uvtk[393]" -type "float2" 0.00026607513 0.0057805181 ;
	setAttr ".uvtk[394]" -type "float2" 0.0055997372 0.01090014 ;
	setAttr ".uvtk[395]" -type "float2" -0.0007302165 0.0036039948 ;
	setAttr ".uvtk[396]" -type "float2" 0.0056821108 0.010028362 ;
	setAttr ".uvtk[397]" -type "float2" -0.0010763407 0.0024082065 ;
	setAttr ".uvtk[398]" -type "float2" 0.00073564053 0.0040185452 ;
	setAttr ".uvtk[399]" -type "float2" -0.00056397915 0.0059678555 ;
	setAttr ".uvtk[400]" -type "float2" -0.0042066574 0.0064209104 ;
	setAttr ".uvtk[401]" -type "float2" -0.0086414218 -0.0063753724 ;
	setAttr ".uvtk[402]" -type "float2" -0.0099871159 -0.0084742308 ;
	setAttr ".uvtk[403]" -type "float2" -0.011593759 -0.0094884038 ;
	setAttr ".uvtk[404]" -type "float2" -0.0088786483 -0.0091338158 ;
	setAttr ".uvtk[409]" -type "float2" -0.0039385557 0.0019953251 ;
	setAttr ".uvtk[410]" -type "float2" -0.0068224669 -0.00033468008 ;
	setAttr ".uvtk[411]" -type "float2" -0.0029193163 0.0015133023 ;
	setAttr ".uvtk[416]" -type "float2" 0.0056742597 0.0053529534 ;
	setAttr ".uvtk[417]" -type "float2" 0.0079508219 0.0054534632 ;
	setAttr ".uvtk[418]" -type "float2" -0.0030260682 0.00043857098 ;
	setAttr ".uvtk[419]" -type "float2" -0.00022554398 0.0019690394 ;
	setAttr ".uvtk[420]" -type "float2" -0.011587918 -0.0020212531 ;
	setAttr ".uvtk[421]" -type "float2" -0.0091146231 -0.0025993586 ;
	setAttr ".uvtk[425]" -type "float2" -0.00037014484 -0.00033485889 ;
	setAttr ".uvtk[426]" -type "float2" 0.00015592575 0.00070875883 ;
	setAttr ".uvtk[427]" -type "float2" 0.0021048188 0.0023034811 ;
	setAttr ".uvtk[428]" -type "float2" 0.00096285343 0.0014432669 ;
	setAttr ".uvtk[429]" -type "float2" -0.0051836371 -0.0069224834 ;
	setAttr ".uvtk[430]" -type "float2" -0.0044263601 -0.004732728 ;
	setAttr ".uvtk[431]" -type "float2" 0.0048953295 0.0034445524 ;
	setAttr ".uvtk[432]" -type "float2" 0.0070065856 0.003987968 ;
	setAttr ".uvtk[433]" -type "float2" 0.0031842589 0.0072470307 ;
	setAttr ".uvtk[434]" -type "float2" 0.0017911582 0.011020541 ;
	setAttr ".uvtk[435]" -type "float2" 0.0026395321 0.0072107315 ;
	setAttr ".uvtk[436]" -type "float2" 0.0024508834 0.0054998994 ;
	setAttr ".uvtk[437]" -type "float2" -0.00025862455 0.0012334585 ;
	setAttr ".uvtk[438]" -type "float2" 0.0014609098 0.0042671561 ;
	setAttr ".uvtk[439]" -type "float2" -0.0016029477 -0.0034222007 ;
	setAttr ".uvtk[440]" -type "float2" -0.0022226572 -0.0017554164 ;
	setAttr ".uvtk[441]" -type "float2" 0.0027208328 -0.0054358244 ;
	setAttr ".uvtk[442]" -type "float2" 0.0033704042 -0.0011369586 ;
	setAttr ".uvtk[443]" -type "float2" 0.0014925599 -0.0019090176 ;
	setAttr ".uvtk[444]" -type "float2" 0.0012913942 -0.0048128366 ;
	setAttr ".uvtk[445]" -type "float2" 0.0032005906 0.0092234612 ;
	setAttr ".uvtk[446]" -type "float2" -0.0034026504 -0.0064653158 ;
	setAttr ".uvtk[447]" -type "float2" 0.00015795231 -0.0075901747 ;
	setAttr ".uvtk[448]" -type "float2" -0.00066745281 -0.0064470172 ;
	setAttr ".uvtk[449]" -type "float2" 0.0024823919 0.0091726985 ;
	setAttr ".uvtk[450]" -type "float2" -0.0014157575 0.012760758 ;
	setAttr ".uvtk[451]" -type "float2" 3.2724813e-05 0.014282694 ;
	setAttr ".uvtk[452]" -type "float2" 0.01391839 0.0095490841 ;
	setAttr ".uvtk[453]" -type "float2" 0.0219028 0.013172746 ;
	setAttr ".uvtk[454]" -type "float2" 0.0065271794 0.0081364708 ;
	setAttr ".uvtk[455]" -type "float2" 0.0011165142 0.002814889 ;
	setAttr ".uvtk[456]" -type "float2" -0.0068557858 -0.0074806213 ;
	setAttr ".uvtk[457]" -type "float2" -0.0062825084 -0.0089003444 ;
	setAttr ".uvtk[458]" -type "float2" -0.004783392 -0.0083563924 ;
	setAttr ".uvtk[459]" -type "float2" -0.0031191111 -0.0081596375 ;
	setAttr ".uvtk[679]" -type "float2" -0.010865808 0.00054943562 ;
	setAttr ".uvtk[693]" -type "float2" -0.005852282 0.0030235052 ;
	setAttr ".uvtk[694]" -type "float2" -0.0080465162 0.0047428608 ;
	setAttr ".uvtk[695]" -type "float2" -0.013469232 0.0015671849 ;
	setAttr ".uvtk[696]" -type "float2" -0.014010025 -0.0022227168 ;
	setAttr ".uvtk[697]" -type "float2" -0.0117494 -0.0047603846 ;
	setAttr ".uvtk[698]" -type "float2" -0.01043023 -0.0069778562 ;
	setAttr ".uvtk[699]" -type "float2" 0.010861702 0.0059214695 ;
	setAttr ".uvtk[700]" -type "float2" 0.0058418219 0.0072188489 ;
	setAttr ".uvtk[701]" -type "float2" 0.0035529323 0.0063056978 ;
	setAttr ".uvtk[702]" -type "float2" 0.0072976234 0.0045543034 ;
	setAttr ".uvtk[703]" -type "float2" 0.016114604 0.0056321253 ;
	setAttr ".uvtk[704]" -type "float2" 0.025148749 0.0077261925 ;
	setAttr ".uvtk[705]" -type "float2" 0.0092024729 0.0099026561 ;
	setAttr ".uvtk[706]" -type "float2" -0.00062120706 0.0071807504 ;
	setAttr ".uvtk[707]" -type "float2" -0.012448549 -0.0097455978 ;
	setAttr ".uvtk[708]" -type "float2" -0.0096498132 -0.010539651 ;
	setAttr ".uvtk[709]" -type "float2" -0.0071501136 -0.011317015 ;
	setAttr ".uvtk[710]" -type "float2" -0.0043900013 -0.01161927 ;
	setAttr ".uvtk[711]" -type "float2" -0.0014275312 -0.0108518 ;
	setAttr ".uvtk[712]" -type "float2" 0.0010256767 -0.0087893009 ;
	setAttr ".uvtk[713]" -type "float2" 0.0041614175 -0.0058386922 ;
	setAttr ".uvtk[714]" -type "float2" 0.0050582886 0.00011366606 ;
	setAttr ".uvtk[715]" -type "float2" -0.00076335669 0.0025929809 ;
	setAttr ".uvtk[716]" -type "float2" 0.0033375025 0.0025792122 ;
	setAttr ".uvtk[717]" -type "float2" 0.0094504356 0.0039864182 ;
	setAttr ".uvtk[738]" -type "float2" 0.0068076253 0.00710392 ;
	setAttr ".uvtk[739]" -type "float2" 0.0017023571 0.018839568 ;
	setAttr ".uvtk[740]" -type "float2" 0.0055357157 0.027573906 ;
	setAttr ".uvtk[743]" -type "float2" 0.010052621 0.034774601 ;
createNode polyMapSew -n "polyMapSew4";
	rename -uid "1A10D501-4914-F5C1-B14A-B3B4F902F178";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[919]" "e[1058:1060]" "e[1072]";
createNode Unfold3DOptimize -n "Unfold3DOptimize52";
	rename -uid "B790DC47-4EC4-D1D0-8B6E-D4B943C6D7AD";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 11 86 87 88 89 90 397
		 400 686 687 743 745 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize53";
	rename -uid "20055B30-4D89-E96C-67F1-31AD4B105B49";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 11 86 87 88 89 90 397
		 400 684 685 737 738 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize54";
	rename -uid "8564672A-4F94-7F16-9ED9-909902556E0F";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 11 86 87 88 89 90 397
		 400 684 685 737 738 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize55";
	rename -uid "2F26445D-4B8B-8104-C5D7-D3BB9B30EB85";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 11 86 87 88 89 90 397
		 400 684 685 737 738 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize56";
	rename -uid "D0D90A75-4A36-13E8-EAF2-77B036C6EE38";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 11 86 87 88 89 90 397
		 400 684 685 737 738 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize57";
	rename -uid "F88E66D0-4050-3E8F-5673-21AA629D63BB";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 11 86 87 88 89 90 397
		 400 684 685 737 738 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize58";
	rename -uid "DEB9DA9E-4E6E-4C43-1ABF-FC8938061CC8";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 11 86 87 88 89 90 397
		 400 684 685 737 738 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize59";
	rename -uid "77C164D8-492A-8C8E-9E55-50B30B2C9B55";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 11 86 87 88 89 90 397
		 400 684 685 737 738 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV7";
	rename -uid "80FD37D8-4DCE-3D7B-8361-689CCDB507D8";
	setAttr ".uopa" yes;
	setAttr -s 6 ".uvtk";
	setAttr ".uvtk[86]" -type "float2" -0.040026981 0.03471088 ;
	setAttr ".uvtk[87]" -type "float2" -0.053911634 0.0058123041 ;
	setAttr ".uvtk[89]" -type "float2" -0.010319478 0.020013472 ;
	setAttr ".uvtk[90]" -type "float2" -0.0050033405 0.040965103 ;
	setAttr ".uvtk[737]" -type "float2" -0.00093810778 0.055975229 ;
	setAttr ".uvtk[738]" -type "float2" -0.024391405 0.079741247 ;
createNode polyMapSew -n "polyMapSew5";
	rename -uid "66AC28AF-49E5-6B31-7F22-BEAA9F273249";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[1054]";
createNode polyTweakUV -n "polyTweakUV8";
	rename -uid "6E32842B-46D2-3DFB-7F68-EE896F7EDC52";
	setAttr ".uopa" yes;
	setAttr -s 184 ".uvtk";
	setAttr ".uvtk[65]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[66]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[67]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[68]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[69]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[70]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[71]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[72]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[73]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[74]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[75]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[76]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[77]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[78]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[79]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[80]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[81]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[82]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[83]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[84]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[85]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[86]" -type "float2" 0.087070592 -0.01561935 ;
	setAttr ".uvtk[87]" -type "float2" 0.093330391 -0.031714872 ;
	setAttr ".uvtk[88]" -type "float2" 0.073770173 -0.028284859 ;
	setAttr ".uvtk[89]" -type "float2" 0.089063525 -0.023626041 ;
	setAttr ".uvtk[90]" -type "float2" 0.092482395 -0.034372762 ;
	setAttr ".uvtk[91]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[92]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[93]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[94]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[95]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[96]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[97]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[98]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[99]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[100]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[105]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[106]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[107]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[110]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[111]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[112]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[113]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[114]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[115]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[116]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[117]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[118]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[119]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[120]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[121]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[376]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[377]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[378]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[379]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[380]" -type "float2" 0.094754942 -0.033213988 ;
	setAttr ".uvtk[381]" -type "float2" 0.094592758 -0.033087328 ;
	setAttr ".uvtk[382]" -type "float2" 0.094613917 -0.032621156 ;
	setAttr ".uvtk[383]" -type "float2" 0.094390519 -0.03294988 ;
	setAttr ".uvtk[384]" -type "float2" 0.097015925 -0.032254294 ;
	setAttr ".uvtk[385]" -type "float2" 0.095923908 -0.03119738 ;
	setAttr ".uvtk[386]" -type "float2" 0.095343657 -0.032088652 ;
	setAttr ".uvtk[387]" -type "float2" 0.09613622 -0.032143667 ;
	setAttr ".uvtk[388]" -type "float2" 0.096892424 -0.031580284 ;
	setAttr ".uvtk[389]" -type "float2" 0.098179527 -0.031580284 ;
	setAttr ".uvtk[390]" -type "float2" 0.095339425 -0.031613007 ;
	setAttr ".uvtk[391]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[392]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[393]" -type "float2" 0.095559843 -0.033247724 ;
	setAttr ".uvtk[394]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[395]" -type "float2" 0.096569069 -0.031750455 ;
	setAttr ".uvtk[396]" -type "float2" 0.092788883 -0.033244267 ;
	setAttr ".uvtk[397]" -type "float2" 0.079126418 -0.01896758 ;
	setAttr ".uvtk[398]" -type "float2" 0.095990486 -0.032917753 ;
	setAttr ".uvtk[399]" -type "float2" 0.097795613 -0.033011153 ;
	setAttr ".uvtk[400]" -type "float2" 0.089328051 -0.00038594753 ;
	setAttr ".uvtk[401]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[402]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[403]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[404]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[409]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[410]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[411]" -type "float2" 0.094912596 -0.032369748 ;
	setAttr ".uvtk[416]" -type "float2" 0.09504766 -0.033198372 ;
	setAttr ".uvtk[417]" -type "float2" 0.095032938 -0.033186689 ;
	setAttr ".uvtk[418]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[419]" -type "float2" 0.095304318 -0.032882407 ;
	setAttr ".uvtk[420]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[421]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[425]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[426]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[427]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[428]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[429]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[430]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[431]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[432]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[433]" -type "float2" 0.094636627 -0.032696676 ;
	setAttr ".uvtk[434]" -type "float2" 0.095328279 -0.030209493 ;
	setAttr ".uvtk[435]" -type "float2" 0.0960517 -0.031970337 ;
	setAttr ".uvtk[436]" -type "float2" 0.09551353 -0.032740366 ;
	setAttr ".uvtk[437]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[438]" -type "float2" 0.095447905 -0.033664182 ;
	setAttr ".uvtk[439]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[440]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[441]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[442]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[443]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[444]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[445]" -type "float2" 0.097302504 -0.030985724 ;
	setAttr ".uvtk[446]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[447]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[448]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[449]" -type "float2" 0.094472475 -0.032430246 ;
	setAttr ".uvtk[451]" -type "float2" 0.095567293 -0.031792358 ;
	setAttr ".uvtk[452]" -type "float2" 0.095748611 -0.031580284 ;
	setAttr ".uvtk[453]" -type "float2" 0.095095761 -0.032529961 ;
	setAttr ".uvtk[454]" -type "float2" 0.09526784 -0.032458317 ;
	setAttr ".uvtk[455]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[456]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[457]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[458]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[663]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[664]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[665]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[666]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[667]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[668]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[669]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[670]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[671]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[678]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[683]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[684]" -type "float2" 0.066785887 -0.0022887625 ;
	setAttr ".uvtk[685]" -type "float2" 0.071875103 -0.023669373 ;
	setAttr ".uvtk[686]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[687]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[688]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[689]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[690]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[691]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[692]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[693]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[694]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[695]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[696]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[697]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[698]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[699]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[700]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[701]" -type "float2" 0.094953783 -0.031580284 ;
	setAttr ".uvtk[702]" -type "float2" 0.094953783 -0.029687889 ;
	setAttr ".uvtk[703]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[704]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[705]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[706]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[707]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[708]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[709]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[710]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[711]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[712]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[713]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[714]" -type "float2" 0.094953783 -0.033143118 ;
	setAttr ".uvtk[720]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[721]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[722]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[723]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[724]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[725]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[726]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[727]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[728]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[729]" -type "float2" 0.099409603 -0.083815947 ;
	setAttr ".uvtk[730]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[731]" -type "float2" 0.099409603 -0.083815962 ;
	setAttr ".uvtk[732]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[733]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[734]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[735]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[736]" -type "float2" 0.099409603 -0.083815955 ;
	setAttr ".uvtk[737]" -type "float2" 0.098262064 -0.030651674 ;
	setAttr ".uvtk[738]" -type "float2" 0.097341962 -0.029583648 ;
	setAttr ".uvtk[739]" -type "float2" 0.099409603 -0.083815955 ;
createNode polyMapCut -n "polyMapCut4";
	rename -uid "32A6D67F-4F17-AE67-4E1F-69975D78ADA8";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 4 "e[23]" "e[26]" "e[582]" "e[878]";
createNode polyTweakUV -n "polyTweakUV9";
	rename -uid "04F311F9-4F84-9A6E-85D3-3BB6321BE503";
	setAttr ".uopa" yes;
	setAttr -s 24 ".uvtk";
	setAttr ".uvtk[33]" -type "float2" 0.45628387 -0.093701147 ;
	setAttr ".uvtk[38]" -type "float2" 0.5556848 -0.085921966 ;
	setAttr ".uvtk[39]" -type "float2" 0.5556848 -0.085921936 ;
	setAttr ".uvtk[53]" -type "float2" 0.55568486 -0.085921966 ;
	setAttr ".uvtk[54]" -type "float2" 0.5556848 -0.085921936 ;
	setAttr ".uvtk[55]" -type "float2" 0.5556848 -0.085921936 ;
	setAttr ".uvtk[56]" -type "float2" 0.5556848 -0.085921936 ;
	setAttr ".uvtk[63]" -type "float2" 0.45628384 -0.093701147 ;
	setAttr ".uvtk[64]" -type "float2" 0.45628387 -0.093701147 ;
	setAttr ".uvtk[101]" -type "float2" 0.45628387 -0.093701147 ;
	setAttr ".uvtk[102]" -type "float2" 0.45628387 -0.093701147 ;
	setAttr ".uvtk[103]" -type "float2" 0.45628387 -0.093701147 ;
	setAttr ".uvtk[104]" -type "float2" 0.45628387 -0.093701147 ;
	setAttr ".uvtk[108]" -type "float2" 0.4562839 -0.093701147 ;
	setAttr ".uvtk[109]" -type "float2" 0.45628384 -0.093701147 ;
	setAttr ".uvtk[679]" -type "float2" 0.45628384 -0.093701147 ;
	setAttr ".uvtk[680]" -type "float2" 0.55568475 -0.085921966 ;
	setAttr ".uvtk[681]" -type "float2" 0.5556848 -0.085921936 ;
	setAttr ".uvtk[682]" -type "float2" 0.5556848 -0.085921966 ;
	setAttr ".uvtk[776]" -type "float2" 0.5556848 -0.085921936 ;
	setAttr ".uvtk[777]" -type "float2" 0.5556848 -0.085921966 ;
	setAttr ".uvtk[778]" -type "float2" 0.45628387 -0.093701147 ;
	setAttr ".uvtk[779]" -type "float2" 0.4562839 -0.093701147 ;
	setAttr ".uvtk[781]" -type "float2" 0.5556848 -0.085921936 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize60";
	rename -uid "32743ADA-42D8-D406-DE36-1CA1AA177FCC";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 12 38 39 53 54 55 56
		 680 681 682 776 777 781 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV10";
	rename -uid "21B4C15C-4BC7-AC19-6473-B1922F2A000F";
	setAttr ".uopa" yes;
	setAttr -s 12 ".uvtk";
	setAttr ".uvtk[38]" -type "float2" 0.12202147 0.042812016 ;
	setAttr ".uvtk[39]" -type "float2" 0.14196128 0.042648107 ;
	setAttr ".uvtk[40]" -type "float2" 0.14013244 0.058898538 ;
	setAttr ".uvtk[41]" -type "float2" 0.11674991 0.059539407 ;
	setAttr ".uvtk[55]" -type "float2" 0.068886541 0.019981535 ;
	setAttr ".uvtk[56]" -type "float2" 0.092317663 0.042357206 ;
	setAttr ".uvtk[57]" -type "float2" 0.08452744 0.053944673 ;
	setAttr ".uvtk[58]" -type "float2" 0.054398723 0.033773661 ;
	setAttr ".uvtk[684]" -type "float2" 0.078775316 0.010976287 ;
	setAttr ".uvtk[685]" -type "float2" 0.098948866 0.033218358 ;
	setAttr ".uvtk[686]" -type "float2" 0.12854758 0.020739142 ;
	setAttr ".uvtk[687]" -type "float2" 0.1431905 0.024887349 ;
createNode polyMapSew -n "polyMapSew6";
	rename -uid "42319656-4563-6813-7912-04AF2F782D2D";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[30]" "e[586]";
createNode Unfold3DOptimize -n "Unfold3DOptimize61";
	rename -uid "1E4268D3-4012-521E-B324-84BBA689E207";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 26 38 39 40 41 55 56
		 57 58 59 60 61 62 63 64 65 66 67 68
		 105 106 107 108 113 683 684 685 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize62";
	rename -uid "38E4AC31-4656-634D-793E-AB91AD8CF974";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 26 38 39 40 41 55 56
		 57 58 59 60 61 62 63 64 65 66 67 68
		 105 106 107 108 112 681 682 683 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize63";
	rename -uid "4EA0FC33-4559-DB83-5CCF-A5A1FA5FDB84";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 26 38 39 40 41 55 56
		 57 58 59 60 61 62 63 64 65 66 67 68
		 105 106 107 108 112 681 682 683 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize64";
	rename -uid "C59988CD-4285-1390-792A-F8A60085BB5C";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 26 38 39 40 41 55 56
		 57 58 59 60 61 62 63 64 65 66 67 68
		 105 106 107 108 112 681 682 683 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize65";
	rename -uid "D87A9F13-497E-9B0C-4221-10B0EF3932ED";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 26 38 39 40 41 55 56
		 57 58 59 60 61 62 63 64 65 66 67 68
		 105 106 107 108 112 681 682 683 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV12";
	rename -uid "E94A6395-4983-568F-6B1B-9395A2D4B94B";
	setAttr ".uopa" yes;
	setAttr -s 26 ".uvtk";
	setAttr ".uvtk[38]" -type "float2" -0.46293125 -0.5977298 ;
	setAttr ".uvtk[39]" -type "float2" -0.57233 -0.34768969 ;
	setAttr ".uvtk[40]" -type "float2" -0.70585483 -0.51168776 ;
	setAttr ".uvtk[41]" -type "float2" -0.43399534 -0.60309553 ;
	setAttr ".uvtk[55]" -type "float2" -0.44587785 -0.60078073 ;
	setAttr ".uvtk[56]" -type "float2" -0.45161813 -0.60599792 ;
	setAttr ".uvtk[57]" -type "float2" -0.44705513 -0.60853791 ;
	setAttr ".uvtk[58]" -type "float2" -0.44193977 -0.60756308 ;
	setAttr ".uvtk[59]" -type "float2" -0.096180163 -0.5691911 ;
	setAttr ".uvtk[60]" -type "float2" -0.090416573 -0.58380282 ;
	setAttr ".uvtk[61]" -type "float2" -0.071218677 -0.60257095 ;
	setAttr ".uvtk[62]" -type "float2" -0.074765585 -0.59741443 ;
	setAttr ".uvtk[63]" -type "float2" -0.27876458 -0.38151351 ;
	setAttr ".uvtk[64]" -type "float2" -0.29273897 -0.63248956 ;
	setAttr ".uvtk[65]" -type "float2" -0.088930033 -0.58099568 ;
	setAttr ".uvtk[66]" -type "float2" -0.09186732 -0.58048463 ;
	setAttr ".uvtk[67]" -type "float2" -0.092184149 -0.57972825 ;
	setAttr ".uvtk[68]" -type "float2" -0.087924622 -0.58148873 ;
	setAttr ".uvtk[105]" -type "float2" -0.087378614 -0.57832116 ;
	setAttr ".uvtk[106]" -type "float2" -0.089583091 -0.57927465 ;
	setAttr ".uvtk[107]" -type "float2" -0.086397864 -0.58149362 ;
	setAttr ".uvtk[108]" -type "float2" -0.084589414 -0.58002883 ;
	setAttr ".uvtk[112]" -type "float2" -0.089019485 -0.5814178 ;
	setAttr ".uvtk[681]" -type "float2" -0.08731506 -0.58378261 ;
	setAttr ".uvtk[682]" -type "float2" -0.45197707 -0.598463 ;
	setAttr ".uvtk[683]" -type "float2" -0.45760757 -0.61057401 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize66";
	rename -uid "A53FAB45-4D49-76BD-E020-CA959E1A867C";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 4 61 62 63 64 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV13";
	rename -uid "6391563C-46CA-198B-EA1E-AABC2653609C";
	setAttr ".uopa" yes;
	setAttr -s 6 ".uvtk";
	setAttr ".uvtk[55]" -type "float2" -0.5467999 0.15826358 ;
	setAttr ".uvtk[56]" -type "float2" -0.37371781 0.04461699 ;
	setAttr ".uvtk[57]" -type "float2" -0.32757822 0.13651337 ;
	setAttr ".uvtk[58]" -type "float2" -0.47070944 0.2686424 ;
	setAttr ".uvtk[682]" -type "float2" -0.58907145 0.080089428 ;
	setAttr ".uvtk[683]" -type "float2" -0.38246599 -0.047740981 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize67";
	rename -uid "A3550A2B-45DC-E831-14E0-CEA0A928B46B";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 9 38 39 40 41 56 57
		 63 64 683 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV14";
	rename -uid "072EC71A-4E72-6C34-946F-B3BC8A8BC118";
	setAttr ".uopa" yes;
	setAttr -s 26 ".uvtk";
	setAttr ".uvtk[38]" -type "float2" 0.8447758 0.38427088 ;
	setAttr ".uvtk[39]" -type "float2" 0.88351005 0.31548044 ;
	setAttr ".uvtk[40]" -type "float2" 0.93308282 0.32999173 ;
	setAttr ".uvtk[41]" -type "float2" 0.86984581 0.368265 ;
	setAttr ".uvtk[55]" -type "float2" 1.1228733 0.34955361 ;
	setAttr ".uvtk[56]" -type "float2" 0.98939306 0.36742583 ;
	setAttr ".uvtk[57]" -type "float2" 0.9752208 0.31663337 ;
	setAttr ".uvtk[58]" -type "float2" 1.0970501 0.26458853 ;
	setAttr ".uvtk[59]" -type "float2" 0.67229712 0.40944168 ;
	setAttr ".uvtk[60]" -type "float2" 0.58147472 0.31968781 ;
	setAttr ".uvtk[61]" -type "float2" 0.65140146 0.29307526 ;
	setAttr ".uvtk[62]" -type "float2" 0.6754784 0.31901371 ;
	setAttr ".uvtk[63]" -type "float2" 0.79839194 0.30098599 ;
	setAttr ".uvtk[64]" -type "float2" 0.78503948 0.38218632 ;
	setAttr ".uvtk[65]" -type "float2" 0.44317329 0.43102589 ;
	setAttr ".uvtk[66]" -type "float2" 0.55766499 0.54934239 ;
	setAttr ".uvtk[67]" -type "float2" 0.49159169 0.64080799 ;
	setAttr ".uvtk[68]" -type "float2" 0.36401641 0.53126359 ;
	setAttr ".uvtk[105]" -type "float2" 0.60104698 0.69974405 ;
	setAttr ".uvtk[106]" -type "float2" 0.63591188 0.61132997 ;
	setAttr ".uvtk[107]" -type "float2" 0.76173306 0.69033891 ;
	setAttr ".uvtk[108]" -type "float2" 0.73987859 0.74387902 ;
	setAttr ".uvtk[112]" -type "float2" 0.71504116 0.5615961 ;
	setAttr ".uvtk[681]" -type "float2" 0.77502012 0.65291315 ;
	setAttr ".uvtk[682]" -type "float2" 1.1347431 0.40679318 ;
	setAttr ".uvtk[683]" -type "float2" 0.9833104 0.40430439 ;
createNode polyMapSew -n "polyMapSew7";
	rename -uid "D4189F78-446E-CA00-2459-B68F0691BFFF";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[1003]";
createNode polyMapSew -n "polyMapSew8";
	rename -uid "21CE7F4D-47D4-3B8B-9B9C-A681B520404C";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[58]";
createNode polyMapSew -n "polyMapSew9";
	rename -uid "878468C1-4F8B-EC8B-E545-3D9E3076A732";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[76]" "e[1022]";
createNode polyTweakUV -n "polyTweakUV15";
	rename -uid "78E18E10-4A32-2712-0F2A-60ACF1421C3A";
	setAttr ".uopa" yes;
	setAttr -s 3 ".uvtk";
	setAttr ".uvtk[107]" -type "float2" 0.032423202 0.034129664 ;
	setAttr ".uvtk[108]" -type "float2" 0.032423202 0.034129664 ;
	setAttr ".uvtk[110]" -type "float2" 0.010665511 0.013651859 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize68";
	rename -uid "BAC0B047-43C4-FF88-C1CB-5C9F8A02DD16";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 7 65 66 67 105 106 107
		 108 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV16";
	rename -uid "47915448-4321-10CE-A54B-598503ACE3D6";
	setAttr ".uopa" yes;
	setAttr -s 7 ".uvtk";
	setAttr ".uvtk[65]" -type "float2" 0.0011914968 0.014530987 ;
	setAttr ".uvtk[66]" -type "float2" -7.6293945e-06 0.010339677 ;
	setAttr ".uvtk[67]" -type "float2" 0.0045516491 0.011845976 ;
	setAttr ".uvtk[104]" -type "float2" 0.014329076 0.0081817806 ;
	setAttr ".uvtk[105]" -type "float2" 0.0052902699 0.0085804164 ;
	setAttr ".uvtk[106]" -type "float2" 0.0040055513 0.0082081258 ;
	setAttr ".uvtk[107]" -type "float2" -0.0032134056 -0.0068701208 ;
createNode polyMapSew -n "polyMapSew10";
	rename -uid "79645B31-42A9-A93C-BBD2-DFAD5A4201EB";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[48]" "e[59]" "e[1004]";
createNode polyTweakUV -n "polyTweakUV17";
	rename -uid "77B3A49F-4AE3-9BA1-795B-14B3C1BF76B2";
	setAttr ".uopa" yes;
	setAttr -s 97 ".uvtk";
	setAttr ".uvtk[38]" -type "float2" -0.027194791 0.01253143 ;
	setAttr ".uvtk[39]" -type "float2" -0.025833419 0.02842921 ;
	setAttr ".uvtk[40]" -type "float2" -0.020769687 0.033085942 ;
	setAttr ".uvtk[41]" -type "float2" -0.027280182 0.0094040846 ;
	setAttr ".uvtk[55]" -type "float2" -0.044117905 0.020352069 ;
	setAttr ".uvtk[56]" -type "float2" -0.029355753 0.0088118315 ;
	setAttr ".uvtk[57]" -type "float2" -0.034813136 0.0094040846 ;
	setAttr ".uvtk[58]" -type "float2" -0.044547409 0.027806692 ;
	setAttr ".uvtk[59]" -type "float2" -0.027550928 0.012165874 ;
	setAttr ".uvtk[60]" -type "float2" -0.038268559 0.013752103 ;
	setAttr ".uvtk[61]" -type "float2" -0.03232681 0.014982134 ;
	setAttr ".uvtk[62]" -type "float2" -0.028085224 0.0165084 ;
	setAttr ".uvtk[63]" -type "float2" -0.024767091 0.023096651 ;
	setAttr ".uvtk[64]" -type "float2" -0.031912673 0.022983253 ;
	setAttr ".uvtk[65]" -type "float2" -0.050184704 0.0061040819 ;
	setAttr ".uvtk[66]" -type "float2" -0.036672205 0.0041285157 ;
	setAttr ".uvtk[67]" -type "float2" -0.051899381 0 ;
	setAttr ".uvtk[68]" -type "float2" -0.066608131 0.034163237 ;
	setAttr ".uvtk[69]" -type "float2" -0.025682619 0.0081843436 ;
	setAttr ".uvtk[70]" -type "float2" -0.030479003 0.015008867 ;
	setAttr ".uvtk[71]" -type "float2" -0.027133279 0.0048114657 ;
	setAttr ".uvtk[72]" -type "float2" -0.025546124 0.0018474758 ;
	setAttr ".uvtk[74]" -type "float2" -0.035838597 0.018590361 ;
	setAttr ".uvtk[75]" -type "float2" -0.02220439 0.00049087405 ;
	setAttr ".uvtk[76]" -type "float2" -0.024468951 -0.0014095902 ;
	setAttr ".uvtk[77]" -type "float2" -0.035393231 0.014181525 ;
	setAttr ".uvtk[78]" -type "float2" -0.03606575 0.0087085664 ;
	setAttr ".uvtk[79]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[80]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[81]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[82]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[83]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[84]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[85]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[86]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[87]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[88]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[94]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[95]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[96]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[97]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[98]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[99]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[100]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[101]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[102]" -type "float2" -0.025833422 -0.0044909329 ;
	setAttr ".uvtk[103]" -type "float2" -0.035280645 0.0062394068 ;
	setAttr ".uvtk[104]" -type "float2" -0.046694577 0 ;
	setAttr ".uvtk[105]" -type "float2" -0.031335801 0.00058934093 ;
	setAttr ".uvtk[106]" -type "float2" -0.028495584 -0.005777359 ;
	setAttr ".uvtk[107]" -type "float2" -0.025027452 0.013459861 ;
	setAttr ".uvtk[108]" -type "float2" -0.025833359 -0.015833765 ;
	setAttr ".uvtk[109]" -type "float2" -0.026589327 -0.0045052171 ;
	setAttr ".uvtk[110]" -type "float2" -0.018192878 0.0074029565 ;
	setAttr ".uvtk[111]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[112]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[113]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[114]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[115]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[116]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[117]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[118]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[119]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[120]" -type "float2" -0.027342848 0.0052690804 ;
	setAttr ".uvtk[121]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[122]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[663]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[664]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[665]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[666]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[667]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[668]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[669]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[670]" -type "float2" -0.026686959 0.0038308501 ;
	setAttr ".uvtk[671]" -type "float2" -0.025833359 -0.002812475 ;
	setAttr ".uvtk[681]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[684]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[685]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[686]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[717]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[718]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[719]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[720]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[721]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[722]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[723]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[724]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[725]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[726]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[727]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[728]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[729]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[730]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[731]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[732]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[733]" -type "float2" -0.025833419 0 ;
	setAttr ".uvtk[736]" -type "float2" -0.025833419 0 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize69";
	rename -uid "80C822AF-40F2-38E9-DB58-C1ACBA6A5A6D";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 14 38 41 56 57 59 62
		 64 66 67 69 70 104 105 110 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV18";
	rename -uid "CBC98C53-4CBE-7D7E-3555-DD91021E63B2";
	setAttr ".uopa" yes;
	setAttr -s 275 ".uvtk";
	setAttr ".uvtk[38]" -type "float2" -0.0055466332 0.0024538955 ;
	setAttr ".uvtk[39]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[40]" -type "float2" -0.0046937503 0.0015385172 ;
	setAttr ".uvtk[41]" -type "float2" -0.0080411471 0.0078678736 ;
	setAttr ".uvtk[55]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[56]" -type "float2" -0.0064076222 0.0079393992 ;
	setAttr ".uvtk[57]" -type "float2" -0.012186054 0.012071819 ;
	setAttr ".uvtk[58]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[59]" -type "float2" -0.0077291168 0.0020713827 ;
	setAttr ".uvtk[60]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[61]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[62]" -type "float2" -0.0055303015 0.0014711639 ;
	setAttr ".uvtk[63]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[64]" -type "float2" -0.0056466497 0.0021508953 ;
	setAttr ".uvtk[65]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[66]" -type "float2" -0.016354624 0.0041029761 ;
	setAttr ".uvtk[67]" -type "float2" -0.016408864 0.0080816755 ;
	setAttr ".uvtk[68]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[69]" -type "float2" -0.0061246194 0.00077241869 ;
	setAttr ".uvtk[70]" -type "float2" -0.0051952042 0.0013557991 ;
	setAttr ".uvtk[71]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[72]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[73]" -type "float2" -0.0047917999 0.0025741777 ;
	setAttr ".uvtk[74]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[75]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[76]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[77]" -type "float2" -0.0038916506 0.0032928309 ;
	setAttr ".uvtk[78]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[79]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[80]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[81]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[82]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[83]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[84]" -type "float2" -0.004615549 0.0015385135 ;
	setAttr ".uvtk[85]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[86]" -type "float2" -0.004615549 0.0015385144 ;
	setAttr ".uvtk[87]" -type "float2" -0.004615549 0.0015385144 ;
	setAttr ".uvtk[93]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[94]" -type "float2" -0.004615549 0.0015385135 ;
	setAttr ".uvtk[95]" -type "float2" -0.004615549 0.0015385144 ;
	setAttr ".uvtk[96]" -type "float2" -0.004615549 0.0015385144 ;
	setAttr ".uvtk[97]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[98]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[99]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[100]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[101]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[102]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[103]" -type "float2" -0.012806956 0.0038956425 ;
	setAttr ".uvtk[104]" -type "float2" -0.01302183 0.0041261623 ;
	setAttr ".uvtk[105]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[106]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[107]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[108]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[109]" -type "float2" -0.0090961494 0.0011869392 ;
	setAttr ".uvtk[110]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[111]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[112]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[113]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[114]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[115]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[116]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[117]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[118]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[119]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[120]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[121]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[166]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[167]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[168]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[169]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[170]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[171]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[172]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[173]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[174]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[175]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[176]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[177]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[178]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[179]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[180]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[181]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[182]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[183]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[184]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[185]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[186]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[187]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[188]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[189]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[190]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[191]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[192]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[193]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[194]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[195]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[196]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[197]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[198]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[199]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[200]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[201]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[202]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[203]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[204]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[205]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[206]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[207]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[208]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[209]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[210]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[211]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[212]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[213]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[214]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[215]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[216]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[217]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[218]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[219]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[220]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[221]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[222]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[223]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[224]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[225]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[226]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[227]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[228]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[229]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[230]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[231]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[232]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[233]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[234]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[235]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[236]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[237]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[238]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[239]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[240]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[241]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[242]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[243]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[244]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[245]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[246]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[247]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[248]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[249]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[250]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[251]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[252]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[253]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[254]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[255]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[256]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[257]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[258]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[259]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[260]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[261]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[262]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[263]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[264]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[265]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[266]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[267]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[268]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[269]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[270]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[271]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[272]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[273]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[274]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[275]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[276]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[277]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[278]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[279]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[280]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[281]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[282]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[283]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[284]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[285]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[286]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[287]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[288]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[289]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[290]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[291]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[292]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[293]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[294]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[295]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[296]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[297]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[298]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[299]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[300]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[301]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[302]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[303]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[304]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[305]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[306]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[307]" -type "float2" -0.062035657 -0.67886418 ;
	setAttr ".uvtk[308]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[309]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[310]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[498]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[499]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[500]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[501]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[662]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[663]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[664]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[665]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[666]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[667]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[668]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[669]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[670]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[678]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[681]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[682]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[683]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[714]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[715]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[716]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[717]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[718]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[719]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[720]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[721]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[722]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[723]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[724]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[725]" -type "float2" -0.004615549 0.0015385172 ;
	setAttr ".uvtk[726]" -type "float2" -0.004615549 0.0015385135 ;
	setAttr ".uvtk[727]" -type "float2" -0.004615549 0.0015385135 ;
	setAttr ".uvtk[728]" -type "float2" -0.004615549 0.0015385135 ;
	setAttr ".uvtk[729]" -type "float2" -0.004615549 0.0015385144 ;
	setAttr ".uvtk[730]" -type "float2" -0.004615549 0.0015385144 ;
	setAttr ".uvtk[733]" -type "float2" -0.004615549 0.0015385144 ;
	setAttr ".uvtk[734]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[735]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[736]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[737]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[738]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[739]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[740]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[741]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[742]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[743]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[744]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[745]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[746]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[747]" -type "float2" -0.062035717 -0.67886418 ;
	setAttr ".uvtk[748]" -type "float2" -0.062035777 -0.67886418 ;
	setAttr ".uvtk[749]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[750]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[751]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[752]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[757]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[758]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[759]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[760]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[765]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[766]" -type "float2" -0.062035687 -0.67886418 ;
	setAttr ".uvtk[767]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[768]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[769]" -type "float2" -0.062035747 -0.67886418 ;
	setAttr ".uvtk[770]" -type "float2" -0.062035747 -0.67886418 ;
createNode polyMapCut -n "polyMapCut5";
	rename -uid "54C8AE44-4388-0CBB-12C3-4AB31E1E2B1C";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[630:631]";
createNode polyTweakUV -n "polyTweakUV19";
	rename -uid "D36FC23D-4F63-198E-759A-02B49CD48D85";
	setAttr ".uopa" yes;
	setAttr -s 195 ".uvtk";
	setAttr ".uvtk[0]" -type "float2" 0.0034981398 -0.22621387 ;
	setAttr ".uvtk[1]" -type "float2" 0.0034981398 -0.22621387 ;
	setAttr ".uvtk[2]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[3]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[4]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[5]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[6]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[7]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[8]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[9]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[10]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[11]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[12]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[13]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[14]" -type "float2" 0.0034981398 -0.2262139 ;
	setAttr ".uvtk[15]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[16]" -type "float2" 0.0034981472 -0.2262139 ;
	setAttr ".uvtk[17]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[18]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[19]" -type "float2" 0.0034981472 -0.2262139 ;
	setAttr ".uvtk[20]" -type "float2" 0.003498151 -0.2262139 ;
	setAttr ".uvtk[21]" -type "float2" 0.003498151 -0.2262139 ;
	setAttr ".uvtk[22]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[23]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[24]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[25]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[26]" -type "float2" 0.0034981472 -0.2262139 ;
	setAttr ".uvtk[27]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[28]" -type "float2" 0.0034981528 -0.2262139 ;
	setAttr ".uvtk[29]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[30]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[31]" -type "float2" 0.0034981528 -0.2262139 ;
	setAttr ".uvtk[32]" -type "float2" 0.0034981547 -0.22621389 ;
	setAttr ".uvtk[33]" -type "float2" 0.0034981547 -0.22621389 ;
	setAttr ".uvtk[34]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[35]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[36]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[37]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[42]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[43]" -type "float2" 0.003498151 -0.22621387 ;
	setAttr ".uvtk[44]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[45]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[46]" -type "float2" 0.0034981472 -0.22621387 ;
	setAttr ".uvtk[47]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[48]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[49]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[50]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[51]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[52]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[53]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[54]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[122]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[123]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[124]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[125]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[126]" -type "float2" 0.0034981472 -0.2262139 ;
	setAttr ".uvtk[127]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[128]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[129]" -type "float2" 0.0034981472 -0.2262139 ;
	setAttr ".uvtk[130]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[131]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[132]" -type "float2" 0.0034981472 -0.2262139 ;
	setAttr ".uvtk[133]" -type "float2" 0.0034981472 -0.2262139 ;
	setAttr ".uvtk[134]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[135]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[136]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[137]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[138]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[139]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[140]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[141]" -type "float2" 0.0034981472 -0.22621387 ;
	setAttr ".uvtk[166]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[167]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[168]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[169]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[174]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[175]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[176]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[177]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[178]" -type "float2" -0.05387646 -0.23135196 ;
	setAttr ".uvtk[179]" -type "float2" -0.05387646 -0.23135196 ;
	setAttr ".uvtk[180]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[181]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[182]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[183]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[188]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[189]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[190]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[191]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[192]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[193]" -type "float2" -0.05387646 -0.23135194 ;
	setAttr ".uvtk[194]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[195]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[203]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[210]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[211]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[212]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[213]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[214]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[215]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[216]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[217]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[218]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[219]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[220]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[221]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[222]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[223]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[224]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[225]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[226]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[227]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[232]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[233]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[234]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[235]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[236]" -type "float2" -0.05387646 -0.23135196 ;
	setAttr ".uvtk[237]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[238]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[252]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[253]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[254]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[255]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[256]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[257]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[258]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[259]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[260]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[261]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[262]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[263]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[264]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[281]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[282]" -type "float2" -0.05387646 -0.23135194 ;
	setAttr ".uvtk[291]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[292]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[301]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[302]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[310]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[469]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[470]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[471]" -type "float2" 0.003498151 -0.22621387 ;
	setAttr ".uvtk[473]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[474]" -type "float2" 0.0034981528 -0.2262139 ;
	setAttr ".uvtk[475]" -type "float2" 0.0034981472 -0.2262139 ;
	setAttr ".uvtk[476]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[477]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[478]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[479]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[480]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[481]" -type "float2" 0.0034981528 -0.2262139 ;
	setAttr ".uvtk[482]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[483]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[484]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[485]" -type "float2" 0.0034981398 -0.2262139 ;
	setAttr ".uvtk[486]" -type "float2" 0.0034981547 -0.2262139 ;
	setAttr ".uvtk[487]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[488]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[489]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[490]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[491]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[492]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[493]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[494]" -type "float2" 0.0034981472 -0.22621387 ;
	setAttr ".uvtk[495]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[496]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[497]" -type "float2" 0.0034981547 -0.22621387 ;
	setAttr ".uvtk[500]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[501]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[734]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[735]" -type "float2" -0.05387646 -0.23135196 ;
	setAttr ".uvtk[736]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[737]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[738]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[739]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[740]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[741]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[742]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[743]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[744]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[745]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[746]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[747]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[748]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[749]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[750]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[751]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[752]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[757]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[758]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[759]" -type "float2" -0.053876489 -0.23135194 ;
	setAttr ".uvtk[760]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[765]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[766]" -type "float2" -0.053876489 -0.23135196 ;
	setAttr ".uvtk[773]" -type "float2" -0.053876489 -0.23135196 ;
createNode polyMapCut -n "polyMapCut6";
	rename -uid "68757248-42E6-7EC6-A200-12A8356052CE";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 6 "e[41]" "e[47]" "e[103]" "e[495]" "e[527]" "e[905]";
createNode polyTweakUV -n "polyTweakUV20";
	rename -uid "344327B9-4EE3-9089-A75E-2097985F94D8";
	setAttr ".uopa" yes;
	setAttr -s 214 ".uvtk";
	setAttr ".uvtk[0]" -type "float2" 0.0053624213 -0.24535331 ;
	setAttr ".uvtk[1]" -type "float2" 0.029540926 -0.25327724 ;
	setAttr ".uvtk[2]" -type "float2" 0.032899112 -0.2273021 ;
	setAttr ".uvtk[3]" -type "float2" 0.020597547 -0.23367167 ;
	setAttr ".uvtk[4]" -type "float2" -0.028739903 -0.24296764 ;
	setAttr ".uvtk[5]" -type "float2" -0.026634715 -0.24402432 ;
	setAttr ".uvtk[6]" -type "float2" -0.02706328 -0.26485968 ;
	setAttr ".uvtk[7]" -type "float2" -0.0235999 -0.26842761 ;
	setAttr ".uvtk[8]" -type "float2" 0.020565182 -0.22125185 ;
	setAttr ".uvtk[9]" -type "float2" 0.041444868 -0.233365 ;
	setAttr ".uvtk[10]" -type "float2" -0.054677792 -0.28540242 ;
	setAttr ".uvtk[11]" -type "float2" -0.0574909 -0.29518622 ;
	setAttr ".uvtk[12]" -type "float2" 0.013894588 -0.22592726 ;
	setAttr ".uvtk[13]" -type "float2" 0.013438046 -0.24619284 ;
	setAttr ".uvtk[14]" -type "float2" 0.0032149851 -0.25055572 ;
	setAttr ".uvtk[15]" -type "float2" -0.0038715303 -0.23624364 ;
	setAttr ".uvtk[16]" -type "float2" -0.027152866 -0.24464513 ;
	setAttr ".uvtk[17]" -type "float2" -0.0033796132 -0.24581781 ;
	setAttr ".uvtk[18]" -type "float2" -0.0019289553 -0.24564227 ;
	setAttr ".uvtk[19]" -type "float2" -0.020036548 -0.24765892 ;
	setAttr ".uvtk[20]" -type "float2" -0.026406676 -0.25140694 ;
	setAttr ".uvtk[21]" -type "float2" -0.024404258 -0.24613175 ;
	setAttr ".uvtk[22]" -type "float2" -0.037508901 -0.25039798 ;
	setAttr ".uvtk[23]" -type "float2" -0.033011362 -0.24970897 ;
	setAttr ".uvtk[24]" -type "float2" -0.028052025 -0.25383645 ;
	setAttr ".uvtk[25]" -type "float2" -0.01682505 -0.26314539 ;
	setAttr ".uvtk[26]" -type "float2" -0.024790078 -0.25791252 ;
	setAttr ".uvtk[27]" -type "float2" -0.028863065 -0.25231668 ;
	setAttr ".uvtk[28]" -type "float2" -0.049692899 -0.23708242 ;
	setAttr ".uvtk[29]" -type "float2" -0.039295912 -0.24473417 ;
	setAttr ".uvtk[30]" -type "float2" -0.0405856 -0.24605531 ;
	setAttr ".uvtk[31]" -type "float2" -0.048944898 -0.24065658 ;
	setAttr ".uvtk[32]" -type "float2" 0.0034741461 -0.23295243 ;
	setAttr ".uvtk[33]" -type "float2" 0.03539148 -0.22699143 ;
	setAttr ".uvtk[34]" -type "float2" 0.026563466 -0.22942194 ;
	setAttr ".uvtk[35]" -type "float2" 0.030472428 -0.24897507 ;
	setAttr ".uvtk[36]" -type "float2" -0.0020521283 -0.25601697 ;
	setAttr ".uvtk[37]" -type "float2" 0.0011506379 -0.25364742 ;
	setAttr ".uvtk[42]" -type "float2" 0.058712155 -0.24479324 ;
	setAttr ".uvtk[43]" -type "float2" -0.062590137 -0.26546836 ;
	setAttr ".uvtk[44]" -type "float2" -0.06965325 -0.27800882 ;
	setAttr ".uvtk[45]" -type "float2" -0.062634528 -0.22037667 ;
	setAttr ".uvtk[46]" -type "float2" 0.052943379 -0.21776968 ;
	setAttr ".uvtk[47]" -type "float2" 0.083141491 -0.25327981 ;
	setAttr ".uvtk[48]" -type "float2" 0.086914375 -0.24480572 ;
	setAttr ".uvtk[49]" -type "float2" 0.073278219 -0.23391515 ;
	setAttr ".uvtk[50]" -type "float2" -0.079839572 -0.25150973 ;
	setAttr ".uvtk[51]" -type "float2" -0.083784655 -0.25595784 ;
	setAttr ".uvtk[52]" -type "float2" -0.087448902 -0.27028537 ;
	setAttr ".uvtk[53]" -type "float2" -0.075049736 -0.26935381 ;
	setAttr ".uvtk[54]" -type "float2" -0.085175633 -0.24065679 ;
	setAttr ".uvtk[122]" -type "float2" 0.0019352436 -0.22584048 ;
	setAttr ".uvtk[123]" -type "float2" -0.020494193 -0.22355595 ;
	setAttr ".uvtk[124]" -type "float2" -0.018829703 -0.24100226 ;
	setAttr ".uvtk[125]" -type "float2" -0.0047245026 -0.23497385 ;
	setAttr ".uvtk[126]" -type "float2" -0.017114758 -0.24032149 ;
	setAttr ".uvtk[127]" -type "float2" -0.014473826 -0.23719093 ;
	setAttr ".uvtk[128]" -type "float2" -0.014224559 -0.24098781 ;
	setAttr ".uvtk[129]" -type "float2" -0.016049773 -0.23077962 ;
	setAttr ".uvtk[130]" -type "float2" -0.020766199 -0.24780291 ;
	setAttr ".uvtk[131]" -type "float2" -0.025672525 -0.24450329 ;
	setAttr ".uvtk[132]" -type "float2" -0.026473552 -0.24212125 ;
	setAttr ".uvtk[133]" -type "float2" -0.016125858 -0.24213365 ;
	setAttr ".uvtk[134]" -type "float2" -0.0058846772 -0.21621531 ;
	setAttr ".uvtk[135]" -type "float2" -0.02702418 -0.20354515 ;
	setAttr ".uvtk[136]" -type "float2" -0.026506543 -0.22963268 ;
	setAttr ".uvtk[137]" -type "float2" -0.02189666 -0.22541055 ;
	setAttr ".uvtk[138]" -type "float2" -0.025634795 -0.21133566 ;
	setAttr ".uvtk[139]" -type "float2" -0.032371759 -0.22312579 ;
	setAttr ".uvtk[140]" -type "float2" -0.043734103 -0.21315432 ;
	setAttr ".uvtk[141]" -type "float2" -0.027533531 -0.19452608 ;
	setAttr ".uvtk[170]" -type "float2" -0.12393546 0.12095338 ;
	setAttr ".uvtk[171]" -type "float2" -0.12616664 0.13021967 ;
	setAttr ".uvtk[172]" -type "float2" -0.13914335 0.12756537 ;
	setAttr ".uvtk[173]" -type "float2" -0.13285112 0.10708734 ;
	setAttr ".uvtk[184]" -type "float2" -0.14907682 0.15473537 ;
	setAttr ".uvtk[185]" -type "float2" -0.15006983 0.15955308 ;
	setAttr ".uvtk[186]" -type "float2" -0.14262331 0.15955201 ;
	setAttr ".uvtk[187]" -type "float2" -0.15324908 0.1658656 ;
	setAttr ".uvtk[196]" -type "float2" -0.12981486 0.1101979 ;
	setAttr ".uvtk[197]" -type "float2" -0.12984094 0.093517408 ;
	setAttr ".uvtk[198]" -type "float2" -0.12425488 0.093893133 ;
	setAttr ".uvtk[199]" -type "float2" -0.12338281 0.10807209 ;
	setAttr ".uvtk[200]" -type "float2" -0.10622779 0.086455278 ;
	setAttr ".uvtk[201]" -type "float2" -0.10248522 0.094948702 ;
	setAttr ".uvtk[202]" -type "float2" -0.087705925 0.10724691 ;
	setAttr ".uvtk[204]" -type "float2" -0.11843044 0.12080763 ;
	setAttr ".uvtk[205]" -type "float2" -0.095280245 0.1062949 ;
	setAttr ".uvtk[206]" -type "float2" -0.18949723 0.16206598 ;
	setAttr ".uvtk[207]" -type "float2" -0.20345408 0.14224583 ;
	setAttr ".uvtk[208]" -type "float2" -0.20088339 0.13894331 ;
	setAttr ".uvtk[209]" -type "float2" -0.18154323 0.15349528 ;
	setAttr ".uvtk[228]" -type "float2" -0.1629886 0.17123325 ;
	setAttr ".uvtk[229]" -type "float2" -0.16249496 0.16863032 ;
	setAttr ".uvtk[230]" -type "float2" -0.15724653 0.16789214 ;
	setAttr ".uvtk[231]" -type "float2" -0.15628505 0.17222433 ;
	setAttr ".uvtk[239]" -type "float2" -0.18400276 0.061143812 ;
	setAttr ".uvtk[240]" -type "float2" -0.19772699 0.079215877 ;
	setAttr ".uvtk[241]" -type "float2" -0.20387483 0.062148791 ;
	setAttr ".uvtk[242]" -type "float2" -0.186286 0.044171453 ;
	setAttr ".uvtk[243]" -type "float2" -0.17057037 0.092805773 ;
	setAttr ".uvtk[244]" -type "float2" -0.14946446 0.06193006 ;
	setAttr ".uvtk[245]" -type "float2" -0.14981884 0.098946199 ;
	setAttr ".uvtk[246]" -type "float2" -0.19317287 0.10004584 ;
	setAttr ".uvtk[247]" -type "float2" -0.14667979 0.049369402 ;
	setAttr ".uvtk[248]" -type "float2" -0.13264847 0.05603268 ;
	setAttr ".uvtk[249]" -type "float2" -0.12950921 0.062151067 ;
	setAttr ".uvtk[250]" -type "float2" -0.13723484 0.083215818 ;
	setAttr ".uvtk[251]" -type "float2" -0.13611576 0.081259869 ;
	setAttr ".uvtk[265]" -type "float2" -0.10803584 0.036013924 ;
	setAttr ".uvtk[266]" -type "float2" -0.094789684 0.043315105 ;
	setAttr ".uvtk[267]" -type "float2" -0.10645057 0.051500045 ;
	setAttr ".uvtk[268]" -type "float2" -0.14541233 0.13906299 ;
	setAttr ".uvtk[269]" -type "float2" -0.16589195 0.12712489 ;
	setAttr ".uvtk[270]" -type "float2" -0.15784192 0.15322706 ;
	setAttr ".uvtk[271]" -type "float2" -0.17184871 0.14017427 ;
	setAttr ".uvtk[272]" -type "float2" -0.19149899 0.11807798 ;
	setAttr ".uvtk[273]" -type "float2" -0.19156772 0.12884629 ;
	setAttr ".uvtk[274]" -type "float2" -0.17185658 0.16442364 ;
	setAttr ".uvtk[275]" -type "float2" -0.16637933 0.15923201 ;
	setAttr ".uvtk[276]" -type "float2" -0.11870551 0.054775946 ;
	setAttr ".uvtk[277]" -type "float2" -0.11673045 0.072083481 ;
	setAttr ".uvtk[278]" -type "float2" -0.12863386 0.075464532 ;
	setAttr ".uvtk[279]" -type "float2" -0.090487331 0.056652345 ;
	setAttr ".uvtk[280]" -type "float2" -0.10301287 0.069902226 ;
	setAttr ".uvtk[283]" -type "float2" -0.10115656 0.12045598 ;
	setAttr ".uvtk[284]" -type "float2" -0.10250813 0.12753445 ;
	setAttr ".uvtk[285]" -type "float2" -0.12300575 0.12861544 ;
	setAttr ".uvtk[286]" -type "float2" -0.11809599 0.12227403 ;
	setAttr ".uvtk[287]" -type "float2" -0.10364974 0.14830598 ;
	setAttr ".uvtk[288]" -type "float2" -0.12177902 0.15170228 ;
	setAttr ".uvtk[289]" -type "float2" -0.12400252 0.14239615 ;
	setAttr ".uvtk[290]" -type "float2" -0.10444093 0.13793172 ;
	setAttr ".uvtk[293]" -type "float2" -0.11635678 0.16437423 ;
	setAttr ".uvtk[294]" -type "float2" -0.12085097 0.16506889 ;
	setAttr ".uvtk[295]" -type "float2" -0.13257855 0.15463883 ;
	setAttr ".uvtk[296]" -type "float2" -0.12176496 0.15826851 ;
	setAttr ".uvtk[297]" -type "float2" -0.13050914 0.17578277 ;
	setAttr ".uvtk[298]" -type "float2" -0.14380836 0.16965541 ;
	setAttr ".uvtk[299]" -type "float2" -0.13898802 0.16260238 ;
	setAttr ".uvtk[300]" -type "float2" -0.12630647 0.16973284 ;
	setAttr ".uvtk[303]" -type "float2" -0.15280902 0.17872512 ;
	setAttr ".uvtk[304]" -type "float2" -0.1541273 0.17842416 ;
	setAttr ".uvtk[305]" -type "float2" -0.154127 0.17248851 ;
	setAttr ".uvtk[306]" -type "float2" -0.14762396 0.17156631 ;
	setAttr ".uvtk[307]" -type "float2" -0.156766 0.17814748 ;
	setAttr ".uvtk[308]" -type "float2" -0.15972131 0.17820662 ;
	setAttr ".uvtk[309]" -type "float2" -0.12002835 0.043501131 ;
	setAttr ".uvtk[469]" -type "float2" -0.047136337 -0.25884992 ;
	setAttr ".uvtk[470]" -type "float2" -0.047267474 -0.27646613 ;
	setAttr ".uvtk[471]" -type "float2" -0.029048748 -0.26247227 ;
	setAttr ".uvtk[473]" -type "float2" -0.038478129 -0.24716118 ;
	setAttr ".uvtk[474]" -type "float2" -0.0476114 -0.24428326 ;
	setAttr ".uvtk[475]" -type "float2" -0.029187083 -0.25245452 ;
	setAttr ".uvtk[476]" -type "float2" -0.026069492 -0.25128925 ;
	setAttr ".uvtk[477]" -type "float2" -0.0010611713 -0.24938928 ;
	setAttr ".uvtk[478]" -type "float2" 0.018432468 -0.23528245 ;
	setAttr ".uvtk[479]" -type "float2" 0.018941909 -0.24738406 ;
	setAttr ".uvtk[480]" -type "float2" -0.037803128 -0.24853906 ;
	setAttr ".uvtk[481]" -type "float2" -0.046422552 -0.24790722 ;
	setAttr ".uvtk[482]" -type "float2" -0.026135169 -0.24968565 ;
	setAttr ".uvtk[483]" -type "float2" -0.034365624 -0.24619114 ;
	setAttr ".uvtk[484]" -type "float2" -0.0065803826 -0.24552305 ;
	setAttr ".uvtk[485]" -type "float2" 0.0111835 -0.24147558 ;
	setAttr ".uvtk[486]" -type "float2" 0.013885468 -0.24639413 ;
	setAttr ".uvtk[487]" -type "float2" -0.081777722 -0.22598451 ;
	setAttr ".uvtk[488]" -type "float2" -0.076992124 -0.23290747 ;
	setAttr ".uvtk[489]" -type "float2" -0.0801204 -0.24117774 ;
	setAttr ".uvtk[490]" -type "float2" -0.080000676 -0.23527855 ;
	setAttr ".uvtk[491]" -type "float2" -0.086874455 -0.23043954 ;
	setAttr ".uvtk[492]" -type "float2" 0.090867057 -0.19854301 ;
	setAttr ".uvtk[493]" -type "float2" 0.085055634 -0.22389805 ;
	setAttr ".uvtk[494]" -type "float2" 0.095101386 -0.21311814 ;
	setAttr ".uvtk[495]" -type "float2" 0.090687245 -0.23735496 ;
	setAttr ".uvtk[496]" -type "float2" 0.096819147 -0.23098254 ;
	setAttr ".uvtk[497]" -type "float2" 0.057882488 -0.25073802 ;
	setAttr ".uvtk[498]" -type "float2" -0.12484267 -0.23324928 ;
	setAttr ".uvtk[499]" -type "float2" -0.12484264 -0.23324928 ;
	setAttr ".uvtk[510]" -type "float2" -0.17641279 -0.51464665 ;
	setAttr ".uvtk[511]" -type "float2" -0.1705896 -0.50680959 ;
	setAttr ".uvtk[512]" -type "float2" -0.17503759 -0.50401735 ;
	setAttr ".uvtk[513]" -type "float2" -0.18062815 -0.51310951 ;
	setAttr ".uvtk[514]" -type "float2" -0.17695472 -0.49172372 ;
	setAttr ".uvtk[515]" -type "float2" -0.17100969 -0.4960956 ;
	setAttr ".uvtk[516]" -type "float2" -0.16922209 -0.49093485 ;
	setAttr ".uvtk[517]" -type "float2" -0.1733816 -0.48761195 ;
	setAttr ".uvtk[518]" -type "float2" -0.18102291 -0.48843235 ;
	setAttr ".uvtk[519]" -type "float2" -0.18606117 -0.49686643 ;
	setAttr ".uvtk[520]" -type "float2" -0.18147185 -0.5001924 ;
	setAttr ".uvtk[521]" -type "float2" -0.17337945 -0.48425964 ;
	setAttr ".uvtk[522]" -type "float2" -0.16784295 -0.48767042 ;
	setAttr ".uvtk[523]" -type "float2" -0.16507462 -0.48937577 ;
	setAttr ".uvtk[524]" -type "float2" -0.19016603 -0.50502121 ;
	setAttr ".uvtk[525]" -type "float2" -0.18576947 -0.50918442 ;
	setAttr ".uvtk[526]" -type "float2" -0.18214223 -0.5154469 ;
	setAttr ".uvtk[527]" -type "float2" -0.17770848 -0.51710761 ;
	setAttr ".uvtk[528]" -type "float2" -0.19159499 -0.50730771 ;
	setAttr ".uvtk[529]" -type "float2" -0.18723419 -0.51151222 ;
	setAttr ".uvtk[539]" -type "float2" -0.16485426 -0.49674848 ;
	setAttr ".uvtk[541]" -type "float2" -0.17112449 -0.48564875 ;
	setAttr ".uvtk[767]" -type "float2" -0.13389874 0.15098743 ;
	setAttr ".uvtk[768]" -type "float2" -0.13344729 0.14826778 ;
	setAttr ".uvtk[769]" -type "float2" -0.13778776 0.13840398 ;
	setAttr ".uvtk[770]" -type "float2" -0.12653649 0.14221019 ;
	setAttr ".uvtk[771]" -type "float2" -0.12484267 -0.23324928 ;
	setAttr ".uvtk[772]" -type "float2" -0.11534505 0.11767668 ;
	setAttr ".uvtk[774]" -type "float2" -0.12484264 -0.23324928 ;
	setAttr ".uvtk[775]" -type "float2" 0.069381744 -0.21451014 ;
	setAttr ".uvtk[776]" -type "float2" 0.083449304 -0.20854408 ;
	setAttr ".uvtk[777]" -type "float2" 0.0031838715 -0.18074483 ;
	setAttr ".uvtk[778]" -type "float2" 0.03060019 -0.185799 ;
	setAttr ".uvtk[779]" -type "float2" -0.090972945 -0.22053522 ;
	setAttr ".uvtk[780]" -type "float2" -0.022006422 -0.17124483 ;
	setAttr ".uvtk[781]" -type "float2" -0.082764536 -0.24930769 ;
createNode polyMapSew -n "polyMapSew11";
	rename -uid "404ABAC3-4DDB-F97A-A13D-C9BFF424163B";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[288]" "e[291:292]";
createNode polyTweakUV -n "polyTweakUV21";
	rename -uid "AF1D67AF-49D5-5173-B31E-6D8009595E99";
	setAttr ".uopa" yes;
	setAttr -s 26 ".uvtk";
	setAttr ".uvtk[287]" -type "float2" -0.0020198924 7.3923729e-09 ;
	setAttr ".uvtk[511]" -type "float2" 0.0010377381 0.00017295466 ;
	setAttr ".uvtk[518]" -type "float2" -0.00034592114 -0.00034590866 ;
	setAttr ".uvtk[539]" -type "float2" 0.00086477026 0.0013836434 ;
	setAttr ".uvtk[550]" -type "float2" -0.2066589 -0.51619029 ;
	setAttr ".uvtk[551]" -type "float2" -0.20340168 -0.51121533 ;
	setAttr ".uvtk[552]" -type "float2" -0.20620674 -0.50967848 ;
	setAttr ".uvtk[553]" -type "float2" -0.20927709 -0.51540804 ;
	setAttr ".uvtk[554]" -type "float2" -0.20781642 -0.5022738 ;
	setAttr ".uvtk[555]" -type "float2" -0.20404416 -0.50471687 ;
	setAttr ".uvtk[556]" -type "float2" -0.20314384 -0.50151479 ;
	setAttr ".uvtk[557]" -type "float2" -0.20579261 -0.49964491 ;
	setAttr ".uvtk[558]" -type "float2" -0.21040857 -0.50041974 ;
	setAttr ".uvtk[559]" -type "float2" -0.21316689 -0.50572926 ;
	setAttr ".uvtk[560]" -type "float2" -0.21025664 -0.50758553 ;
	setAttr ".uvtk[561]" -type "float2" -0.20591241 -0.49760678 ;
	setAttr ".uvtk[562]" -type "float2" -0.20242333 -0.49948028 ;
	setAttr ".uvtk[563]" -type "float2" -0.20067871 -0.50041717 ;
	setAttr ".uvtk[564]" -type "float2" -0.21536785 -0.51083529 ;
	setAttr ".uvtk[565]" -type "float2" -0.21254456 -0.5132075 ;
	setAttr ".uvtk[566]" -type "float2" -0.21011317 -0.51688373 ;
	setAttr ".uvtk[567]" -type "float2" -0.20735765 -0.51773322 ;
	setAttr ".uvtk[568]" -type "float2" -0.21615404 -0.51227701 ;
	setAttr ".uvtk[569]" -type "float2" -0.21335095 -0.51467562 ;
	setAttr ".uvtk[579]" -type "float2" -0.20027834 -0.50489151 ;
	setAttr ".uvtk[581]" -type "float2" -0.20449138 -0.49836984 ;
createNode polyMapSew -n "polyMapSew12";
	rename -uid "A52E2CF1-4AB9-5BD5-3F84-D6BE3DF750D4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[278]" "e[282:283]";
createNode polyTweakUV -n "polyTweakUV22";
	rename -uid "F5F55489-45DE-AB3C-4027-E2A7E772C383";
	setAttr ".uopa" yes;
	setAttr -s 279 ".uvtk";
	setAttr ".uvtk[88]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[89]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[90]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[91]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[92]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[142]" -type "float2" -0.20095716 0.02070488 ;
	setAttr ".uvtk[143]" -type "float2" -0.20826094 0.021576479 ;
	setAttr ".uvtk[144]" -type "float2" -0.21211052 0.023672238 ;
	setAttr ".uvtk[145]" -type "float2" -0.20921661 0.026216999 ;
	setAttr ".uvtk[146]" -type "float2" -0.19799243 0.026818052 ;
	setAttr ".uvtk[147]" -type "float2" -0.18965802 0.023555472 ;
	setAttr ".uvtk[148]" -type "float2" -0.17453325 0.01292344 ;
	setAttr ".uvtk[149]" -type "float2" -0.19026145 0.016956579 ;
	setAttr ".uvtk[150]" -type "float2" -0.18659632 0.012800356 ;
	setAttr ".uvtk[151]" -type "float2" -0.16556443 -0.00054864073 ;
	setAttr ".uvtk[152]" -type "float2" -0.18561769 -0.005646864 ;
	setAttr ".uvtk[153]" -type "float2" -0.18607414 -0.0065826569 ;
	setAttr ".uvtk[154]" -type "float2" -0.18222913 -0.012814441 ;
	setAttr ".uvtk[155]" -type "float2" -0.18215744 -0.014594411 ;
	setAttr ".uvtk[156]" -type "float2" -0.23386867 0.023351803 ;
	setAttr ".uvtk[157]" -type "float2" -0.21987402 0.020592645 ;
	setAttr ".uvtk[158]" -type "float2" -0.2165124 0.022930637 ;
	setAttr ".uvtk[159]" -type "float2" -0.22581473 0.024678484 ;
	setAttr ".uvtk[160]" -type "float2" -0.21659376 0.020208314 ;
	setAttr ".uvtk[161]" -type "float2" -0.21726671 0.016675901 ;
	setAttr ".uvtk[162]" -type "float2" -0.27195266 0.008847734 ;
	setAttr ".uvtk[163]" -type "float2" -0.26976135 -0.004379252 ;
	setAttr ".uvtk[164]" -type "float2" -0.24939662 0.00015892601 ;
	setAttr ".uvtk[165]" -type "float2" -0.25145903 0.013354322 ;
	setAttr ".uvtk[170]" -type "float2" -0.002082142 0 ;
	setAttr ".uvtk[196]" -type "float2" -0.0013250109 0 ;
	setAttr ".uvtk[199]" -type "float2" -0.0013250109 0 ;
	setAttr ".uvtk[204]" -type "float2" -0.002082142 0 ;
	setAttr ".uvtk[283]" -type "float2" 0.00010583224 0 ;
	setAttr ".uvtk[284]" -type "float2" -0.00038230419 -0.0016554892 ;
	setAttr ".uvtk[285]" -type "float2" 9.9897385e-05 -4.4465065e-05 ;
	setAttr ".uvtk[287]" -type "float2" -0.00098993583 0 ;
	setAttr ".uvtk[289]" -type "float2" -7.6383352e-05 7.5697899e-06 ;
	setAttr ".uvtk[290]" -type "float2" -0.0009649694 -0.0013861954 ;
	setAttr ".uvtk[311]" -type "float2" -0.22376461 0.015667092 ;
	setAttr ".uvtk[312]" -type "float2" -0.2171447 0.017448615 ;
	setAttr ".uvtk[313]" -type "float2" -0.21152201 0.019696072 ;
	setAttr ".uvtk[314]" -type "float2" -0.20615263 0.022404209 ;
	setAttr ".uvtk[315]" -type "float2" -0.19914377 0.022871211 ;
	setAttr ".uvtk[316]" -type "float2" -0.19479093 0.017329585 ;
	setAttr ".uvtk[317]" -type "float2" -0.19291957 0.0083594527 ;
	setAttr ".uvtk[318]" -type "float2" -0.19158782 0.0074971523 ;
	setAttr ".uvtk[319]" -type "float2" -0.18312949 1.575565e-05 ;
	setAttr ".uvtk[320]" -type "float2" -0.19080462 -0.010142485 ;
	setAttr ".uvtk[321]" -type "float2" -0.19087489 -0.017835006 ;
	setAttr ".uvtk[322]" -type "float2" -0.22773716 0.013120731 ;
	setAttr ".uvtk[323]" -type "float2" -0.22871967 0.0048451629 ;
	setAttr ".uvtk[324]" -type "float2" -0.2265344 -0.0018171463 ;
	setAttr ".uvtk[325]" -type "float2" -0.22277649 0.00084807491 ;
	setAttr ".uvtk[326]" -type "float2" -0.22099309 0.0069097485 ;
	setAttr ".uvtk[327]" -type "float2" -0.22808614 0.012127241 ;
	setAttr ".uvtk[328]" -type "float2" -0.21932633 0.0097602215 ;
	setAttr ".uvtk[329]" -type "float2" -0.21877739 -0.0041577015 ;
	setAttr ".uvtk[330]" -type "float2" -0.22348127 -0.007110158 ;
	setAttr ".uvtk[331]" -type "float2" -0.22518121 -0.014390862 ;
	setAttr ".uvtk[332]" -type "float2" -0.2176609 -0.0059455428 ;
	setAttr ".uvtk[333]" -type "float2" -0.22058696 -0.017678246 ;
	setAttr ".uvtk[334]" -type "float2" -0.2154638 -0.016102538 ;
	setAttr ".uvtk[335]" -type "float2" -0.217168 -0.012810805 ;
	setAttr ".uvtk[336]" -type "float2" -0.22150479 -0.015134668 ;
	setAttr ".uvtk[337]" -type "float2" -0.21891212 -0.02088438 ;
	setAttr ".uvtk[338]" -type "float2" -0.21442088 -0.018383846 ;
	setAttr ".uvtk[339]" -type "float2" -0.21044163 -0.018969283 ;
	setAttr ".uvtk[340]" -type "float2" -0.21808711 -0.024982199 ;
	setAttr ".uvtk[341]" -type "float2" -0.21235786 -0.030438341 ;
	setAttr ".uvtk[342]" -type "float2" -0.20975594 -0.028666537 ;
	setAttr ".uvtk[343]" -type "float2" -0.23648179 -0.051977433 ;
	setAttr ".uvtk[344]" -type "float2" -0.24023892 -0.043653108 ;
	setAttr ".uvtk[345]" -type "float2" -0.24428688 -0.046951093 ;
	setAttr ".uvtk[346]" -type "float2" -0.24103403 -0.055331089 ;
	setAttr ".uvtk[347]" -type "float2" -0.20202473 -0.0082461629 ;
	setAttr ".uvtk[348]" -type "float2" -0.20689528 -0.0052136574 ;
	setAttr ".uvtk[349]" -type "float2" -0.21432452 -0.013485231 ;
	setAttr ".uvtk[350]" -type "float2" -0.19869521 -0.014066076 ;
	setAttr ".uvtk[351]" -type "float2" -0.22206946 -0.019224152 ;
	setAttr ".uvtk[352]" -type "float2" -0.23182644 -0.028019886 ;
	setAttr ".uvtk[353]" -type "float2" -0.23702951 -0.023539707 ;
	setAttr ".uvtk[354]" -type "float2" -0.2515054 -0.034318246 ;
	setAttr ".uvtk[355]" -type "float2" -0.24473307 -0.038514532 ;
	setAttr ".uvtk[356]" -type "float2" -0.24889143 -0.042333223 ;
	setAttr ".uvtk[357]" -type "float2" -0.24555205 -0.010199884 ;
	setAttr ".uvtk[358]" -type "float2" -0.26576081 -0.016293153 ;
	setAttr ".uvtk[359]" -type "float2" -0.26113349 -0.024661049 ;
	setAttr ".uvtk[360]" -type "float2" -0.26939639 -0.018032536 ;
	setAttr ".uvtk[361]" -type "float2" -0.26549205 -0.026762109 ;
	setAttr ".uvtk[362]" -type "float2" -0.24199215 -0.016099855 ;
	setAttr ".uvtk[363]" -type "float2" -0.2226437 -0.041351475 ;
	setAttr ".uvtk[364]" -type "float2" -0.22809887 -0.034061469 ;
	setAttr ".uvtk[365]" -type "float2" -0.26056889 -0.033678986 ;
	setAttr ".uvtk[366]" -type "float2" -0.25375286 -0.041375436 ;
	setAttr ".uvtk[367]" -type "float2" -0.27850056 0.0018093786 ;
	setAttr ".uvtk[368]" -type "float2" -0.27492401 -0.0059847627 ;
	setAttr ".uvtk[369]" -type "float2" -0.26998597 -0.011699596 ;
	setAttr ".uvtk[370]" -type "float2" -0.22099531 0.018516555 ;
	setAttr ".uvtk[371]" -type "float2" -0.21568985 0.010846755 ;
	setAttr ".uvtk[372]" -type "float2" -0.22279514 0.01969327 ;
	setAttr ".uvtk[373]" -type "float2" -0.19783005 -0.014909839 ;
	setAttr ".uvtk[374]" -type "float2" -0.27765039 0.0083351936 ;
	setAttr ".uvtk[375]" -type "float2" -0.2527048 -0.037415244 ;
	setAttr ".uvtk[376]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[377]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[378]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[379]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[380]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[381]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[382]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[383]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[384]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[385]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[386]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[387]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[388]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[389]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[390]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[391]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[392]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[393]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[394]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[395]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[396]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[397]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[398]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[399]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[400]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[401]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[402]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[403]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[404]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[405]" -type "float2" -0.51179481 -0.17449802 ;
	setAttr ".uvtk[406]" -type "float2" -0.54062486 -0.14798236 ;
	setAttr ".uvtk[407]" -type "float2" -0.55486256 -0.15950501 ;
	setAttr ".uvtk[408]" -type "float2" -0.5205003 -0.19053844 ;
	setAttr ".uvtk[409]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[410]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[411]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[412]" -type "float2" -0.55034721 -0.22595936 ;
	setAttr ".uvtk[413]" -type "float2" -0.56928414 -0.24942839 ;
	setAttr ".uvtk[414]" -type "float2" -0.53146994 -0.2876491 ;
	setAttr ".uvtk[415]" -type "float2" -0.50260758 -0.27106676 ;
	setAttr ".uvtk[416]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[417]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[418]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[419]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[420]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[421]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[422]" -type "float2" -0.53141022 -0.20249033 ;
	setAttr ".uvtk[423]" -type "float2" -0.50971878 -0.22204867 ;
	setAttr ".uvtk[424]" -type "float2" -0.48694646 -0.20936108 ;
	setAttr ".uvtk[425]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[426]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[427]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[428]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[429]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[430]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[431]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[432]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[433]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[434]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[435]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[436]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[437]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[438]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[439]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[440]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[441]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[442]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[443]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[444]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[445]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[446]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[447]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[448]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[449]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[450]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[451]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[452]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[453]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[454]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[455]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[456]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[457]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[458]" -type "float2" -0.50660193 -0.1799477 ;
	setAttr ".uvtk[459]" -type "float2" -0.6021511 -0.32888699 ;
	setAttr ".uvtk[460]" -type "float2" -0.62485278 -0.30464786 ;
	setAttr ".uvtk[461]" -type "float2" -0.63009423 -0.31126064 ;
	setAttr ".uvtk[462]" -type "float2" -0.46167636 -0.18677163 ;
	setAttr ".uvtk[463]" -type "float2" -0.48694909 -0.15982935 ;
	setAttr ".uvtk[464]" -type "float2" -0.5186938 -0.13537109 ;
	setAttr ".uvtk[465]" -type "float2" -0.49741936 -0.15205872 ;
	setAttr ".uvtk[466]" -type "float2" -0.56814897 -0.32127544 ;
	setAttr ".uvtk[467]" -type "float2" -0.5997265 -0.28159583 ;
	setAttr ".uvtk[468]" -type "float2" -0.20742045 0.0031787953 ;
	setAttr ".uvtk[472]" -type "float2" -0.17231186 -0.015081441 ;
	setAttr ".uvtk[550]" -type "float2" 0.00030479254 0 ;
	setAttr ".uvtk[551]" -type "float2" 0.0007225615 0 ;
	setAttr ".uvtk[552]" -type "float2" -0.0018725395 0.0025567561 ;
	setAttr ".uvtk[553]" -type "float2" -1.3649464e-05 -0.0013497472 ;
	setAttr ".uvtk[554]" -type "float2" -0.0033264756 0.0021496266 ;
	setAttr ".uvtk[555]" -type "float2" -0.0018975735 0.00081937015 ;
	setAttr ".uvtk[556]" -type "float2" -0.0013422072 0.0017331541 ;
	setAttr ".uvtk[557]" -type "float2" -0.0034633875 0.0027255565 ;
	setAttr ".uvtk[558]" -type "float2" -0.0037744641 -0.00013126433 ;
	setAttr ".uvtk[559]" -type "float2" -0.0037415922 0 ;
	setAttr ".uvtk[560]" -type "float2" -0.0018301904 0.0028033108 ;
	setAttr ".uvtk[561]" -type "float2" -0.0021671355 0.0036462992 ;
	setAttr ".uvtk[562]" -type "float2" -0.0017654002 0.0013932288 ;
	setAttr ".uvtk[563]" -type "float2" -0.0014060438 0.0030560941 ;
	setAttr ".uvtk[564]" -type "float2" -0.0017963166 0 ;
	setAttr ".uvtk[565]" -type "float2" -0.001354605 -0.0010897815 ;
	setAttr ".uvtk[579]" -type "float2" -0.0010367888 0 ;
	setAttr ".uvtk[581]" -type "float2" -0.0024191439 0.0012443215 ;
	setAttr ".uvtk[590]" -type "float2" -0.23956971 -0.51277918 ;
	setAttr ".uvtk[591]" -type "float2" -0.23867474 -0.50773573 ;
	setAttr ".uvtk[592]" -type "float2" -0.24141692 -0.50746846 ;
	setAttr ".uvtk[593]" -type "float2" -0.24190836 -0.51304632 ;
	setAttr ".uvtk[594]" -type "float2" -0.24519949 -0.50214881 ;
	setAttr ".uvtk[595]" -type "float2" -0.24138434 -0.50280637 ;
	setAttr ".uvtk[596]" -type "float2" -0.24175565 -0.49996531 ;
	setAttr ".uvtk[597]" -type "float2" -0.24448685 -0.4993813 ;
	setAttr ".uvtk[598]" -type "float2" -0.24788047 -0.50155818 ;
	setAttr ".uvtk[599]" -type "float2" -0.24826704 -0.50669771 ;
	setAttr ".uvtk[600]" -type "float2" -0.24533336 -0.50718236 ;
	setAttr ".uvtk[601]" -type "float2" -0.245272 -0.49780762 ;
	setAttr ".uvtk[602]" -type "float2" -0.24187399 -0.49810988 ;
	setAttr ".uvtk[603]" -type "float2" -0.2401749 -0.49826103 ;
	setAttr ".uvtk[604]" -type "float2" -0.24828108 -0.51148725 ;
	setAttr ".uvtk[605]" -type "float2" -0.24524157 -0.51240999 ;
	setAttr ".uvtk[606]" -type "float2" -0.24207078 -0.51449823 ;
	setAttr ".uvtk[607]" -type "float2" -0.23960064 -0.51423794 ;
	setAttr ".uvtk[608]" -type "float2" -0.24841551 -0.51289535 ;
	setAttr ".uvtk[609]" -type "float2" -0.24538307 -0.5138458 ;
	setAttr ".uvtk[619]" -type "float2" -0.23834257 -0.50166929 ;
	setAttr ".uvtk[621]" -type "float2" -0.24388804 -0.49793071 ;
	setAttr ".uvtk[671]" -type "float2" -0.56353384 -0.17352626 ;
	setAttr ".uvtk[672]" -type "float2" -0.57772833 -0.20003656 ;
	setAttr ".uvtk[673]" -type "float2" -0.59192258 -0.2265467 ;
	setAttr ".uvtk[674]" -type "float2" -0.61057109 -0.24570063 ;
	setAttr ".uvtk[675]" -type "float2" -0.63473737 -0.26152858 ;
	setAttr ".uvtk[676]" -type "float2" -0.64511544 -0.28301352 ;
	setAttr ".uvtk[677]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[679]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[680]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[684]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[685]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[686]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[687]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[688]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[689]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[690]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[691]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[692]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[693]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[694]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[695]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[696]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[697]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[698]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[699]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[700]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[701]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[702]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[703]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[704]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[705]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[706]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[707]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[708]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[709]" -type "float2" -0.47374511 -0.25448427 ;
	setAttr ".uvtk[710]" -type "float2" -0.45357525 -0.23956797 ;
	setAttr ".uvtk[711]" -type "float2" -0.44312632 -0.22260815 ;
	setAttr ".uvtk[712]" -type "float2" -0.20310542 0.019205824 ;
	setAttr ".uvtk[713]" -type "float2" -0.19837429 0.012095472 ;
	setAttr ".uvtk[731]" -type "float2" -0.24686597 -0.71798414 ;
	setAttr ".uvtk[732]" -type "float2" -0.24686597 -0.71798414 ;
createNode polyMapSew -n "polyMapSew13";
	rename -uid "8068F112-4E85-E422-274C-1E8D4331307E";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[165:166]" "e[628]";
createNode polyTweakUV -n "polyTweakUV23";
	rename -uid "4137D678-43ED-9548-9DD8-899C2E31CAB6";
	setAttr ".uopa" yes;
	setAttr -s 18 ".uvtk";
	setAttr ".uvtk[590]" -type "float2" 0.00047280587 0.0020054178 ;
	setAttr ".uvtk[591]" -type "float2" -0.0003301879 0.0021693604 ;
	setAttr ".uvtk[592]" -type "float2" -0.00038424932 0.0017318473 ;
	setAttr ".uvtk[593]" -type "float2" 0.00050588639 0.0016302661 ;
	setAttr ".uvtk[594]" -type "float2" -0.0012507217 0.0011487649 ;
	setAttr ".uvtk[595]" -type "float2" -0.001129814 0.0017562852 ;
	setAttr ".uvtk[596]" -type "float2" -0.001585789 0.0017085866 ;
	setAttr ".uvtk[597]" -type "float2" -0.0016904548 0.0012741433 ;
	setAttr ".uvtk[598]" -type "float2" -0.001356222 0.00072236813 ;
	setAttr ".uvtk[599]" -type "float2" -0.00053576432 0.00063936866 ;
	setAttr ".uvtk[600]" -type "float2" -0.00044614874 0.0011066095 ;
	setAttr ".uvtk[601]" -type "float2" -0.0019453838 0.0011550382 ;
	setAttr ".uvtk[602]" -type "float2" -0.0018830374 0.0016973213 ;
	setAttr ".uvtk[603]" -type "float2" -0.0018518642 0.001968463 ;
	setAttr ".uvtk[604]" -type "float2" 0.00023024477 0.00061737455 ;
	setAttr ".uvtk[605]" -type "float2" 0.00039037265 0.0010997251 ;
	setAttr ".uvtk[619]" -type "float2" -0.0012991505 0.0022474872 ;
	setAttr ".uvtk[621]" -type "float2" -0.0019199923 0.0013759034 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize70";
	rename -uid "07592AD4-419D-7588-0CE2-D990E05134D7";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 8 200 201 202 205 590 593
		 604 605 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV24";
	rename -uid "D817AD22-4EA0-7CCF-7477-7581E08EEBFB";
	setAttr ".uopa" yes;
	setAttr -s 22 ".uvtk";
	setAttr ".uvtk[629]" -type "float2" -0.149821 -0.50487405 ;
	setAttr ".uvtk[630]" -type "float2" -0.13844641 -0.49590552 ;
	setAttr ".uvtk[631]" -type "float2" -0.14373513 -0.49018419 ;
	setAttr ".uvtk[632]" -type "float2" -0.15526266 -0.50104034 ;
	setAttr ".uvtk[633]" -type "float2" -0.14171977 -0.47183564 ;
	setAttr ".uvtk[634]" -type "float2" -0.13489886 -0.48039907 ;
	setAttr ".uvtk[635]" -type "float2" -0.13034011 -0.4737004 ;
	setAttr ".uvtk[636]" -type "float2" -0.13501026 -0.46733081 ;
	setAttr ".uvtk[637]" -type "float2" -0.14627136 -0.46554652 ;
	setAttr ".uvtk[638]" -type "float2" -0.15675302 -0.47567403 ;
	setAttr ".uvtk[639]" -type "float2" -0.15146853 -0.4822146 ;
	setAttr ".uvtk[640]" -type "float2" -0.13370897 -0.46253064 ;
	setAttr ".uvtk[641]" -type "float2" -0.12710091 -0.46955937 ;
	setAttr ".uvtk[642]" -type "float2" -0.1237966 -0.47307384 ;
	setAttr ".uvtk[643]" -type "float2" -0.1657898 -0.4857631 ;
	setAttr ".uvtk[644]" -type "float2" -0.16110571 -0.49342799 ;
	setAttr ".uvtk[645]" -type "float2" -0.15833618 -0.50380135 ;
	setAttr ".uvtk[646]" -type "float2" -0.15262975 -0.50789678 ;
	setAttr ".uvtk[647]" -type "float2" -0.16872181 -0.4884842 ;
	setAttr ".uvtk[648]" -type "float2" -0.16410471 -0.49619439 ;
	setAttr ".uvtk[658]" -type "float2" -0.12633625 -0.48371786 ;
	setAttr ".uvtk[660]" -type "float2" -0.13101758 -0.4653933 ;
createNode polyMapSew -n "polyMapSew14";
	rename -uid "345B4F11-4CB5-6993-4CD0-32B24A866DD8";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[297]" "e[300:301]";
createNode Unfold3DOptimize -n "Unfold3DOptimize71";
	rename -uid "A14A8B01-4FCB-6AFC-A92D-DAA6801F07E2";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 18 208 211 230 231 232 233
		 276 277 305 306 307 308 309 310 632 638 643 644 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV25";
	rename -uid "EE9C2FCD-4034-D4DB-5459-2ABDF5836E69";
	setAttr ".uopa" yes;
	setAttr -s 115 ".uvtk";
	setAttr ".uvtk[168]" -type "float2" 0.12468888 -0.058378786 ;
	setAttr ".uvtk[169]" -type "float2" 0.12988211 -0.044464231 ;
	setAttr ".uvtk[170]" -type "float2" 0.11467476 -0.022938937 ;
	setAttr ".uvtk[171]" -type "float2" 0.088393107 -0.049332768 ;
	setAttr ".uvtk[176]" -type "float2" 0.12405731 -0.091606528 ;
	setAttr ".uvtk[177]" -type "float2" 0.14312145 -0.089445025 ;
	setAttr ".uvtk[178]" -type "float2" 0.13505813 -0.069091171 ;
	setAttr ".uvtk[179]" -type "float2" 0.12836154 -0.092536926 ;
	setAttr ".uvtk[180]" -type "float2" 0.086606219 -0.08737272 ;
	setAttr ".uvtk[181]" -type "float2" 0.099739328 -0.088431537 ;
	setAttr ".uvtk[182]" -type "float2" 0.10249396 -0.13460809 ;
	setAttr ".uvtk[183]" -type "float2" 0.12642421 -0.13994759 ;
	setAttr ".uvtk[184]" -type "float2" 0.14353418 -0.098572284 ;
	setAttr ".uvtk[185]" -type "float2" 0.13354805 -0.14084345 ;
	setAttr ".uvtk[190]" -type "float2" 0.091292277 -0.0905388 ;
	setAttr ".uvtk[191]" -type "float2" -0.0039885752 -0.086660117 ;
	setAttr ".uvtk[192]" -type "float2" -0.0085663348 -0.061255246 ;
	setAttr ".uvtk[193]" -type "float2" -0.030636981 -0.07402277 ;
	setAttr ".uvtk[194]" -type "float2" -0.020319209 -0.093942195 ;
	setAttr ".uvtk[195]" -type "float2" 0.069874123 -0.0042062402 ;
	setAttr ".uvtk[196]" -type "float2" 0.031877149 -0.0073881149 ;
	setAttr ".uvtk[197]" -type "float2" 0.031637866 -0.042996556 ;
	setAttr ".uvtk[212]" -type "float2" 0.060525998 -0.11198157 ;
	setAttr ".uvtk[213]" -type "float2" 0.059331112 -0.1115841 ;
	setAttr ".uvtk[214]" -type "float2" 0.065431789 -0.094886929 ;
	setAttr ".uvtk[215]" -type "float2" 0.05850362 -0.10002717 ;
	setAttr ".uvtk[216]" -type "float2" 0.058919869 -0.088367224 ;
	setAttr ".uvtk[217]" -type "float2" -0.0035694949 -0.097626388 ;
	setAttr ".uvtk[218]" -type "float2" 0.018387217 -0.10042438 ;
	setAttr ".uvtk[219]" -type "float2" 0.028500278 -0.088763446 ;
	setAttr ".uvtk[220]" -type "float2" 0.02739938 -0.099871457 ;
	setAttr ".uvtk[221]" -type "float2" -0.018087968 -0.10242289 ;
	setAttr ".uvtk[222]" -type "float2" 0.22104356 -0.062211245 ;
	setAttr ".uvtk[223]" -type "float2" 0.23137394 -0.045208931 ;
	setAttr ".uvtk[224]" -type "float2" 0.22007748 -0.040200889 ;
	setAttr ".uvtk[225]" -type "float2" 0.21127465 -0.056864023 ;
	setAttr ".uvtk[226]" -type "float2" 0.17300698 -0.046055734 ;
	setAttr ".uvtk[227]" -type "float2" 0.18546954 -0.02101928 ;
	setAttr ".uvtk[228]" -type "float2" 0.15065622 -0.0050658882 ;
	setAttr ".uvtk[229]" -type "float2" 0.13642374 -0.03108421 ;
	setAttr ".uvtk[234]" -type "float2" 0.16442636 0.010273442 ;
	setAttr ".uvtk[235]" -type "float2" 0.15547451 0.027919844 ;
	setAttr ".uvtk[236]" -type "float2" 0.13024558 0.012426272 ;
	setAttr ".uvtk[237]" -type "float2" 0.13982835 0.052372098 ;
	setAttr ".uvtk[238]" -type "float2" 0.08780618 0.080488078 ;
	setAttr ".uvtk[239]" -type "float2" 0.075355902 0.056597739 ;
	setAttr ".uvtk[240]" -type "float2" 0.10832883 0.029048145 ;
	setAttr ".uvtk[254]" -type "float2" 0.050201438 0.036215484 ;
	setAttr ".uvtk[255]" -type "float2" 0.14160654 -0.058603287 ;
	setAttr ".uvtk[256]" -type "float2" -0.010421529 -0.023575544 ;
	setAttr ".uvtk[257]" -type "float2" 0.14046732 -0.049146473 ;
	setAttr ".uvtk[258]" -type "float2" 0.023674626 0.031633005 ;
	setAttr ".uvtk[259]" -type "float2" -0.039057922 -0.028756589 ;
	setAttr ".uvtk[260]" -type "float2" -0.013774022 0.028446957 ;
	setAttr ".uvtk[261]" -type "float2" -0.043638717 0.025885686 ;
	setAttr ".uvtk[262]" -type "float2" 0.20744267 -0.029329747 ;
	setAttr ".uvtk[263]" -type "float2" 0.19368258 -0.052683175 ;
	setAttr ".uvtk[264]" -type "float2" 0.22092989 -0.023290068 ;
	setAttr ".uvtk[265]" -type "float2" 0.16702172 -0.069869012 ;
	setAttr ".uvtk[266]" -type "float2" 0.20178738 -0.075944662 ;
	setAttr ".uvtk[283]" -type "float2" 0.078863397 -0.13774228 ;
	setAttr ".uvtk[284]" -type "float2" 0.100024 -0.13608044 ;
	setAttr ".uvtk[293]" -type "float2" 0.040820915 -0.14440185 ;
	setAttr ".uvtk[294]" -type "float2" 0.062281005 -0.14090598 ;
	setAttr ".uvtk[303]" -type "float2" -0.0065356605 -0.13148379 ;
	setAttr ".uvtk[304]" -type "float2" 0.01485442 -0.13871551 ;
	setAttr ".uvtk[308]" -type "float2" 0.00014052758 0.00042158089 ;
	setAttr ".uvtk[312]" -type "float2" 0.19552651 -0.0055549443 ;
	setAttr ".uvtk[509]" -type "float2" 0.16772431 -0.36922228 ;
	setAttr ".uvtk[510]" -type "float2" 0.15758008 -0.36476392 ;
	setAttr ".uvtk[511]" -type "float2" 0.023954738 -0.11275905 ;
	setAttr ".uvtk[512]" -type "float2" 0.020141859 -0.1153034 ;
	setAttr ".uvtk[513]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[514]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[515]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[516]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[517]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[518]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[519]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[520]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[537]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[538]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[539]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[540]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[541]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[542]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[543]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[544]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[545]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[547]" -type "float2" -0.34182781 -0.67433304 ;
	setAttr ".uvtk[729]" -type "float2" 0.11248101 -0.13347501 ;
	setAttr ".uvtk[730]" -type "float2" 0.10615255 -0.08858484 ;
	setAttr ".uvtk[731]" -type "float2" 0.073807344 -0.14102459 ;
	setAttr ".uvtk[732]" -type "float2" 0.070820317 -0.13551766 ;
	setAttr ".uvtk[733]" -type "float2" 0.03401323 -0.14860958 ;
	setAttr ".uvtk[734]" -type "float2" 0.026627261 -0.13971165 ;
	setAttr ".uvtk[735]" -type "float2" -0.016506299 -0.1354472 ;
	setAttr ".uvtk[736]" -type "float2" 0.12626381 -0.14475307 ;
	setAttr ".uvtk[737]" -type "float2" 0.10272218 -0.13977987 ;
	setAttr ".uvtk[738]" -type "float2" 0.1008857 -0.14111042 ;
	setAttr ".uvtk[739]" -type "float2" 0.078329578 -0.14259568 ;
	setAttr ".uvtk[740]" -type "float2" 0.062600248 -0.14586109 ;
	setAttr ".uvtk[741]" -type "float2" 0.041876454 -0.14939818 ;
	setAttr ".uvtk[742]" -type "float2" 0.013942558 -0.14349505 ;
	setAttr ".uvtk[743]" -type "float2" -0.0080926232 -0.13617584 ;
	setAttr ".uvtk[744]" -type "float2" 0.21414217 -0.13604346 ;
	setAttr ".uvtk[745]" -type "float2" 0.21779194 -0.1452041 ;
	setAttr ".uvtk[746]" -type "float2" 0.16959432 -0.15705821 ;
	setAttr ".uvtk[747]" -type "float2" 0.16811708 -0.14757508 ;
	setAttr ".uvtk[752]" -type "float2" 0.11070977 -0.15554532 ;
	setAttr ".uvtk[753]" -type "float2" 0.11101763 -0.14647642 ;
	setAttr ".uvtk[754]" -type "float2" 0.074852273 -0.14386654 ;
	setAttr ".uvtk[755]" -type "float2" 0.037294198 -0.15689415 ;
	setAttr ".uvtk[760]" -type "float2" -0.044724744 -0.11630613 ;
	setAttr ".uvtk[761]" -type "float2" -0.043805253 -0.10933739 ;
createNode polyMapSew -n "polyMapSew15";
	rename -uid "2AD5DA43-4BBA-AFF5-C3D3-3EB013E742B3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[275]" "e[1077]";
createNode polyMapSew -n "polyMapSew16";
	rename -uid "0898DCDD-4767-A595-A9A7-5887E153F01F";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[294]";
createNode polyTweakUV -n "polyTweakUV26";
	rename -uid "102DC1A4-41E1-C800-426A-07870287A1E3";
	setAttr ".uopa" yes;
	setAttr -s 8 ".uvtk";
	setAttr ".uvtk[213]" -type "float2" 0.0048884456 0.0046440088 ;
	setAttr ".uvtk[511]" -type "float2" -0.0031732796 -0.0011539112 ;
	setAttr ".uvtk[512]" -type "float2" 0.002884798 0.00086544571 ;
	setAttr ".uvtk[731]" -type "float2" -0.0012221116 0.0039107469 ;
	setAttr ".uvtk[732]" -type "float2" -0.0029330757 0.00097769697 ;
	setAttr ".uvtk[752]" -type "float2" 0.0031774675 0.0021997946 ;
	setAttr ".uvtk[754]" -type "float2" -0.005132887 0.0017109442 ;
	setAttr ".uvtk[755]" -type "float2" -0.0014665388 0.0034219041 ;
createNode polyMapCut -n "polyMapCut7";
	rename -uid "AE46F760-4F2F-0615-AB33-D1AE866153CC";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[141]" "e[629]";
createNode polyMapSew -n "polyMapSew17";
	rename -uid "31A93664-4516-D5B8-CC3B-78BDDE7AD200";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[141]" "e[629]";
createNode Unfold3DOptimize -n "Unfold3DOptimize72";
	rename -uid "EDFC3433-42A5-7679-47AA-F2B5D21539B7";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 4 181 506 507 508 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV27";
	rename -uid "201F18B6-4D3E-A564-F7EF-01800F04EE9B";
	setAttr ".uopa" yes;
	setAttr -s 4 ".uvtk";
	setAttr ".uvtk[181]" -type "float2" 0.048727632 -0.028564485 ;
	setAttr ".uvtk[505]" -type "float2" 0.048727632 -0.028564485 ;
	setAttr ".uvtk[506]" -type "float2" 0.048727632 -0.028564485 ;
	setAttr ".uvtk[507]" -type "float2" 0.048727632 -0.028564485 ;
createNode polyMapSew -n "polyMapSew18";
	rename -uid "0C9AB6E4-40A8-AD80-6D8D-138FC6AC3364";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[305]";
createNode Unfold3DOptimize -n "Unfold3DOptimize73";
	rename -uid "82CCC509-495D-78B3-23C2-599F8912B72C";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 21 168 171 176 179 180 181
		 182 183 190 283 284 505 506 508 727 733 734 735
		 736 742 743 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize74";
	rename -uid "4D586FAC-42E3-DBDE-74F0-C6AF3D442A6B";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 21 176 177 179 180 181 182
		 183 184 185 190 284 505 506 507 726 732 733 734
		 740 741 742 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV28";
	rename -uid "278C66D3-40B2-BD23-745D-C2A2E50E0DCC";
	setAttr ".uopa" yes;
	setAttr -s 21 ".uvtk";
	setAttr ".uvtk[176]" -type "float2" 0.0032188296 -0.0042167008 ;
	setAttr ".uvtk[177]" -type "float2" 0.0049266815 -0.010503143 ;
	setAttr ".uvtk[179]" -type "float2" 0.0028259754 -0.0036098361 ;
	setAttr ".uvtk[180]" -type "float2" -0.0014158487 0.0045467019 ;
	setAttr ".uvtk[181]" -type "float2" -0.00063866377 0.0032981634 ;
	setAttr ".uvtk[182]" -type "float2" 0.018735647 -0.052267015 ;
	setAttr ".uvtk[183]" -type "float2" 0.014967263 -0.031378299 ;
	setAttr ".uvtk[184]" -type "float2" 0.0026302338 -0.013382375 ;
	setAttr ".uvtk[185]" -type "float2" 0.012120247 -0.029707611 ;
	setAttr ".uvtk[190]" -type "float2" -0.0078369379 0.0063144267 ;
	setAttr ".uvtk[284]" -type "float2" -0.00054061413 -0.002117902 ;
	setAttr ".uvtk[505]" -type "float2" -0.028340638 -0.0047913492 ;
	setAttr ".uvtk[506]" -type "float2" 0.01053822 -0.076642901 ;
	setAttr ".uvtk[507]" -type "float2" -0.022160053 -0.0067966878 ;
	setAttr ".uvtk[726]" -type "float2" -0.00080317259 0.0013287365 ;
	setAttr ".uvtk[732]" -type "float2" 0.014813006 -0.031574667 ;
	setAttr ".uvtk[733]" -type "float2" 0.015199184 -0.052245975 ;
	setAttr ".uvtk[734]" -type "float2" 0.00023633242 -0.0022199452 ;
	setAttr ".uvtk[740]" -type "float2" 0.010389209 -0.030855477 ;
	setAttr ".uvtk[741]" -type "float2" -0.0018230081 -0.035517335 ;
	setAttr ".uvtk[742]" -type "float2" 0.016174555 -0.025494039 ;
createNode polyMapSew -n "polyMapSew19";
	rename -uid "5493960A-4D0E-365B-69A8-F5AF43122A1F";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[1078]";
createNode polyTweakUV -n "polyTweakUV29";
	rename -uid "F94BD1D7-45EC-72CA-24CC-85805628DFF7";
	setAttr ".uopa" yes;
	setAttr -s 14 ".uvtk";
	setAttr ".uvtk[176]" -type "float2" 0.0028760592 0.0045865518 ;
	setAttr ".uvtk[177]" -type "float2" 0.0042614499 0.011157698 ;
	setAttr ".uvtk[179]" -type "float2" 0.0052933255 0.0049395007 ;
	setAttr ".uvtk[181]" -type "float2" 0.0032756487 -0.0013763267 ;
	setAttr ".uvtk[182]" -type "float2" 0.032675423 -0.0024776198 ;
	setAttr ".uvtk[183]" -type "float2" 0.033716694 0.0083015878 ;
	setAttr ".uvtk[184]" -type "float2" 0.0078106085 0.01118449 ;
	setAttr ".uvtk[185]" -type "float2" 0.034300409 0.01474548 ;
	setAttr ".uvtk[506]" -type "float2" 0.03016712 -0.0093970792 ;
	setAttr ".uvtk[726]" -type "float2" -0.019639211 -0.0020948583 ;
	setAttr ".uvtk[732]" -type "float2" 0.035725497 0.00788981 ;
	setAttr ".uvtk[733]" -type "float2" 0.036315426 -0.0026319064 ;
	setAttr ".uvtk[740]" -type "float2" 0.038532577 0.014166302 ;
	setAttr ".uvtk[741]" -type "float2" 0.037344001 -0.013946674 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize75";
	rename -uid "0CC7C7B1-47B2-5D55-CB9D-A682B698FB4F";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 5 180 181 190 505 507 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV30";
	rename -uid "D3B47A01-40A4-9BBA-EAB8-A9BE81F33D9D";
	setAttr ".uopa" yes;
	setAttr -s 6 ".uvtk";
	setAttr ".uvtk[284]" -type "float2" -0.0050786836 0.0003906725 ;
	setAttr ".uvtk[505]" -type "float2" 0.0027619838 0 ;
	setAttr ".uvtk[507]" -type "float2" -0.004296449 -0.00030686409 ;
	setAttr ".uvtk[726]" -type "float2" 0.0017579811 0.00019534315 ;
	setAttr ".uvtk[734]" -type "float2" -0.0050786836 0.0003906725 ;
	setAttr ".uvtk[741]" -type "float2" 0.00058597419 0.0048833648 ;
createNode polyMapSew -n "polyMapSew20";
	rename -uid "9BE14044-411E-4CB3-DFD4-9BB9F74100E6";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[1081]" "e[1102]";
createNode polyTweakUV -n "polyTweakUV31";
	rename -uid "998260E4-4AB8-CC51-88B1-FBA04580E860";
	setAttr ".uopa" yes;
	setAttr -s 93 ".uvtk";
	setAttr ".uvtk[168]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[169]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[170]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[171]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[176]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[177]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[178]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[179]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[180]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[181]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[182]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[183]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[184]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[185]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[190]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[191]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[192]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[193]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[194]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[195]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[196]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[197]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[212]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[213]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[214]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[215]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[216]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[217]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[218]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[219]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[220]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[221]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[222]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[223]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[224]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[225]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[226]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[227]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[228]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[229]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[234]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[235]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[236]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[237]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[238]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[239]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[240]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[254]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[255]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[256]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[257]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[258]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[259]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[260]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[261]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[262]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[263]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[264]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[265]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[266]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[283]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[284]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[293]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[294]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[303]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[304]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[312]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[505]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[506]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[507]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[508]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[509]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[726]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[727]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[728]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[729]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[730]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[731]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[732]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[733]" -type "float2" -1.1402223 -0.30259749 ;
	setAttr ".uvtk[734]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[735]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[736]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[737]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[738]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[739]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[740]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[741]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[745]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[746]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[747]" -type "float2" -1.1402223 -0.30259743 ;
	setAttr ".uvtk[748]" -type "float2" -1.1402223 -0.30259746 ;
	setAttr ".uvtk[753]" -type "float2" -1.1402223 -0.30259746 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize76";
	rename -uid "922A7CD6-4487-3F5E-139E-1B89FC60EFA7";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 4 284 726 734 745 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize77";
	rename -uid "167EBA46-40E6-08DD-07EC-F5A719AAD556";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 4 284 726 734 742 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize78";
	rename -uid "F2896171-4B65-D6FD-F678-BEB484BDC375";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 4 284 726 734 742 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV32";
	rename -uid "338DB0B5-48D2-8F61-1794-C5985C7EF4C4";
	setAttr ".uopa" yes;
	setAttr -s 4 ".uvtk";
	setAttr ".uvtk[284]" -type "float2" -0.0047877529 -0.055856865 ;
	setAttr ".uvtk[726]" -type "float2" 0.040536165 -0.060006171 ;
	setAttr ".uvtk[734]" -type "float2" -0.013724799 -0.064474761 ;
	setAttr ".uvtk[742]" -type "float2" 0.031599026 -0.091286048 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize79";
	rename -uid "608EFD02-4205-F6CA-FB22-FE8145E30A5A";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 4 283 284 734 735 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV33";
	rename -uid "CD61F9FD-4620-E5B7-45CB-BE9A19B95466";
	setAttr ".uopa" yes;
	setAttr -s 6 ".uvtk";
	setAttr ".uvtk[734]" -type "float2" 0 -0.0071640015 ;
	setAttr ".uvtk[735]" -type "float2" 0 -0.0053939223 ;
	setAttr ".uvtk[736]" -type "float2" 0 -0.0031681061 ;
	setAttr ".uvtk[737]" -type "float2" 0 -0.0018360615 ;
	setAttr ".uvtk[743]" -type "float2" 0 -0.00078070164 ;
	setAttr ".uvtk[744]" -type "float2" 0 -0.00053966045 ;
createNode polyMapSew -n "polyMapSew21";
	rename -uid "B6F2BF57-43DA-065B-EBC6-A28F9BEAF6FB";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[1089]" "e[1106]";
createNode polyTweakUV -n "polyTweakUV34";
	rename -uid "1A168DD0-4B17-8028-6332-80976C9B7F9C";
	setAttr ".uopa" yes;
	setAttr -s 94 ".uvtk";
	setAttr ".uvtk[168]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[169]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[170]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[171]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[176]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[177]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[178]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[179]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[180]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[181]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[182]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[183]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[184]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[185]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[190]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[191]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[192]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[193]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[194]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[195]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[196]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[197]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[212]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[213]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[214]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[215]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[216]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[217]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[218]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[219]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[220]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[221]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[222]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[223]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[224]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[225]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[226]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[227]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[228]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[229]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[234]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[235]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[236]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[237]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[238]" -type "float2" -0.0031575889 -0.10420052 ;
	setAttr ".uvtk[239]" -type "float2" -0.0031575889 -0.10420052 ;
	setAttr ".uvtk[240]" -type "float2" -0.0031575889 -0.10420052 ;
	setAttr ".uvtk[254]" -type "float2" -0.0031575889 -0.10420052 ;
	setAttr ".uvtk[255]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[256]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[257]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[258]" -type "float2" -0.0031575889 -0.10420052 ;
	setAttr ".uvtk[259]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[260]" -type "float2" -0.0031575889 -0.10420052 ;
	setAttr ".uvtk[261]" -type "float2" -0.0031575889 -0.10420052 ;
	setAttr ".uvtk[262]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[263]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[264]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[265]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[266]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[283]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[284]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[293]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[294]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[303]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[304]" -type "float2" -0.0031575889 -0.10420052 ;
	setAttr ".uvtk[312]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[505]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[506]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[507]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[508]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[509]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[726]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[727]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[728]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[729]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[730]" -type "float2" -0.0031575926 -0.10420052 ;
	setAttr ".uvtk[731]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[732]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[733]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[734]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[735]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[736]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[737]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[738]" -type "float2" -0.0031575889 -0.10420052 ;
	setAttr ".uvtk[739]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[740]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[741]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[742]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[743]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[744]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[745]" -type "float2" -0.0031575889 -0.10420055 ;
	setAttr ".uvtk[749]" -type "float2" -0.0031575889 -0.10420052 ;
	setAttr ".uvtk[750]" -type "float2" -0.0031575889 -0.10420055 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize80";
	rename -uid "858BEB99-4324-72ED-500F-D9B1F71ADAE8";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 4 304 730 738 749 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV35";
	rename -uid "75C165E4-4FC3-28F0-C8BE-C98DE2AE454D";
	setAttr ".uopa" yes;
	setAttr -s 4 ".uvtk";
	setAttr ".uvtk[304]" -type "float2" -0.11663633 -0.10402704 ;
	setAttr ".uvtk[730]" -type "float2" -0.056381062 -0.16751556 ;
	setAttr ".uvtk[738]" -type "float2" -0.13074498 -0.097560614 ;
	setAttr ".uvtk[746]" -type "float2" -0.10664271 -0.20543237 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize81";
	rename -uid "D62D6D8A-4B39-EA4E-10F0-74A061466D69";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 4 303 304 738 739 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize82";
	rename -uid "D6407CAF-4A4F-45DE-AD82-169B6219D281";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 8 303 304 730 731 738 739
		 746 747 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize83";
	rename -uid "1C8192CE-483D-C125-953A-8CB7C23FE40D";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 8 182 183 185 506 732 733
		 740 741 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize84";
	rename -uid "AAEA357E-402B-08D2-D892-4DB4A0C118B7";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 12 168 169 176 177 178 179
		 184 226 229 255 257 265 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV36";
	rename -uid "7C1CD97C-490D-7C5C-4176-CFB5C4DF2218";
	setAttr ".uopa" yes;
	setAttr -s 18 ".uvtk";
	setAttr ".uvtk[510]" -type "float2" -0.84975523 -0.78825408 ;
	setAttr ".uvtk[511]" -type "float2" -0.86216766 -0.79258889 ;
	setAttr ".uvtk[512]" -type "float2" -0.85612482 -0.81037021 ;
	setAttr ".uvtk[513]" -type "float2" -0.84280652 -0.80651057 ;
	setAttr ".uvtk[514]" -type "float2" -0.8764438 -0.82244903 ;
	setAttr ".uvtk[515]" -type "float2" -0.86589801 -0.81594896 ;
	setAttr ".uvtk[516]" -type "float2" -0.87129062 -0.7981053 ;
	setAttr ".uvtk[517]" -type "float2" -0.88184416 -0.80304945 ;
	setAttr ".uvtk[534]" -type "float2" -0.83332121 -0.82895458 ;
	setAttr ".uvtk[535]" -type "float2" -0.85013777 -0.82832235 ;
	setAttr ".uvtk[536]" -type "float2" -0.84454829 -0.83947521 ;
	setAttr ".uvtk[537]" -type "float2" -0.83351743 -0.84491044 ;
	setAttr ".uvtk[538]" -type "float2" -0.85136586 -0.84333068 ;
	setAttr ".uvtk[539]" -type "float2" -0.85858816 -0.83330315 ;
	setAttr ".uvtk[540]" -type "float2" -0.86787087 -0.84399384 ;
	setAttr ".uvtk[541]" -type "float2" -0.85233766 -0.85535192 ;
	setAttr ".uvtk[542]" -type "float2" -0.83979106 -0.84839141 ;
	setAttr ".uvtk[544]" -type "float2" -0.84722769 -0.85251689 ;
createNode polyMapSew -n "polyMapSew22";
	rename -uid "3517AC5B-44D7-55B3-C3B0-3A87F8D217C7";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 6 "e[637]" "e[668]" "e[1084]" "e[1087]" "e[1096]" "e[1104:1105]";
createNode polyTweakUV -n "polyTweakUV37";
	rename -uid "CE735A6A-4734-4F61-CE12-22AADD4DCE52";
	setAttr ".uopa" yes;
	setAttr -s 36 ".uvtk";
	setAttr ".uvtk[546]" -type "float2" -0.086618386 -0.058505382 ;
	setAttr ".uvtk[547]" -type "float2" -0.086618416 -0.058505382 ;
	setAttr ".uvtk[548]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[549]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[550]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[551]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[552]" -type "float2" -0.086618386 -0.058505382 ;
	setAttr ".uvtk[553]" -type "float2" -0.086618386 -0.058505382 ;
	setAttr ".uvtk[570]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[571]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[572]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[573]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[574]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[575]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[576]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[577]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[578]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[580]" -type "float2" -0.086618386 -0.058505412 ;
	setAttr ".uvtk[582]" -type "float2" -1.0377508 -1.4541019 ;
	setAttr ".uvtk[583]" -type "float2" -1.0512122 -1.461841 ;
	setAttr ".uvtk[584]" -type "float2" -1.0402067 -1.4811727 ;
	setAttr ".uvtk[585]" -type "float2" -1.0256208 -1.4737264 ;
	setAttr ".uvtk[586]" -type "float2" -1.0610796 -1.4997126 ;
	setAttr ".uvtk[587]" -type "float2" -1.050298 -1.4898223 ;
	setAttr ".uvtk[588]" -type "float2" -1.0605605 -1.4702739 ;
	setAttr ".uvtk[589]" -type "float2" -1.0716689 -1.478417 ;
	setAttr ".uvtk[606]" -type "float2" -1.0096148 -1.4976424 ;
	setAttr ".uvtk[607]" -type "float2" -1.02926 -1.5006586 ;
	setAttr ".uvtk[608]" -type "float2" -1.0202903 -1.5123476 ;
	setAttr ".uvtk[609]" -type "float2" -1.0062845 -1.516192 ;
	setAttr ".uvtk[610]" -type "float2" -1.0273379 -1.5183396 ;
	setAttr ".uvtk[611]" -type "float2" -1.0379502 -1.50832 ;
	setAttr ".uvtk[612]" -type "float2" -1.0463327 -1.522789 ;
	setAttr ".uvtk[613]" -type "float2" -1.0257845 -1.5324988 ;
	setAttr ".uvtk[614]" -type "float2" -1.0127847 -1.5216275 ;
	setAttr ".uvtk[616]" -type "float2" -1.0204897 -1.528071 ;
createNode polyMapSew -n "polyMapSew23";
	rename -uid "2EAA970E-4EA4-79CA-BB51-C8AE3A073FEC";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[737]" "e[1079]" "e[1092]";
createNode polyTweakUV -n "polyTweakUV38";
	rename -uid "F0D4867B-42FA-8B4A-9860-A4BB7BE42EBC";
	setAttr ".uopa" yes;
	setAttr -s 36 ".uvtk";
	setAttr ".uvtk[546]" -type "float2" -1.0409803 -1.404186 ;
	setAttr ".uvtk[547]" -type "float2" -1.0484002 -1.4100089 ;
	setAttr ".uvtk[548]" -type "float2" -1.040391 -1.4206829 ;
	setAttr ".uvtk[549]" -type "float2" -1.0321727 -1.4150823 ;
	setAttr ".uvtk[550]" -type "float2" -1.0515492 -1.4334475 ;
	setAttr ".uvtk[551]" -type "float2" -1.0458095 -1.4266652 ;
	setAttr ".uvtk[552]" -type "float2" -1.0533901 -1.4158099 ;
	setAttr ".uvtk[553]" -type "float2" -1.0595562 -1.4214272 ;
	setAttr ".uvtk[570]" -type "float2" -1.0207021 -1.428267 ;
	setAttr ".uvtk[571]" -type "float2" -1.0323069 -1.4315856 ;
	setAttr ".uvtk[572]" -type "float2" -1.0260096 -1.4379423 ;
	setAttr ".uvtk[573]" -type "float2" -1.017278 -1.439188 ;
	setAttr ".uvtk[574]" -type "float2" -1.0297977 -1.4420907 ;
	setAttr ".uvtk[575]" -type "float2" -1.036957 -1.4368653 ;
	setAttr ".uvtk[576]" -type "float2" -1.0409009 -1.446223 ;
	setAttr ".uvtk[577]" -type "float2" -1.0277798 -1.4505022 ;
	setAttr ".uvtk[578]" -type "float2" -1.0207787 -1.4429597 ;
	setAttr ".uvtk[580]" -type "float2" -1.0249283 -1.4474304 ;
	setAttr ".uvtk[618]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[619]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[620]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[621]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[622]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[623]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[624]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[625]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[642]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[643]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[644]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[645]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[646]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[647]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[648]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[649]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[650]" -type "float2" -1.343044 -1.501622 ;
	setAttr ".uvtk[652]" -type "float2" -1.343044 -1.501622 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize85";
	rename -uid "FD94F73F-4A3B-A1D2-9099-A8A8CA1E2331";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 18 546 547 548 549 550 551
		 552 553 570 571 572 573 574 575 576 577 578 580 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize86";
	rename -uid "CD5BC200-488C-86BE-E290-4DA97B85A098";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 18 546 547 548 549 550 551
		 552 553 570 571 572 573 574 575 576 577 578 580 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV39";
	rename -uid "3C52FDDC-4E12-BAC4-08B2-74B87036C000";
	setAttr ".uopa" yes;
	setAttr -s 18 ".uvtk";
	setAttr ".uvtk[546]" -type "float2" -0.0017781854 0.0015005469 ;
	setAttr ".uvtk[547]" -type "float2" -0.00087451935 -0.0001309514 ;
	setAttr ".uvtk[548]" -type "float2" 0.00052762032 4.1425228e-05 ;
	setAttr ".uvtk[549]" -type "float2" 0.00076472759 0.001285851 ;
	setAttr ".uvtk[550]" -type "float2" -5.1259995e-05 0.00016468763 ;
	setAttr ".uvtk[551]" -type "float2" 0.00011247396 -0.00022572279 ;
	setAttr ".uvtk[552]" -type "float2" -4.8041344e-05 -0.00042062998 ;
	setAttr ".uvtk[553]" -type "float2" 0.00022792816 -0.00034713745 ;
	setAttr ".uvtk[570]" -type "float2" 0.00076681376 -0.0025628209 ;
	setAttr ".uvtk[571]" -type "float2" 0.0021005273 0.0010282993 ;
	setAttr ".uvtk[572]" -type "float2" 0.00031775236 -0.00025671721 ;
	setAttr ".uvtk[573]" -type "float2" -0.001042068 -0.0011888742 ;
	setAttr ".uvtk[574]" -type "float2" 9.6082687e-05 0.00074344873 ;
	setAttr ".uvtk[575]" -type "float2" -0.0001335144 0.0013227463 ;
	setAttr ".uvtk[576]" -type "float2" 0.00095289946 -0.00077843666 ;
	setAttr ".uvtk[577]" -type "float2" -5.6326389e-05 0.00075060129 ;
	setAttr ".uvtk[578]" -type "float2" -0.00096940994 -0.00083750486 ;
	setAttr ".uvtk[580]" -type "float2" -0.00091391802 -8.8751316e-05 ;
createNode polyMapSew -n "polyMapSew24";
	rename -uid "A71A56CE-4730-FEC7-AFF0-FBAD4B4ED829";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 6 "e[687]" "e[718]" "e[1080]" "e[1083]" "e[1094]" "e[1102:1103]";
createNode polyTweakUV -n "polyTweakUV40";
	rename -uid "787C58B0-43F3-1C80-1A4C-F889C47744DC";
	setAttr ".uopa" yes;
	setAttr -s 18 ".uvtk";
	setAttr ".uvtk[618]" -type "float2" 0.065291882 0.058692843 ;
	setAttr ".uvtk[619]" -type "float2" 0.056168851 0.062954813 ;
	setAttr ".uvtk[620]" -type "float2" 0.049897607 0.050111026 ;
	setAttr ".uvtk[621]" -type "float2" 0.059217568 0.045022517 ;
	setAttr ".uvtk[622]" -type "float2" 0.032338437 0.054510206 ;
	setAttr ".uvtk[623]" -type "float2" 0.041576501 0.052352577 ;
	setAttr ".uvtk[624]" -type "float2" 0.04823285 0.064882241 ;
	setAttr ".uvtk[625]" -type "float2" 0.039870735 0.067966245 ;
	setAttr ".uvtk[642]" -type "float2" 0.052262481 0.027707968 ;
	setAttr ".uvtk[643]" -type "float2" 0.043465015 0.037125021 ;
	setAttr ".uvtk[644]" -type "float2" 0.040484902 0.02804831 ;
	setAttr ".uvtk[645]" -type "float2" 0.043546733 0.01914278 ;
	setAttr ".uvtk[646]" -type "float2" 0.034699734 0.029631529 ;
	setAttr ".uvtk[647]" -type "float2" 0.03618538 0.038977653 ;
	setAttr ".uvtk[648]" -type "float2" 0.025372621 0.038176507 ;
	setAttr ".uvtk[649]" -type "float2" 0.027685519 0.023623262 ;
	setAttr ".uvtk[650]" -type "float2" 0.038259503 0.020636354 ;
	setAttr ".uvtk[652]" -type "float2" 0.031992134 0.022406731 ;
createNode polyMapSew -n "polyMapSew25";
	rename -uid "3CD44FFF-4796-030D-373D-69BF4A910147";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[296]" "e[787]" "e[818]" "e[1088:1089]" "e[1091]" "e[1098:1099]" "e[1106:1107]";
createNode polyTweakUV -n "polyTweakUV41";
	rename -uid "57168464-4712-0542-53ED-70BD148E700D";
	setAttr ".uopa" yes;
	setAttr -s 80 ".uvtk";
	setAttr ".uvtk[179]" -type "float2" -0.00047898293 0.00037229061 ;
	setAttr ".uvtk[180]" -type "float2" -0.00044435263 -0.0014580488 ;
	setAttr ".uvtk[181]" -type "float2" -0.0012202263 0.0010093451 ;
	setAttr ".uvtk[182]" -type "float2" -0.000775069 0.00011646748 ;
	setAttr ".uvtk[183]" -type "float2" 0.0024810731 0.0010656118 ;
	setAttr ".uvtk[184]" -type "float2" -0.00076791644 -8.803606e-05 ;
	setAttr ".uvtk[185]" -type "float2" 0.0025990903 0.0075415373 ;
	setAttr ".uvtk[190]" -type "float2" 0.00055074692 -0.0019977093 ;
	setAttr ".uvtk[212]" -type "float2" -0.00078934431 0.0016176105 ;
	setAttr ".uvtk[213]" -type "float2" -0.0073658228 -0.0033934116 ;
	setAttr ".uvtk[214]" -type "float2" -0.00098061562 -0.0024620295 ;
	setAttr ".uvtk[215]" -type "float2" -0.0011194348 -0.0017587543 ;
	setAttr ".uvtk[216]" -type "float2" -0.00083339214 -0.002476573 ;
	setAttr ".uvtk[220]" -type "float2" -0.0014939904 -0.001275599 ;
	setAttr ".uvtk[283]" -type "float2" -0.0005633831 -0.0099862814 ;
	setAttr ".uvtk[284]" -type "float2" 0.010244429 -0.011237562 ;
	setAttr ".uvtk[293]" -type "float2" -0.0031023026 0.001102984 ;
	setAttr ".uvtk[294]" -type "float2" -0.0030317307 0.00087058544 ;
	setAttr ".uvtk[505]" -type "float2" 0.0019937754 -0.001088798 ;
	setAttr ".uvtk[506]" -type "float2" -0.0017145276 0.0031169057 ;
	setAttr ".uvtk[507]" -type "float2" 0.006675303 -0.0037466288 ;
	setAttr ".uvtk[509]" -type "float2" -0.0042690635 -0.00089097023 ;
	setAttr ".uvtk[510]" -type "float2" 0.0047333837 0.0059646964 ;
	setAttr ".uvtk[511]" -type "float2" 0.0015130639 0.0051340461 ;
	setAttr ".uvtk[512]" -type "float2" 0.0055246949 0.0032400489 ;
	setAttr ".uvtk[513]" -type "float2" 0.0082839727 0.0052255392 ;
	setAttr ".uvtk[514]" -type "float2" -0.005533576 0.0056119561 ;
	setAttr ".uvtk[515]" -type "float2" -0.0050851703 0.0046884418 ;
	setAttr ".uvtk[516]" -type "float2" -0.0058295131 0.0056961179 ;
	setAttr ".uvtk[517]" -type "float2" -0.0034237504 0.0044686794 ;
	setAttr ".uvtk[534]" -type "float2" 0.0028277636 -0.0045291781 ;
	setAttr ".uvtk[535]" -type "float2" 0.007840395 -0.0027302504 ;
	setAttr ".uvtk[536]" -type "float2" 0.0033842921 -0.0077014565 ;
	setAttr ".uvtk[537]" -type "float2" 0.0013318062 -0.0081672668 ;
	setAttr ".uvtk[538]" -type "float2" -0.0023521781 -0.0071375966 ;
	setAttr ".uvtk[539]" -type "float2" -0.0043020248 -0.0018036366 ;
	setAttr ".uvtk[540]" -type "float2" -0.0024510026 -0.0054383278 ;
	setAttr ".uvtk[541]" -type "float2" -0.0045883656 -0.0052756071 ;
	setAttr ".uvtk[542]" -type "float2" 0.0010353327 -0.014448881 ;
	setAttr ".uvtk[544]" -type "float2" -0.00069653988 -0.012969851 ;
	setAttr ".uvtk[546]" -type "float2" 0.020103395 -0.0032919645 ;
	setAttr ".uvtk[547]" -type "float2" 0.01082778 -0.0018270016 ;
	setAttr ".uvtk[548]" -type "float2" 0.0072473288 -0.011350036 ;
	setAttr ".uvtk[549]" -type "float2" 0.017438591 -0.013055682 ;
	setAttr ".uvtk[550]" -type "float2" -0.011845052 -0.010138631 ;
	setAttr ".uvtk[551]" -type "float2" -0.0036284924 -0.010132194 ;
	setAttr ".uvtk[552]" -type "float2" -0.0014343262 -0.0011625886 ;
	setAttr ".uvtk[553]" -type "float2" -0.0084877014 -0.00280267 ;
	setAttr ".uvtk[570]" -type "float2" 0.013622642 -0.033653438 ;
	setAttr ".uvtk[571]" -type "float2" 0.0046292543 -0.029470682 ;
	setAttr ".uvtk[572]" -type "float2" 0.0035483837 -0.039444685 ;
	setAttr ".uvtk[573]" -type "float2" 0.0083158612 -0.04590714 ;
	setAttr ".uvtk[574]" -type "float2" -0.0039446354 -0.039252281 ;
	setAttr ".uvtk[575]" -type "float2" -0.0049917698 -0.028470159 ;
	setAttr ".uvtk[576]" -type "float2" -0.0144279 -0.031965375 ;
	setAttr ".uvtk[577]" -type "float2" -0.0096170902 -0.045050979 ;
	setAttr ".uvtk[578]" -type "float2" 0.0027763844 -0.048846662 ;
	setAttr ".uvtk[580]" -type "float2" -0.0041066408 -0.048428476 ;
	setAttr ".uvtk[582]" -type "float2" 0.0090668201 0.0075129271 ;
	setAttr ".uvtk[583]" -type "float2" 0.0063565373 0.0037692189 ;
	setAttr ".uvtk[584]" -type "float2" 0.0066902936 0.0042679906 ;
	setAttr ".uvtk[585]" -type "float2" 0.0095835328 0.0067631602 ;
	setAttr ".uvtk[586]" -type "float2" -0.0096205473 0.0073952079 ;
	setAttr ".uvtk[587]" -type "float2" -0.0074779093 0.0050778985 ;
	setAttr ".uvtk[588]" -type "float2" -0.0054990053 0.0038469434 ;
	setAttr ".uvtk[589]" -type "float2" -0.0055291653 0.0059463382 ;
	setAttr ".uvtk[606]" -type "float2" 0.0061533451 -0.0045523643 ;
	setAttr ".uvtk[607]" -type "float2" 0.010225773 -0.0020695329 ;
	setAttr ".uvtk[608]" -type "float2" 0.0061551929 -0.0081155896 ;
	setAttr ".uvtk[609]" -type "float2" 0.0048697293 -0.0091677904 ;
	setAttr ".uvtk[610]" -type "float2" -0.0022051334 -0.0084893703 ;
	setAttr ".uvtk[611]" -type "float2" -0.005941093 -0.0024003386 ;
	setAttr ".uvtk[612]" -type "float2" -0.0052380562 -0.0058183074 ;
	setAttr ".uvtk[613]" -type "float2" -0.0068415701 -0.0071767569 ;
	setAttr ".uvtk[614]" -type "float2" 0.0042807758 -0.016179562 ;
	setAttr ".uvtk[616]" -type "float2" 6.4581633e-05 -0.015082002 ;
	setAttr ".uvtk[726]" -type "float2" 0.014648974 -0.0041332841 ;
	setAttr ".uvtk[727]" -type "float2" -0.0039811134 -0.0067800283 ;
	setAttr ".uvtk[728]" -type "float2" -0.00048953295 0.0032096505 ;
	setAttr ".uvtk[729]" -type "float2" -0.002825737 0.0035280585 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize87";
	rename -uid "764FAFD6-4FC2-E687-C095-9D94953A1328";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 80 179 180 181 182 183 184
		 185 190 212 213 214 215 216 220 283 284 293 294
		 505 506 507 509 510 511 512 513 514 515 516 517
		 534 535 536 537 538 539 540 541 542 544 546 547
		 548 549 550 551 552 553 570 571 572 573 574 575
		 576 577 578 580 582 583 584 585 586 587 588 589
		 606 607 608 609 610 611 612 613 614 616 726 727
		 728 729 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize88";
	rename -uid "D579D26A-429D-26EB-353B-4EA8919B6D82";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 80 179 180 181 182 183 184
		 185 190 212 213 214 215 216 220 283 284 293 294
		 505 506 507 509 510 511 512 513 514 515 516 517
		 534 535 536 537 538 539 540 541 542 544 546 547
		 548 549 550 551 552 553 570 571 572 573 574 575
		 576 577 578 580 582 583 584 585 586 587 588 589
		 606 607 608 609 610 611 612 613 614 616 726 727
		 728 729 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize89";
	rename -uid "DBEDEE5E-4A11-3EE7-4303-228C75B7F39A";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 80 179 180 181 182 183 184
		 185 190 212 213 214 215 216 220 283 284 293 294
		 505 506 507 509 510 511 512 513 514 515 516 517
		 534 535 536 537 538 539 540 541 542 544 546 547
		 548 549 550 551 552 553 570 571 572 573 574 575
		 576 577 578 580 582 583 584 585 586 587 588 589
		 606 607 608 609 610 611 612 613 614 616 726 727
		 728 729 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode Unfold3DOptimize -n "Unfold3DOptimize90";
	rename -uid "47D6DFCE-4667-EF8D-706A-1C8FA36CCD35";
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|polySurface504|polySurface504Shape";
	setAttr ".uvl" -type "Int32Array" 80 179 180 181 182 183 184
		 185 190 212 213 214 215 216 220 283 284 293 294
		 505 506 507 509 510 511 512 513 514 515 516 517
		 534 535 536 537 538 539 540 541 542 544 546 547
		 548 549 550 551 552 553 570 571 572 573 574 575
		 576 577 578 580 582 583 584 585 586 587 588 589
		 606 607 608 609 610 611 612 613 614 616 726 727
		 728 729 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 0 ;
	setAttr ".mve" -type "floatArray" 0 ;
	setAttr ".miee" yes;
createNode polyTweakUV -n "polyTweakUV42";
	rename -uid "2A7E1C67-425B-1BE8-820A-7D891AC19485";
	setAttr ".uopa" yes;
	setAttr -s 29 ".uvtk";
	setAttr ".uvtk[513]" -type "float2" -0.0034915563 0 ;
	setAttr ".uvtk[548]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[549]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[550]" -type "float2" 0.0090580573 -0.00069498061 ;
	setAttr ".uvtk[551]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[570]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[571]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[572]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[573]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[574]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[575]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[576]" -type "float2" 0.010077047 0.0013899656 ;
	setAttr ".uvtk[577]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[578]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[580]" -type "float2" 0.0041698474 -0.00069498061 ;
	setAttr ".uvtk[584]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[585]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[586]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[587]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[606]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[607]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[608]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[609]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[610]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[611]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[612]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[613]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[614]" -type "float2" 0.0063289893 0 ;
	setAttr ".uvtk[616]" -type "float2" 0.0063289893 0 ;
createNode Unfold3DOptimize -n "Unfold3DOptimize93";
	rename -uid "F4E6EE0A-4A82-9827-6EC5-ABA808B33CD1";
	setAttr ".im" -type "mesh" 


		"v"	0

		"e"	0;
	setAttr ".bi" no;
	setAttr ".mdp" -type "string" "|group1|polySurface484|polySurfaceShape522";
	setAttr ".uvl" -type "Int32Array" 5 2 5 12 13 15 ;
	setAttr ".usn" -type "string" "map1";
	setAttr ".mue" -type "floatArray" 22 1.2675875 1.2563219 1.2566417 1.2655805
		 1.2616667 1.2522557 1.2460346 1.2471445 1.2594905 1.2594815 1.249439 1.249439 1.2400423
		 1.2397475 1.2807242 1.2727443 1.2325876 1.2347986 1.2938606 1.274099 1.2328429 1.2328429 ;
	setAttr ".mve" -type "floatArray" 22 0.39589393 0.45176318 0.44541824 0.39805496
		 0.40154696 0.44433138 0.40149897 0.3939845 0.39373398 0.39974695 0.45176318 0.45595318
		 0.44415355 0.43718222 0.39589393 0.4408775 0.40325093 0.39423496 0.39589393 0.45176318
		 0.45595321 0.45176318 ;
	setAttr ".miee" yes;
createNode shadingEngine -n "a:defaultMat";
	rename -uid "B87FD6D7-40D0-BC64-6D6A-818738F792FF";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "a:materialInfo1";
	rename -uid "A0284485-4EB5-D4D9-9EC4-DB9ED23B2744";
createNode file -n "a:defaultMat1F";
	rename -uid "A6DCFD63-457B-7735-1E37-20AA67359979";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/a.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "a:defaultMat1P2D";
	rename -uid "5257EAEE-4952-668A-70C8-7DB723A97043";
createNode groupId -n "a:groupId1";
	rename -uid "81268C88-4594-5098-9113-778B45FF4FA2";
	setAttr ".ihi" 0;
createNode shadingEngine -n "aa:defaultMat";
	rename -uid "1EF5DDF8-4D4C-AC6E-B790-23BD21CD5A3E";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "aa:materialInfo1";
	rename -uid "7CFEB2F8-4CA2-DA9C-CA7D-E1A3800182B6";
createNode file -n "aa:defaultMat1F";
	rename -uid "C6513506-4D63-4967-5CBC-4B9C6B422368";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/aa.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "aa:defaultMat1P2D";
	rename -uid "F2C8C2BD-445B-05C0-500C-3A9857148186";
createNode shadingEngine -n "b:defaultMat";
	rename -uid "E025CD83-4049-F7D8-9673-858172CE66FC";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "b:materialInfo1";
	rename -uid "7CEA0D79-4073-A02D-E25B-3791E9CEBA17";
createNode file -n "b:defaultMat1F";
	rename -uid "68145ECE-4C3C-0D96-69E5-6BAC4CC43097";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/b.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "b:defaultMat1P2D";
	rename -uid "44E90B36-4CE4-45A9-62EE-A18289F943A5";
createNode shadingEngine -n "a1:defaultMat";
	rename -uid "ADE0630E-49F8-80BC-DDE2-94B80C4987D5";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "a1:materialInfo1";
	rename -uid "C92C897E-4969-A3E0-C823-28BEA63913FF";
createNode file -n "a1:defaultMat1F";
	rename -uid "25178B24-45C3-49D8-CAC9-00A1E45ECAC0";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/a.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "a1:defaultMat1P2D";
	rename -uid "E270D2EE-4EC7-C94D-FCA4-72862C691A37";
createNode shadingEngine -n "aa1:defaultMat";
	rename -uid "9FFA07B4-4277-6B37-716A-EFAC2E6EC8D5";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "aa1:materialInfo1";
	rename -uid "528E8C35-497D-8C22-B910-97A6A28BF7E5";
createNode file -n "aa1:defaultMat1F";
	rename -uid "1D15D8FC-4D97-BD19-5BB5-60ABD36F12A2";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/aa.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "aa1:defaultMat1P2D";
	rename -uid "82102C78-43CB-0E9A-51AD-308C53736F9A";
createNode shadingEngine -n "b1:defaultMat";
	rename -uid "DBE9BCFA-4C70-720F-D0F7-5F961B78EDC5";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "b1:materialInfo1";
	rename -uid "3E70EFA0-4667-B620-E3C0-849F2724E0EF";
createNode file -n "b1:defaultMat1F";
	rename -uid "739E6182-4DCB-788C-AC19-A48955048ECC";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/b.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "b1:defaultMat1P2D";
	rename -uid "4AF8286B-4AB0-AFFE-0A25-0DA85F54AD7C";
createNode shadingEngine -n "blinn5SG";
	rename -uid "822D662A-4170-1402-4876-589101BF7775";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo6";
	rename -uid "B05A6196-4A58-0BCC-71AE-F886E7223F99";
createNode file -n "file10";
	rename -uid "C61DB4A3-41D3-5769-46DA-209D916E520D";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/pvz/zombie/a_normals.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture10";
	rename -uid "D9B75475-4FB0-40FC-3BD8-D09EAE85DA81";
createNode bump2d -n "bump2d4";
	rename -uid "FEFC09F5-4E39-1E3C-5CFE-28AE5D827BC5";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "file11";
	rename -uid "58BF1FE5-4760-1B88-74D3-F58F24F886CC";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/a_d.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture11";
	rename -uid "4582CEFE-444D-E92A-1F5A-A49D24B57CF5";
createNode shadingEngine -n "a2:defaultMat";
	rename -uid "701A9609-4173-0F06-E20F-33A72585ABAC";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "a2:materialInfo1";
	rename -uid "5DCD1A57-47DE-A1B2-5B55-97BC21915355";
createNode file -n "a2:defaultMat1F";
	rename -uid "684B2EE5-4C9D-A373-D571-1BA5B2666E80";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/a.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "a2:defaultMat1P2D";
	rename -uid "A4E0A5D5-45B6-1D9B-ADC5-C386A9A1C1E5";
createNode shadingEngine -n "blinn6SG";
	rename -uid "2222923C-4510-E41A-60D2-108511E86DDB";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo7";
	rename -uid "9D9ED794-4040-AACD-70D8-498DFFEBCE64";
createNode file -n "file12";
	rename -uid "60485892-4721-84E0-4D2E-3B9F60B8A7C7";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/Untitled-1.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture12";
	rename -uid "26861C68-4D6F-4E14-DE63-FCA63B2B7955";
createNode groupId -n "groupId4436";
	rename -uid "B2380767-4FDE-4B50-97B7-25AD9921D313";
	setAttr ".ihi" 0;
createNode shadingEngine -n "a3:blinn5SG";
	rename -uid "2D894ED3-42C1-3D30-20F4-D38C9D524DC6";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "a3:materialInfo1";
	rename -uid "53C2859B-408C-F785-BA8E-81859FAEF37C";
createNode file -n "a3:blinn5SG1F";
	rename -uid "96DAD7F2-45A9-BD73-FA9A-A5A09FB20193";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/a_d.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "a3:blinn5SG1P2D";
	rename -uid "2EBF5ECF-4653-6E5B-7D22-40A8A679D001";
createNode file -n "a3:blinn5SG1BM";
	rename -uid "08D2BF26-41A8-6B02-D38C-989321DC73AF";
	setAttr ".ftn" -type "string" "1";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "a3:blinn5SG1BMP2D";
	rename -uid "E4BE50A5-4E24-1E3B-DE24-FCBFB18F849F";
createNode bump2d -n "a3:blinn5SG1BMU";
	rename -uid "F8DCE54D-4340-86DC-9C02-E3998D13EF33";
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode shadingEngine -n "aa2:defaultMat";
	rename -uid "F07B6D29-444C-629D-713A-84AC9F47FA72";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "aa2:materialInfo1";
	rename -uid "67CB87CC-4511-B262-6F0E-7B81BA435F76";
createNode file -n "aa2:defaultMat1F";
	rename -uid "63398522-4209-D377-22BD-31A687C5CA4F";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/aa.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "aa2:defaultMat1P2D";
	rename -uid "C9D7E971-4193-B21D-BA25-DBA626AAAB96";
createNode shadingEngine -n "a4:defaultMat";
	rename -uid "F3F16145-453B-386C-EEEE-76B13F183B96";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "a4:materialInfo1";
	rename -uid "83F82376-48F6-A8BF-ED87-33B8564E03A3";
createNode file -n "a4:defaultMat1F";
	rename -uid "7E5A7277-49BF-34B6-4B75-24BA42F9107A";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/a.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "a4:defaultMat1P2D";
	rename -uid "4DED511A-434E-801B-3443-80910B8CAFE1";
createNode shadingEngine -n "aa3:defaultMat";
	rename -uid "20F4F6A4-4780-5EC1-0431-9E8EA6BA6A15";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "aa3:materialInfo1";
	rename -uid "FC4287AA-4903-5CBF-1E3F-86B6264EEF68";
createNode file -n "aa3:defaultMat1F";
	rename -uid "51B6B9E0-4A17-27B1-802A-A8A96331F993";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/aa.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "aa3:defaultMat1P2D";
	rename -uid "EE3DC568-4A28-EEBD-399B-49B0EA4CAE52";
createNode shadingEngine -n "a5:defaultMat";
	rename -uid "45F5C3E3-407D-5785-2C4E-308A245096F9";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "a5:materialInfo1";
	rename -uid "06AF3A02-4775-FC52-AA1E-02A36C22FD94";
createNode file -n "a5:defaultMat1F";
	rename -uid "5338A2A0-4EE7-E69A-C7F0-FFAB25B3BA8E";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/a.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "a5:defaultMat1P2D";
	rename -uid "D8C89706-46DA-D305-1F79-6C8DC457C6DE";
createNode shadingEngine -n "aa4:defaultMat";
	rename -uid "A483800B-4887-E6D5-630F-3CAD35F94FDB";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "aa4:materialInfo1";
	rename -uid "D53F598D-4233-4EF0-ABC2-169E15D6D003";
createNode file -n "aa4:defaultMat1F";
	rename -uid "9E5243E8-4DBB-CAEE-7BC6-C78788703B1F";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/aa.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "aa4:defaultMat1P2D";
	rename -uid "CACC12A0-4C2F-B62F-7BE0-4C9BDD3DE2F7";
createNode shadingEngine -n "a6:defaultMat";
	rename -uid "A273D420-458E-DCB2-EEE0-86AFCB11D43A";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "a6:materialInfo1";
	rename -uid "AA8985DB-44AB-9572-87E2-239ACE17B070";
createNode file -n "a6:defaultMat1F";
	rename -uid "C5FD1FAF-44A8-A732-BD70-1CA413A71A10";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/a.bmp";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "a6:defaultMat1P2D";
	rename -uid "33F24388-48E1-247F-6E5B-519EB7E52B9D";
createNode groupId -n "aa4:groupId3";
	rename -uid "F3E733FE-499E-F0BC-FEFD-C7B948469557";
	setAttr ".ihi" 0;
createNode blinn -n "blinn7";
	rename -uid "A1EA43C6-4768-DA43-3159-02A4BE11CFE1";
	setAttr ".ambc" -type "float3" 0.20512703 0.20512703 0.20512703 ;
createNode shadingEngine -n "blinn7SG";
	rename -uid "66816498-4E28-4E6A-7673-BCA1D06DA3A9";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo8";
	rename -uid "9962643E-4333-8E82-FD9B-A2910897C89C";
createNode file -n "file13";
	rename -uid "56C9C47E-448C-130A-1FCC-97BBDB81E4B3";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "E:/comando/180103/n.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture13";
	rename -uid "D6121B3F-419B-EB36-5606-258A7DD7917E";
createNode bump2d -n "bump2d5";
	rename -uid "A2BE1CAA-4F26-B0BE-3D44-428D15F4546E";
	setAttr ".bi" 1;
	setAttr ".vc1" -type "float3" 0 2.9999999e-05 0 ;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "file14";
	rename -uid "5DFFC290-4A94-161F-0FAB-90B957B54E38";
	setAttr ".ftn" -type "string" "E:/comando/180103/d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture14";
	rename -uid "3A914BE8-4E0F-C438-EFEE-BF871ED94868";
createNode shadingEngine -n "lambert4SG";
	rename -uid "3D618E08-48CF-59E6-2B4B-63B11427FBA1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo9";
	rename -uid "02687ACD-4267-0B3A-6655-A1B267EF374C";
createNode file -n "file15";
	rename -uid "BE05BA4C-4B7A-DA5E-4280-539EB6D02668";
	setAttr ".ftn" -type "string" "D:/pvz/zombie/aaaa.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode displayLayer -n "AdvancedSkeleton_defaultLayer";
	rename -uid "73D5891C-4476-CF8E-DEC5-BDAE94C46D0E";
createNode renderLayer -n "AdvancedSkeleton_defaultRenderLayer";
	rename -uid "2AAD895A-4C4F-459E-8349-07B1EC82D63D";
	setAttr ".g" yes;
createNode multiplyDivide -n "HeelFat";
	rename -uid "78F785FE-41D3-5C18-8ECE-C096F8A00400";
createNode multiplyDivide -n "FootSideInnerFat";
	rename -uid "6823A9A1-4C26-33FC-C0C3-228ED32CC5D5";
createNode multiplyDivide -n "FootSideOuterFat";
	rename -uid "78151D99-4EDB-4FAD-D548-9DADD06F9B18";
createNode multiplyDivide -n "ToesEndFat";
	rename -uid "EA081170-4CF2-7BAA-1B12-8A898770D851";
createNode multiplyDivide -n "ToesFat";
	rename -uid "4CFB7431-42F9-C4B4-58F5-D6AEBAAC6E5D";
createNode multiplyDivide -n "AnkleFat";
	rename -uid "8027FB27-4A5C-CAB3-B17C-B188BE58BC21";
createNode multiplyDivide -n "KneeFat";
	rename -uid "3643D8E1-4D72-132A-8D68-44ABBE05981F";
createNode multiplyDivide -n "HipFat";
	rename -uid "8F72A335-42E1-CDDD-8ED2-9E806D9CCAE3";
createNode multiplyDivide -n "MiddleFinger4Fat";
	rename -uid "99B6F08B-4178-0FB6-BA2C-EAB9F532A7E5";
createNode multiplyDivide -n "MiddleFinger3Fat";
	rename -uid "C72138CC-47C3-8869-D532-0682EA68A1F0";
createNode multiplyDivide -n "MiddleFinger2Fat";
	rename -uid "D156A5A3-4B2F-568A-4D2D-2F8341AC2A0A";
createNode multiplyDivide -n "MiddleFinger1Fat";
	rename -uid "DAAF146E-4287-C757-632C-468BA978C2A8";
createNode multiplyDivide -n "ThumbFinger4Fat";
	rename -uid "EA2D374E-4A13-BC17-ACED-FFA1CE20E306";
createNode multiplyDivide -n "ThumbFinger3Fat";
	rename -uid "B449AC4C-4DEC-31F4-7E0E-4E8DD5BBA389";
createNode multiplyDivide -n "ThumbFinger2Fat";
	rename -uid "49091328-4355-A833-7587-118D63EA71E8";
createNode multiplyDivide -n "ThumbFinger1Fat";
	rename -uid "A1D9900A-4170-9B0F-ADB0-D0B002E2797F";
createNode multiplyDivide -n "IndexFinger4Fat";
	rename -uid "35D7AD09-4340-ED23-6A9F-AA986DC8488E";
createNode multiplyDivide -n "IndexFinger3Fat";
	rename -uid "A67E7B50-44AF-5A1F-6BD8-99B0B2CAA726";
createNode multiplyDivide -n "IndexFinger2Fat";
	rename -uid "5DC678C9-42FA-7358-636E-E79DBC15F24D";
createNode multiplyDivide -n "IndexFinger1Fat";
	rename -uid "EC75A358-430F-6AEB-DDCC-B3A32D3CE5AD";
createNode multiplyDivide -n "PinkyFinger4Fat";
	rename -uid "53D56E5A-430F-9802-DCEF-5AB767F57FA1";
createNode multiplyDivide -n "PinkyFinger3Fat";
	rename -uid "C9FE0D9D-4731-2C7A-6E8C-24A17A5294EC";
createNode multiplyDivide -n "PinkyFinger2Fat";
	rename -uid "F5DB20A4-48A7-7A18-3F3E-2DBA341FBF52";
createNode multiplyDivide -n "PinkyFinger1Fat";
	rename -uid "EF35B8F5-4903-1ED5-A2F2-B188FF6533AC";
createNode multiplyDivide -n "RingFinger4Fat";
	rename -uid "76EF24D8-4A78-4891-2C9B-F28F1FD1235D";
createNode multiplyDivide -n "RingFinger3Fat";
	rename -uid "46CD21FE-412B-108C-B9B1-61BA77C414B8";
createNode multiplyDivide -n "RingFinger2Fat";
	rename -uid "80D410FB-4C69-8ADF-5D6F-8DBEB7E4BFAB";
createNode multiplyDivide -n "RingFinger1Fat";
	rename -uid "1A9A2B70-471A-60DF-023C-C6AA038D81DC";
createNode multiplyDivide -n "CupFat";
	rename -uid "4ECA3FE7-4A42-5F98-54C0-D9B9D8017819";
createNode multiplyDivide -n "WristFat";
	rename -uid "ECC8B152-4F52-7108-CBFD-69ADD99138BF";
createNode multiplyDivide -n "ElbowFat";
	rename -uid "3EE47BD0-4EDD-A925-3FD1-A79917DECEE0";
createNode multiplyDivide -n "ShoulderFat";
	rename -uid "219F90C1-4279-F1A4-A9BF-9CBAB7014D50";
createNode multiplyDivide -n "ScapulaFat";
	rename -uid "AB31EFF7-4A3D-59A5-21C8-3F87C9AD8BB8";
createNode multiplyDivide -n "EyeEndFat";
	rename -uid "895D8794-4A17-D36B-2CF8-818E0421E180";
createNode multiplyDivide -n "EyeFat";
	rename -uid "DE57D6EA-49A9-BBAB-A708-13B0A2BAF3AD";
createNode multiplyDivide -n "JawEndFat";
	rename -uid "A199CD05-4DB3-953D-717E-9CA0364033A3";
createNode multiplyDivide -n "joint5Fat";
	rename -uid "7E6D0388-4F12-3FFF-E836-61A403B7D277";
createNode multiplyDivide -n "joint4Fat";
	rename -uid "3D248E94-4E3D-6B67-1100-1EA9CD5F8691";
createNode multiplyDivide -n "joint3Fat";
	rename -uid "8CBF952A-4B52-52BC-2338-E8B40A29620A";
createNode multiplyDivide -n "joint2Fat";
	rename -uid "5781B150-459A-C48B-CF99-F387F2868862";
createNode multiplyDivide -n "joint1Fat";
	rename -uid "A197B827-475D-A62A-AFBC-E4824449FFDE";
createNode multiplyDivide -n "JawFat";
	rename -uid "05BE511B-4919-691C-D021-C398356AD9E3";
createNode multiplyDivide -n "HeadEndFat";
	rename -uid "02CB40B1-418A-63A2-5ED6-D99A6F4A4309";
createNode multiplyDivide -n "EyeEnd1Fat";
	rename -uid "475EA542-4241-38CE-5295-109C430595E4";
createNode multiplyDivide -n "Eye1Fat";
	rename -uid "F5F2A21D-4360-A44D-8DCE-85907F3613D1";
createNode multiplyDivide -n "joint6Fat";
	rename -uid "05D36C48-4B11-F66E-4985-29B8D55BC628";
createNode multiplyDivide -n "joint7Fat";
	rename -uid "7D4A2CAF-45FD-954E-7ED0-E19BC9132D11";
createNode multiplyDivide -n "joint8Fat";
	rename -uid "3A5235DA-45F8-63C1-69D1-97A5914B5D24";
createNode multiplyDivide -n "joint9Fat";
	rename -uid "1E5BA26B-42ED-7D02-66DE-D590CB011429";
createNode multiplyDivide -n "joint10Fat";
	rename -uid "E9E96154-4A94-AE52-C063-BD9953CDBA28";
createNode multiplyDivide -n "joint11Fat";
	rename -uid "4A7C4FD8-4A4C-91FF-5F71-2FAEB6A048A2";
createNode multiplyDivide -n "HeadFat";
	rename -uid "08457B20-4012-E4CF-AA4B-AEAB6D7E4790";
createNode multiplyDivide -n "NeckFat";
	rename -uid "A59EB839-4B91-4B72-1F26-F1A9DD9E7F1B";
createNode multiplyDivide -n "ChestFat";
	rename -uid "ED74BEE4-47E4-0AEE-0D67-E096EA15C0E2";
createNode multiplyDivide -n "Spine1Fat";
	rename -uid "9F22BC82-4E9C-EBAD-9419-A28368FEE063";
createNode multiplyDivide -n "RootFat";
	rename -uid "3F2F12D8-41AF-A64C-852D-5E8D8E981C44";
createNode displayLayer -n "jointLayer";
	rename -uid "B0B981FB-4F34-051B-8D74-F18C05264201";
createNode ramp -n "DynParticleRampdynjoint5_M4";
	rename -uid "37F65AE3-4C77-50D8-62F4-03BAAE68CAC4";
	setAttr -s 2 ".cel";
	setAttr ".cel[0].ep" 0;
	setAttr ".cel[0].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[2].ep" 1;
	setAttr ".cel[2].ec" -type "float3" 0 0 0 ;
createNode ramp -n "DynParticleRampdynjoint4_M3";
	rename -uid "51EA7039-4142-AF9A-8069-8589B0C26E39";
	setAttr -s 2 ".cel";
	setAttr ".cel[0].ep" 0;
	setAttr ".cel[0].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[2].ep" 1;
	setAttr ".cel[2].ec" -type "float3" 0 0 0 ;
createNode animLayer -n "BaseAnimation";
	rename -uid "D41451EE-47D2-649C-BD29-CD9D9E75EDC8";
	setAttr ".ovrd" yes;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 25 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 35 ".u";
select -ne :defaultRenderingList1;
	setAttr -s 3 ".r";
select -ne :defaultTextureList1;
	setAttr -s 32 ".tx";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "RootFat.oy" "Root.fatYabs";
connectAttr "RootFat.oz" "Root.fatZabs";
connectAttr "Root.s" "Hip.is";
connectAttr "HipFat.oy" "Hip.fatYabs";
connectAttr "HipFat.oz" "Hip.fatZabs";
connectAttr "Hip.s" "Knee.is";
connectAttr "KneeFat.oy" "Knee.fatYabs";
connectAttr "KneeFat.oz" "Knee.fatZabs";
connectAttr "Knee.s" "Ankle.is";
connectAttr "AnkleFat.oy" "Ankle.fatYabs";
connectAttr "AnkleFat.oz" "Ankle.fatZabs";
connectAttr "Ankle.s" "Heel.is";
connectAttr "HeelFat.oy" "Heel.fatYabs";
connectAttr "HeelFat.oz" "Heel.fatZabs";
connectAttr "Ankle.s" "Toes.is";
connectAttr "ToesFat.oy" "Toes.fatYabs";
connectAttr "ToesFat.oz" "Toes.fatZabs";
connectAttr "Toes.s" "FootSideInner.is";
connectAttr "FootSideInnerFat.oy" "FootSideInner.fatYabs";
connectAttr "FootSideInnerFat.oz" "FootSideInner.fatZabs";
connectAttr "Toes.s" "FootSideOuter.is";
connectAttr "FootSideOuterFat.oy" "FootSideOuter.fatYabs";
connectAttr "FootSideOuterFat.oz" "FootSideOuter.fatZabs";
connectAttr "Toes.s" "ToesEnd.is";
connectAttr "ToesEndFat.oy" "ToesEnd.fatYabs";
connectAttr "ToesEndFat.oz" "ToesEnd.fatZabs";
connectAttr "Root.s" "Spine1.is";
connectAttr "Spine1Fat.oy" "Spine1.fatYabs";
connectAttr "Spine1Fat.oz" "Spine1.fatZabs";
connectAttr "Spine1.s" "Chest.is";
connectAttr "ChestFat.oy" "Chest.fatYabs";
connectAttr "ChestFat.oz" "Chest.fatZabs";
connectAttr "Chest.s" "Scapula.is";
connectAttr "ScapulaFat.oy" "Scapula.fatYabs";
connectAttr "ScapulaFat.oz" "Scapula.fatZabs";
connectAttr "Scapula.s" "Shoulder.is";
connectAttr "ShoulderFat.oy" "Shoulder.fatYabs";
connectAttr "ShoulderFat.oz" "Shoulder.fatZabs";
connectAttr "Shoulder.s" "Elbow.is";
connectAttr "ElbowFat.oy" "Elbow.fatYabs";
connectAttr "ElbowFat.oz" "Elbow.fatZabs";
connectAttr "Elbow.s" "Wrist.is";
connectAttr "WristFat.oy" "Wrist.fatYabs";
connectAttr "WristFat.oz" "Wrist.fatZabs";
connectAttr "Wrist.s" "MiddleFinger1.is";
connectAttr "MiddleFinger1Fat.oy" "MiddleFinger1.fatYabs";
connectAttr "MiddleFinger1Fat.oz" "MiddleFinger1.fatZabs";
connectAttr "MiddleFinger1.s" "MiddleFinger2.is";
connectAttr "MiddleFinger2Fat.oy" "MiddleFinger2.fatYabs";
connectAttr "MiddleFinger2Fat.oz" "MiddleFinger2.fatZabs";
connectAttr "MiddleFinger2.s" "MiddleFinger3.is";
connectAttr "MiddleFinger3Fat.oy" "MiddleFinger3.fatYabs";
connectAttr "MiddleFinger3Fat.oz" "MiddleFinger3.fatZabs";
connectAttr "MiddleFinger3.s" "MiddleFinger4.is";
connectAttr "MiddleFinger4Fat.oy" "MiddleFinger4.fatYabs";
connectAttr "MiddleFinger4Fat.oz" "MiddleFinger4.fatZabs";
connectAttr "Wrist.s" "ThumbFinger1.is";
connectAttr "ThumbFinger1Fat.oy" "ThumbFinger1.fatYabs";
connectAttr "ThumbFinger1Fat.oz" "ThumbFinger1.fatZabs";
connectAttr "ThumbFinger1.s" "ThumbFinger2.is";
connectAttr "ThumbFinger2Fat.oy" "ThumbFinger2.fatYabs";
connectAttr "ThumbFinger2Fat.oz" "ThumbFinger2.fatZabs";
connectAttr "ThumbFinger2.s" "ThumbFinger3.is";
connectAttr "ThumbFinger3Fat.oy" "ThumbFinger3.fatYabs";
connectAttr "ThumbFinger3Fat.oz" "ThumbFinger3.fatZabs";
connectAttr "ThumbFinger3.s" "ThumbFinger4.is";
connectAttr "ThumbFinger4Fat.oy" "ThumbFinger4.fatYabs";
connectAttr "ThumbFinger4Fat.oz" "ThumbFinger4.fatZabs";
connectAttr "Wrist.s" "IndexFinger1.is";
connectAttr "IndexFinger1Fat.oy" "IndexFinger1.fatYabs";
connectAttr "IndexFinger1Fat.oz" "IndexFinger1.fatZabs";
connectAttr "IndexFinger1.s" "IndexFinger2.is";
connectAttr "IndexFinger2Fat.oy" "IndexFinger2.fatYabs";
connectAttr "IndexFinger2Fat.oz" "IndexFinger2.fatZabs";
connectAttr "IndexFinger2.s" "IndexFinger3.is";
connectAttr "IndexFinger3Fat.oy" "IndexFinger3.fatYabs";
connectAttr "IndexFinger3Fat.oz" "IndexFinger3.fatZabs";
connectAttr "IndexFinger3.s" "IndexFinger4.is";
connectAttr "IndexFinger4Fat.oy" "IndexFinger4.fatYabs";
connectAttr "IndexFinger4Fat.oz" "IndexFinger4.fatZabs";
connectAttr "Wrist.s" "Cup.is";
connectAttr "CupFat.oy" "Cup.fatYabs";
connectAttr "CupFat.oz" "Cup.fatZabs";
connectAttr "Cup.s" "PinkyFinger1.is";
connectAttr "PinkyFinger1Fat.oy" "PinkyFinger1.fatYabs";
connectAttr "PinkyFinger1Fat.oz" "PinkyFinger1.fatZabs";
connectAttr "PinkyFinger1.s" "PinkyFinger2.is";
connectAttr "PinkyFinger2Fat.oy" "PinkyFinger2.fatYabs";
connectAttr "PinkyFinger2Fat.oz" "PinkyFinger2.fatZabs";
connectAttr "PinkyFinger2.s" "PinkyFinger3.is";
connectAttr "PinkyFinger3Fat.oy" "PinkyFinger3.fatYabs";
connectAttr "PinkyFinger3Fat.oz" "PinkyFinger3.fatZabs";
connectAttr "PinkyFinger3.s" "PinkyFinger4.is";
connectAttr "PinkyFinger4Fat.oy" "PinkyFinger4.fatYabs";
connectAttr "PinkyFinger4Fat.oz" "PinkyFinger4.fatZabs";
connectAttr "Cup.s" "RingFinger1.is";
connectAttr "RingFinger1Fat.oy" "RingFinger1.fatYabs";
connectAttr "RingFinger1Fat.oz" "RingFinger1.fatZabs";
connectAttr "RingFinger1.s" "RingFinger2.is";
connectAttr "RingFinger2Fat.oy" "RingFinger2.fatYabs";
connectAttr "RingFinger2Fat.oz" "RingFinger2.fatZabs";
connectAttr "RingFinger2.s" "RingFinger3.is";
connectAttr "RingFinger3Fat.oy" "RingFinger3.fatYabs";
connectAttr "RingFinger3Fat.oz" "RingFinger3.fatZabs";
connectAttr "RingFinger3.s" "RingFinger4.is";
connectAttr "RingFinger4Fat.oy" "RingFinger4.fatYabs";
connectAttr "RingFinger4Fat.oz" "RingFinger4.fatZabs";
connectAttr "Chest.s" "Neck.is";
connectAttr "NeckFat.oy" "Neck.fatYabs";
connectAttr "NeckFat.oz" "Neck.fatZabs";
connectAttr "Neck.s" "Head.is";
connectAttr "HeadFat.oy" "Head.fatYabs";
connectAttr "HeadFat.oz" "Head.fatZabs";
connectAttr "Head.s" "Eye.is";
connectAttr "EyeFat.oy" "Eye.fatYabs";
connectAttr "EyeFat.oz" "Eye.fatZabs";
connectAttr "Eye.s" "EyeEnd.is";
connectAttr "EyeEndFat.oy" "EyeEnd.fatYabs";
connectAttr "EyeEndFat.oz" "EyeEnd.fatZabs";
connectAttr "Head.s" "Jaw.is";
connectAttr "JawFat.oy" "Jaw.fatYabs";
connectAttr "JawFat.oz" "Jaw.fatZabs";
connectAttr "Jaw.s" "JawEnd.is";
connectAttr "JawEndFat.oy" "JawEnd.fatYabs";
connectAttr "JawEndFat.oz" "JawEnd.fatZabs";
connectAttr "Jaw.s" "joint1.is";
connectAttr "joint1Fat.oy" "joint1.fatYabs";
connectAttr "joint1Fat.oz" "joint1.fatZabs";
connectAttr "joint1.s" "joint2.is";
connectAttr "joint2Fat.oy" "joint2.fatYabs";
connectAttr "joint2Fat.oz" "joint2.fatZabs";
connectAttr "joint2.s" "joint3.is";
connectAttr "joint3Fat.oy" "joint3.fatYabs";
connectAttr "joint3Fat.oz" "joint3.fatZabs";
connectAttr "joint3.s" "joint4.is";
connectAttr "joint4Fat.oy" "joint4.fatYabs";
connectAttr "joint4Fat.oz" "joint4.fatZabs";
connectAttr "joint4.s" "joint5.is";
connectAttr "joint5Fat.oy" "joint5.fatYabs";
connectAttr "joint5Fat.oz" "joint5.fatZabs";
connectAttr "Head.s" "HeadEnd.is";
connectAttr "HeadEndFat.oy" "HeadEnd.fatYabs";
connectAttr "HeadEndFat.oz" "HeadEnd.fatZabs";
connectAttr "Head.s" "Eye1.is";
connectAttr "Eye1Fat.oy" "Eye1.fatYabs";
connectAttr "Eye1Fat.oz" "Eye1.fatZabs";
connectAttr "Eye1.s" "EyeEnd1.is";
connectAttr "EyeEnd1Fat.oy" "EyeEnd1.fatYabs";
connectAttr "EyeEnd1Fat.oz" "EyeEnd1.fatZabs";
connectAttr "Head.s" "joint6.is";
connectAttr "joint6Fat.oy" "joint6.fatYabs";
connectAttr "joint6Fat.oz" "joint6.fatZabs";
connectAttr "Head.s" "joint7.is";
connectAttr "joint7Fat.oy" "joint7.fatYabs";
connectAttr "joint7Fat.oz" "joint7.fatZabs";
connectAttr "Head.s" "joint8.is";
connectAttr "joint8Fat.oy" "joint8.fatYabs";
connectAttr "joint8Fat.oz" "joint8.fatZabs";
connectAttr "Head.s" "joint9.is";
connectAttr "joint9Fat.oy" "joint9.fatYabs";
connectAttr "joint9Fat.oz" "joint9.fatZabs";
connectAttr "Head.s" "joint10.is";
connectAttr "joint10Fat.oy" "joint10.fatYabs";
connectAttr "joint10Fat.oz" "joint10.fatZabs";
connectAttr "Head.s" "joint11.is";
connectAttr "joint11Fat.oy" "joint11.fatYabs";
connectAttr "joint11Fat.oz" "joint11.fatZabs";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn4SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "a:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "aa:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "b:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "a1:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "aa1:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "b1:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn5SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "a2:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn6SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "a3:blinn5SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "aa2:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "a4:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "aa3:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "a5:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "aa4:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "a6:defaultMat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn7SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "a:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "aa:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "b:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "a1:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "aa1:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "b1:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn5SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "a2:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn6SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "a3:blinn5SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "aa2:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "a4:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "aa3:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "a5:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "aa4:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "a6:defaultMat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn7SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "AdvancedSkeleton_renderLayerManager.rlmi[0]" "AdvancedSkeleton_defaultRenderLayer1.rlid"
		;
connectAttr "blinn1SG.msg" "materialInfo1.sg";
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file1.ws";
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file2.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file2.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file2.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file2.ws";
connectAttr "file2.oa" "bump2d1.bv";
connectAttr "blinn2SG.msg" "materialInfo2.sg";
connectAttr "blinn3SG.msg" "materialInfo3.sg";
connectAttr "blinn4SG.msg" "materialInfo4.sg";
connectAttr "place2dTexture3.c" "file3.c";
connectAttr "place2dTexture3.tf" "file3.tf";
connectAttr "place2dTexture3.rf" "file3.rf";
connectAttr "place2dTexture3.mu" "file3.mu";
connectAttr "place2dTexture3.mv" "file3.mv";
connectAttr "place2dTexture3.s" "file3.s";
connectAttr "place2dTexture3.wu" "file3.wu";
connectAttr "place2dTexture3.wv" "file3.wv";
connectAttr "place2dTexture3.re" "file3.re";
connectAttr "place2dTexture3.of" "file3.of";
connectAttr "place2dTexture3.r" "file3.ro";
connectAttr "place2dTexture3.n" "file3.n";
connectAttr "place2dTexture3.vt1" "file3.vt1";
connectAttr "place2dTexture3.vt2" "file3.vt2";
connectAttr "place2dTexture3.vt3" "file3.vt3";
connectAttr "place2dTexture3.vc1" "file3.vc1";
connectAttr "place2dTexture3.o" "file3.uv";
connectAttr "place2dTexture3.ofs" "file3.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file3.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file3.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file3.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file3.ws";
connectAttr "place2dTexture4.c" "file4.c";
connectAttr "place2dTexture4.tf" "file4.tf";
connectAttr "place2dTexture4.rf" "file4.rf";
connectAttr "place2dTexture4.mu" "file4.mu";
connectAttr "place2dTexture4.mv" "file4.mv";
connectAttr "place2dTexture4.s" "file4.s";
connectAttr "place2dTexture4.wu" "file4.wu";
connectAttr "place2dTexture4.wv" "file4.wv";
connectAttr "place2dTexture4.re" "file4.re";
connectAttr "place2dTexture4.of" "file4.of";
connectAttr "place2dTexture4.r" "file4.ro";
connectAttr "place2dTexture4.n" "file4.n";
connectAttr "place2dTexture4.vt1" "file4.vt1";
connectAttr "place2dTexture4.vt2" "file4.vt2";
connectAttr "place2dTexture4.vt3" "file4.vt3";
connectAttr "place2dTexture4.vc1" "file4.vc1";
connectAttr "place2dTexture4.o" "file4.uv";
connectAttr "place2dTexture4.ofs" "file4.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file4.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file4.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file4.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file4.ws";
connectAttr "file4.oa" "bump2d2.bv";
connectAttr "place2dTexture5.c" "file5.c";
connectAttr "place2dTexture5.tf" "file5.tf";
connectAttr "place2dTexture5.rf" "file5.rf";
connectAttr "place2dTexture5.mu" "file5.mu";
connectAttr "place2dTexture5.mv" "file5.mv";
connectAttr "place2dTexture5.s" "file5.s";
connectAttr "place2dTexture5.wu" "file5.wu";
connectAttr "place2dTexture5.wv" "file5.wv";
connectAttr "place2dTexture5.re" "file5.re";
connectAttr "place2dTexture5.of" "file5.of";
connectAttr "place2dTexture5.r" "file5.ro";
connectAttr "place2dTexture5.n" "file5.n";
connectAttr "place2dTexture5.vt1" "file5.vt1";
connectAttr "place2dTexture5.vt2" "file5.vt2";
connectAttr "place2dTexture5.vt3" "file5.vt3";
connectAttr "place2dTexture5.vc1" "file5.vc1";
connectAttr "place2dTexture5.o" "file5.uv";
connectAttr "place2dTexture5.ofs" "file5.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file5.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file5.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file5.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file5.ws";
connectAttr "place2dTexture6.c" "file6.c";
connectAttr "place2dTexture6.tf" "file6.tf";
connectAttr "place2dTexture6.rf" "file6.rf";
connectAttr "place2dTexture6.mu" "file6.mu";
connectAttr "place2dTexture6.mv" "file6.mv";
connectAttr "place2dTexture6.s" "file6.s";
connectAttr "place2dTexture6.wu" "file6.wu";
connectAttr "place2dTexture6.wv" "file6.wv";
connectAttr "place2dTexture6.re" "file6.re";
connectAttr "place2dTexture6.of" "file6.of";
connectAttr "place2dTexture6.r" "file6.ro";
connectAttr "place2dTexture6.n" "file6.n";
connectAttr "place2dTexture6.vt1" "file6.vt1";
connectAttr "place2dTexture6.vt2" "file6.vt2";
connectAttr "place2dTexture6.vt3" "file6.vt3";
connectAttr "place2dTexture6.vc1" "file6.vc1";
connectAttr "place2dTexture6.o" "file6.uv";
connectAttr "place2dTexture6.ofs" "file6.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file6.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file6.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file6.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file6.ws";
connectAttr "file6.oa" "bump2d3.bv";
connectAttr "place2dTexture7.c" "file7.c";
connectAttr "place2dTexture7.tf" "file7.tf";
connectAttr "place2dTexture7.rf" "file7.rf";
connectAttr "place2dTexture7.mu" "file7.mu";
connectAttr "place2dTexture7.mv" "file7.mv";
connectAttr "place2dTexture7.s" "file7.s";
connectAttr "place2dTexture7.wu" "file7.wu";
connectAttr "place2dTexture7.wv" "file7.wv";
connectAttr "place2dTexture7.re" "file7.re";
connectAttr "place2dTexture7.of" "file7.of";
connectAttr "place2dTexture7.r" "file7.ro";
connectAttr "place2dTexture7.n" "file7.n";
connectAttr "place2dTexture7.vt1" "file7.vt1";
connectAttr "place2dTexture7.vt2" "file7.vt2";
connectAttr "place2dTexture7.vt3" "file7.vt3";
connectAttr "place2dTexture7.vc1" "file7.vc1";
connectAttr "place2dTexture7.o" "file7.uv";
connectAttr "place2dTexture7.ofs" "file7.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file7.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file7.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file7.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file7.ws";
connectAttr "lambert3SG.msg" "materialInfo5.sg";
connectAttr "place2dTexture8.c" "file8.c";
connectAttr "place2dTexture8.tf" "file8.tf";
connectAttr "place2dTexture8.rf" "file8.rf";
connectAttr "place2dTexture8.mu" "file8.mu";
connectAttr "place2dTexture8.mv" "file8.mv";
connectAttr "place2dTexture8.s" "file8.s";
connectAttr "place2dTexture8.wu" "file8.wu";
connectAttr "place2dTexture8.wv" "file8.wv";
connectAttr "place2dTexture8.re" "file8.re";
connectAttr "place2dTexture8.of" "file8.of";
connectAttr "place2dTexture8.r" "file8.ro";
connectAttr "place2dTexture8.n" "file8.n";
connectAttr "place2dTexture8.vt1" "file8.vt1";
connectAttr "place2dTexture8.vt2" "file8.vt2";
connectAttr "place2dTexture8.vt3" "file8.vt3";
connectAttr "place2dTexture8.vc1" "file8.vc1";
connectAttr "place2dTexture8.o" "file8.uv";
connectAttr "place2dTexture8.ofs" "file8.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file8.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file8.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file8.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file8.ws";
connectAttr "place2dTexture9.c" "file9.c";
connectAttr "place2dTexture9.tf" "file9.tf";
connectAttr "place2dTexture9.rf" "file9.rf";
connectAttr "place2dTexture9.mu" "file9.mu";
connectAttr "place2dTexture9.mv" "file9.mv";
connectAttr "place2dTexture9.s" "file9.s";
connectAttr "place2dTexture9.wu" "file9.wu";
connectAttr "place2dTexture9.wv" "file9.wv";
connectAttr "place2dTexture9.re" "file9.re";
connectAttr "place2dTexture9.of" "file9.of";
connectAttr "place2dTexture9.r" "file9.ro";
connectAttr "place2dTexture9.n" "file9.n";
connectAttr "place2dTexture9.vt1" "file9.vt1";
connectAttr "place2dTexture9.vt2" "file9.vt2";
connectAttr "place2dTexture9.vt3" "file9.vt3";
connectAttr "place2dTexture9.vc1" "file9.vc1";
connectAttr "place2dTexture9.o" "file9.uv";
connectAttr "place2dTexture9.ofs" "file9.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file9.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file9.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file9.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file9.ws";
connectAttr "Unfold3DOptimize2.om" "Unfold3DOptimize3.im";
connectAttr "Unfold3DOptimize3.om" "Unfold3DOptimize4.im";
connectAttr "Unfold3DOptimize4.om" "Unfold3DOptimize5.im";
connectAttr "Unfold3DOptimize5.om" "Unfold3DOptimize6.im";
connectAttr "Unfold3DOptimize6.om" "Unfold3DOptimize7.im";
connectAttr "Unfold3DOptimize7.om" "Unfold3DOptimize8.im";
connectAttr "Unfold3DOptimize8.om" "Unfold3DOptimize9.im";
connectAttr "Unfold3DOptimize9.om" "Unfold3DOptimize10.im";
connectAttr "Unfold3DOptimize10.om" "Unfold3DOptimize11.im";
connectAttr "Unfold3DOptimize11.om" "Unfold3DOptimize12.im";
connectAttr "Unfold3DOptimize12.om" "Unfold3DOptimize13.im";
connectAttr "Unfold3DOptimize13.om" "Unfold3DOptimize14.im";
connectAttr "Unfold3DOptimize14.om" "Unfold3DOptimize15.im";
connectAttr "Unfold3DOptimize15.om" "Unfold3DOptimize16.im";
connectAttr "Unfold3DOptimize16.om" "Unfold3DOptimize17.im";
connectAttr "Unfold3DOptimize17.om" "Unfold3DOptimize18.im";
connectAttr "Unfold3DOptimize18.om" "Unfold3DOptimize19.im";
connectAttr "Unfold3DOptimize19.om" "Unfold3DOptimize20.im";
connectAttr "Unfold3DOptimize20.om" "Unfold3DOptimize21.im";
connectAttr "Unfold3DOptimize21.om" "Unfold3DOptimize22.im";
connectAttr "Unfold3DOptimize22.om" "Unfold3DOptimize23.im";
connectAttr "Unfold3DOptimize23.om" "Unfold3DOptimize24.im";
connectAttr "Unfold3DOptimize24.om" "Unfold3DOptimize25.im";
connectAttr "Unfold3DOptimize25.om" "Unfold3DOptimize26.im";
connectAttr "Unfold3DOptimize26.om" "Unfold3DOptimize27.im";
connectAttr "Unfold3DOptimize27.om" "Unfold3DOptimize28.im";
connectAttr "Unfold3DOptimize28.om" "Unfold3DOptimize29.im";
connectAttr "Unfold3DOptimize29.om" "Unfold3DOptimize30.im";
connectAttr "Unfold3DOptimize30.om" "Unfold3DOptimize31.im";
connectAttr "Unfold3DOptimize31.om" "Unfold3DOptimize32.im";
connectAttr "Unfold3DOptimize32.om" "Unfold3DOptimize33.im";
connectAttr "Unfold3DOptimize33.om" "Unfold3DOptimize34.im";
connectAttr "Unfold3DOptimize34.om" "Unfold3DOptimize35.im";
connectAttr "Unfold3DOptimize35.om" "Unfold3DOptimize36.im";
connectAttr "Unfold3DOptimize36.om" "Unfold3DOptimize37.im";
connectAttr "Unfold3DOptimize37.om" "Unfold3DOptimize38.im";
connectAttr "Unfold3DOptimize38.om" "Unfold3DOptimize39.im";
connectAttr "Unfold3DOptimize39.om" "Unfold3DOptimize40.im";
connectAttr "Unfold3DOptimize40.om" "Unfold3DOptimize41.im";
connectAttr "Unfold3DOptimize41.om" "Unfold3DOptimize42.im";
connectAttr "Unfold3DOptimize42.om" "Unfold3DOptimize43.im";
connectAttr "Unfold3DOptimize43.om" "Unfold3DOptimize44.im";
connectAttr "Unfold3DOptimize44.om" "Unfold3DOptimize45.im";
connectAttr "Unfold3DOptimize45.om" "Unfold3DOptimize46.im";
connectAttr "Unfold3DOptimize46.om" "Unfold3DOptimize47.im";
connectAttr "Unfold3DOptimize47.om" "Unfold3DOptimize48.im";
connectAttr "Unfold3DOptimize48.om" "Unfold3DOptimize49.im";
connectAttr "Unfold3DOptimize49.om" "Unfold3DOptimize50.im";
connectAttr "Unfold3DOptimize50.om" "Unfold3DOptimize51.im";
connectAttr "Unfold3DOptimize51.om" "polyTweakUV6.ip";
connectAttr "polyTweakUV6.out" "polyMapSew4.ip";
connectAttr "polyMapSew4.out" "Unfold3DOptimize52.im";
connectAttr "Unfold3DOptimize52.om" "Unfold3DOptimize53.im";
connectAttr "Unfold3DOptimize53.om" "Unfold3DOptimize54.im";
connectAttr "Unfold3DOptimize54.om" "Unfold3DOptimize55.im";
connectAttr "Unfold3DOptimize55.om" "Unfold3DOptimize56.im";
connectAttr "Unfold3DOptimize56.om" "Unfold3DOptimize57.im";
connectAttr "Unfold3DOptimize57.om" "Unfold3DOptimize58.im";
connectAttr "Unfold3DOptimize58.om" "Unfold3DOptimize59.im";
connectAttr "Unfold3DOptimize59.om" "polyTweakUV7.ip";
connectAttr "polyTweakUV7.out" "polyMapSew5.ip";
connectAttr "polyMapSew5.out" "polyTweakUV8.ip";
connectAttr "polyTweakUV8.out" "polyMapCut4.ip";
connectAttr "polyMapCut4.out" "polyTweakUV9.ip";
connectAttr "polyTweakUV9.out" "Unfold3DOptimize60.im";
connectAttr "Unfold3DOptimize60.om" "polyTweakUV10.ip";
connectAttr "polyTweakUV10.out" "polyMapSew6.ip";
connectAttr "polyMapSew6.out" "Unfold3DOptimize61.im";
connectAttr "Unfold3DOptimize61.om" "Unfold3DOptimize62.im";
connectAttr "Unfold3DOptimize62.om" "Unfold3DOptimize63.im";
connectAttr "Unfold3DOptimize63.om" "Unfold3DOptimize64.im";
connectAttr "Unfold3DOptimize64.om" "Unfold3DOptimize65.im";
connectAttr "Unfold3DOptimize65.om" "polyTweakUV12.ip";
connectAttr "polyTweakUV12.out" "Unfold3DOptimize66.im";
connectAttr "Unfold3DOptimize66.om" "polyTweakUV13.ip";
connectAttr "polyTweakUV13.out" "Unfold3DOptimize67.im";
connectAttr "Unfold3DOptimize67.om" "polyTweakUV14.ip";
connectAttr "polyTweakUV14.out" "polyMapSew7.ip";
connectAttr "polyMapSew7.out" "polyMapSew8.ip";
connectAttr "polyMapSew8.out" "polyMapSew9.ip";
connectAttr "polyMapSew9.out" "polyTweakUV15.ip";
connectAttr "polyTweakUV15.out" "Unfold3DOptimize68.im";
connectAttr "Unfold3DOptimize68.om" "polyTweakUV16.ip";
connectAttr "polyTweakUV16.out" "polyMapSew10.ip";
connectAttr "polyMapSew10.out" "polyTweakUV17.ip";
connectAttr "polyTweakUV17.out" "Unfold3DOptimize69.im";
connectAttr "Unfold3DOptimize69.om" "polyTweakUV18.ip";
connectAttr "polyTweakUV18.out" "polyMapCut5.ip";
connectAttr "polyMapCut5.out" "polyTweakUV19.ip";
connectAttr "polyTweakUV19.out" "polyMapCut6.ip";
connectAttr "polyMapCut6.out" "polyTweakUV20.ip";
connectAttr "polyTweakUV20.out" "polyMapSew11.ip";
connectAttr "polyMapSew11.out" "polyTweakUV21.ip";
connectAttr "polyTweakUV21.out" "polyMapSew12.ip";
connectAttr "polyMapSew12.out" "polyTweakUV22.ip";
connectAttr "polyTweakUV22.out" "polyMapSew13.ip";
connectAttr "polyMapSew13.out" "polyTweakUV23.ip";
connectAttr "polyTweakUV23.out" "Unfold3DOptimize70.im";
connectAttr "Unfold3DOptimize70.om" "polyTweakUV24.ip";
connectAttr "polyTweakUV24.out" "polyMapSew14.ip";
connectAttr "polyMapSew14.out" "Unfold3DOptimize71.im";
connectAttr "Unfold3DOptimize71.om" "polyTweakUV25.ip";
connectAttr "polyTweakUV25.out" "polyMapSew15.ip";
connectAttr "polyMapSew15.out" "polyMapSew16.ip";
connectAttr "polyMapSew16.out" "polyTweakUV26.ip";
connectAttr "polyTweakUV26.out" "polyMapCut7.ip";
connectAttr "polyMapCut7.out" "polyMapSew17.ip";
connectAttr "polyMapSew17.out" "Unfold3DOptimize72.im";
connectAttr "Unfold3DOptimize72.om" "polyTweakUV27.ip";
connectAttr "polyTweakUV27.out" "polyMapSew18.ip";
connectAttr "polyMapSew18.out" "Unfold3DOptimize73.im";
connectAttr "Unfold3DOptimize73.om" "Unfold3DOptimize74.im";
connectAttr "Unfold3DOptimize74.om" "polyTweakUV28.ip";
connectAttr "polyTweakUV28.out" "polyMapSew19.ip";
connectAttr "polyMapSew19.out" "polyTweakUV29.ip";
connectAttr "polyTweakUV29.out" "Unfold3DOptimize75.im";
connectAttr "Unfold3DOptimize75.om" "polyTweakUV30.ip";
connectAttr "polyTweakUV30.out" "polyMapSew20.ip";
connectAttr "polyMapSew20.out" "polyTweakUV31.ip";
connectAttr "polyTweakUV31.out" "Unfold3DOptimize76.im";
connectAttr "Unfold3DOptimize76.om" "Unfold3DOptimize77.im";
connectAttr "Unfold3DOptimize77.om" "Unfold3DOptimize78.im";
connectAttr "Unfold3DOptimize78.om" "polyTweakUV32.ip";
connectAttr "polyTweakUV32.out" "Unfold3DOptimize79.im";
connectAttr "Unfold3DOptimize79.om" "polyTweakUV33.ip";
connectAttr "polyTweakUV33.out" "polyMapSew21.ip";
connectAttr "polyMapSew21.out" "polyTweakUV34.ip";
connectAttr "polyTweakUV34.out" "Unfold3DOptimize80.im";
connectAttr "Unfold3DOptimize80.om" "polyTweakUV35.ip";
connectAttr "polyTweakUV35.out" "Unfold3DOptimize81.im";
connectAttr "Unfold3DOptimize81.om" "Unfold3DOptimize82.im";
connectAttr "Unfold3DOptimize82.om" "Unfold3DOptimize83.im";
connectAttr "Unfold3DOptimize83.om" "Unfold3DOptimize84.im";
connectAttr "Unfold3DOptimize84.om" "polyTweakUV36.ip";
connectAttr "polyTweakUV36.out" "polyMapSew22.ip";
connectAttr "polyMapSew22.out" "polyTweakUV37.ip";
connectAttr "polyTweakUV37.out" "polyMapSew23.ip";
connectAttr "polyMapSew23.out" "polyTweakUV38.ip";
connectAttr "polyTweakUV38.out" "Unfold3DOptimize85.im";
connectAttr "Unfold3DOptimize85.om" "Unfold3DOptimize86.im";
connectAttr "Unfold3DOptimize86.om" "polyTweakUV39.ip";
connectAttr "polyTweakUV39.out" "polyMapSew24.ip";
connectAttr "polyMapSew24.out" "polyTweakUV40.ip";
connectAttr "polyTweakUV40.out" "polyMapSew25.ip";
connectAttr "polyMapSew25.out" "polyTweakUV41.ip";
connectAttr "polyTweakUV41.out" "Unfold3DOptimize87.im";
connectAttr "Unfold3DOptimize87.om" "Unfold3DOptimize88.im";
connectAttr "Unfold3DOptimize88.om" "Unfold3DOptimize89.im";
connectAttr "Unfold3DOptimize89.om" "Unfold3DOptimize90.im";
connectAttr "Unfold3DOptimize90.om" "polyTweakUV42.ip";
connectAttr "a:defaultMat.msg" "a:materialInfo1.sg";
connectAttr "a:defaultMat1P2D.c" "a:defaultMat1F.c";
connectAttr "a:defaultMat1P2D.tf" "a:defaultMat1F.tf";
connectAttr "a:defaultMat1P2D.rf" "a:defaultMat1F.rf";
connectAttr "a:defaultMat1P2D.s" "a:defaultMat1F.s";
connectAttr "a:defaultMat1P2D.wu" "a:defaultMat1F.wu";
connectAttr "a:defaultMat1P2D.wv" "a:defaultMat1F.wv";
connectAttr "a:defaultMat1P2D.re" "a:defaultMat1F.re";
connectAttr "a:defaultMat1P2D.of" "a:defaultMat1F.of";
connectAttr "a:defaultMat1P2D.r" "a:defaultMat1F.ro";
connectAttr "a:defaultMat1P2D.o" "a:defaultMat1F.uv";
connectAttr "a:defaultMat1P2D.ofs" "a:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "a:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "a:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "a:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "a:defaultMat1F.ws";
connectAttr "aa:defaultMat.msg" "aa:materialInfo1.sg";
connectAttr "aa:defaultMat1P2D.c" "aa:defaultMat1F.c";
connectAttr "aa:defaultMat1P2D.tf" "aa:defaultMat1F.tf";
connectAttr "aa:defaultMat1P2D.rf" "aa:defaultMat1F.rf";
connectAttr "aa:defaultMat1P2D.s" "aa:defaultMat1F.s";
connectAttr "aa:defaultMat1P2D.wu" "aa:defaultMat1F.wu";
connectAttr "aa:defaultMat1P2D.wv" "aa:defaultMat1F.wv";
connectAttr "aa:defaultMat1P2D.re" "aa:defaultMat1F.re";
connectAttr "aa:defaultMat1P2D.of" "aa:defaultMat1F.of";
connectAttr "aa:defaultMat1P2D.r" "aa:defaultMat1F.ro";
connectAttr "aa:defaultMat1P2D.o" "aa:defaultMat1F.uv";
connectAttr "aa:defaultMat1P2D.ofs" "aa:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "aa:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "aa:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "aa:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "aa:defaultMat1F.ws";
connectAttr "b:defaultMat.msg" "b:materialInfo1.sg";
connectAttr "b:defaultMat1P2D.c" "b:defaultMat1F.c";
connectAttr "b:defaultMat1P2D.tf" "b:defaultMat1F.tf";
connectAttr "b:defaultMat1P2D.rf" "b:defaultMat1F.rf";
connectAttr "b:defaultMat1P2D.s" "b:defaultMat1F.s";
connectAttr "b:defaultMat1P2D.wu" "b:defaultMat1F.wu";
connectAttr "b:defaultMat1P2D.wv" "b:defaultMat1F.wv";
connectAttr "b:defaultMat1P2D.re" "b:defaultMat1F.re";
connectAttr "b:defaultMat1P2D.of" "b:defaultMat1F.of";
connectAttr "b:defaultMat1P2D.r" "b:defaultMat1F.ro";
connectAttr "b:defaultMat1P2D.o" "b:defaultMat1F.uv";
connectAttr "b:defaultMat1P2D.ofs" "b:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "b:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "b:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "b:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "b:defaultMat1F.ws";
connectAttr "a1:defaultMat.msg" "a1:materialInfo1.sg";
connectAttr "a1:defaultMat1P2D.c" "a1:defaultMat1F.c";
connectAttr "a1:defaultMat1P2D.tf" "a1:defaultMat1F.tf";
connectAttr "a1:defaultMat1P2D.rf" "a1:defaultMat1F.rf";
connectAttr "a1:defaultMat1P2D.s" "a1:defaultMat1F.s";
connectAttr "a1:defaultMat1P2D.wu" "a1:defaultMat1F.wu";
connectAttr "a1:defaultMat1P2D.wv" "a1:defaultMat1F.wv";
connectAttr "a1:defaultMat1P2D.re" "a1:defaultMat1F.re";
connectAttr "a1:defaultMat1P2D.of" "a1:defaultMat1F.of";
connectAttr "a1:defaultMat1P2D.r" "a1:defaultMat1F.ro";
connectAttr "a1:defaultMat1P2D.o" "a1:defaultMat1F.uv";
connectAttr "a1:defaultMat1P2D.ofs" "a1:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "a1:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "a1:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "a1:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "a1:defaultMat1F.ws";
connectAttr "aa1:defaultMat.msg" "aa1:materialInfo1.sg";
connectAttr "aa1:defaultMat1P2D.c" "aa1:defaultMat1F.c";
connectAttr "aa1:defaultMat1P2D.tf" "aa1:defaultMat1F.tf";
connectAttr "aa1:defaultMat1P2D.rf" "aa1:defaultMat1F.rf";
connectAttr "aa1:defaultMat1P2D.s" "aa1:defaultMat1F.s";
connectAttr "aa1:defaultMat1P2D.wu" "aa1:defaultMat1F.wu";
connectAttr "aa1:defaultMat1P2D.wv" "aa1:defaultMat1F.wv";
connectAttr "aa1:defaultMat1P2D.re" "aa1:defaultMat1F.re";
connectAttr "aa1:defaultMat1P2D.of" "aa1:defaultMat1F.of";
connectAttr "aa1:defaultMat1P2D.r" "aa1:defaultMat1F.ro";
connectAttr "aa1:defaultMat1P2D.o" "aa1:defaultMat1F.uv";
connectAttr "aa1:defaultMat1P2D.ofs" "aa1:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "aa1:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "aa1:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "aa1:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "aa1:defaultMat1F.ws";
connectAttr "b1:defaultMat.msg" "b1:materialInfo1.sg";
connectAttr "b1:defaultMat1P2D.c" "b1:defaultMat1F.c";
connectAttr "b1:defaultMat1P2D.tf" "b1:defaultMat1F.tf";
connectAttr "b1:defaultMat1P2D.rf" "b1:defaultMat1F.rf";
connectAttr "b1:defaultMat1P2D.s" "b1:defaultMat1F.s";
connectAttr "b1:defaultMat1P2D.wu" "b1:defaultMat1F.wu";
connectAttr "b1:defaultMat1P2D.wv" "b1:defaultMat1F.wv";
connectAttr "b1:defaultMat1P2D.re" "b1:defaultMat1F.re";
connectAttr "b1:defaultMat1P2D.of" "b1:defaultMat1F.of";
connectAttr "b1:defaultMat1P2D.r" "b1:defaultMat1F.ro";
connectAttr "b1:defaultMat1P2D.o" "b1:defaultMat1F.uv";
connectAttr "b1:defaultMat1P2D.ofs" "b1:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "b1:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "b1:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "b1:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "b1:defaultMat1F.ws";
connectAttr "blinn5SG.msg" "materialInfo6.sg";
connectAttr "place2dTexture10.c" "file10.c";
connectAttr "place2dTexture10.tf" "file10.tf";
connectAttr "place2dTexture10.rf" "file10.rf";
connectAttr "place2dTexture10.mu" "file10.mu";
connectAttr "place2dTexture10.mv" "file10.mv";
connectAttr "place2dTexture10.s" "file10.s";
connectAttr "place2dTexture10.wu" "file10.wu";
connectAttr "place2dTexture10.wv" "file10.wv";
connectAttr "place2dTexture10.re" "file10.re";
connectAttr "place2dTexture10.of" "file10.of";
connectAttr "place2dTexture10.r" "file10.ro";
connectAttr "place2dTexture10.n" "file10.n";
connectAttr "place2dTexture10.vt1" "file10.vt1";
connectAttr "place2dTexture10.vt2" "file10.vt2";
connectAttr "place2dTexture10.vt3" "file10.vt3";
connectAttr "place2dTexture10.vc1" "file10.vc1";
connectAttr "place2dTexture10.o" "file10.uv";
connectAttr "place2dTexture10.ofs" "file10.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file10.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file10.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file10.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file10.ws";
connectAttr "file10.oa" "bump2d4.bv";
connectAttr "place2dTexture11.c" "file11.c";
connectAttr "place2dTexture11.tf" "file11.tf";
connectAttr "place2dTexture11.rf" "file11.rf";
connectAttr "place2dTexture11.mu" "file11.mu";
connectAttr "place2dTexture11.mv" "file11.mv";
connectAttr "place2dTexture11.s" "file11.s";
connectAttr "place2dTexture11.wu" "file11.wu";
connectAttr "place2dTexture11.wv" "file11.wv";
connectAttr "place2dTexture11.re" "file11.re";
connectAttr "place2dTexture11.of" "file11.of";
connectAttr "place2dTexture11.r" "file11.ro";
connectAttr "place2dTexture11.n" "file11.n";
connectAttr "place2dTexture11.vt1" "file11.vt1";
connectAttr "place2dTexture11.vt2" "file11.vt2";
connectAttr "place2dTexture11.vt3" "file11.vt3";
connectAttr "place2dTexture11.vc1" "file11.vc1";
connectAttr "place2dTexture11.o" "file11.uv";
connectAttr "place2dTexture11.ofs" "file11.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file11.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file11.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file11.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file11.ws";
connectAttr "a2:defaultMat.msg" "a2:materialInfo1.sg";
connectAttr "a2:defaultMat1P2D.c" "a2:defaultMat1F.c";
connectAttr "a2:defaultMat1P2D.tf" "a2:defaultMat1F.tf";
connectAttr "a2:defaultMat1P2D.rf" "a2:defaultMat1F.rf";
connectAttr "a2:defaultMat1P2D.s" "a2:defaultMat1F.s";
connectAttr "a2:defaultMat1P2D.wu" "a2:defaultMat1F.wu";
connectAttr "a2:defaultMat1P2D.wv" "a2:defaultMat1F.wv";
connectAttr "a2:defaultMat1P2D.re" "a2:defaultMat1F.re";
connectAttr "a2:defaultMat1P2D.of" "a2:defaultMat1F.of";
connectAttr "a2:defaultMat1P2D.r" "a2:defaultMat1F.ro";
connectAttr "a2:defaultMat1P2D.o" "a2:defaultMat1F.uv";
connectAttr "a2:defaultMat1P2D.ofs" "a2:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "a2:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "a2:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "a2:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "a2:defaultMat1F.ws";
connectAttr "blinn6SG.msg" "materialInfo7.sg";
connectAttr "place2dTexture12.c" "file12.c";
connectAttr "place2dTexture12.tf" "file12.tf";
connectAttr "place2dTexture12.rf" "file12.rf";
connectAttr "place2dTexture12.mu" "file12.mu";
connectAttr "place2dTexture12.mv" "file12.mv";
connectAttr "place2dTexture12.s" "file12.s";
connectAttr "place2dTexture12.wu" "file12.wu";
connectAttr "place2dTexture12.wv" "file12.wv";
connectAttr "place2dTexture12.re" "file12.re";
connectAttr "place2dTexture12.of" "file12.of";
connectAttr "place2dTexture12.r" "file12.ro";
connectAttr "place2dTexture12.n" "file12.n";
connectAttr "place2dTexture12.vt1" "file12.vt1";
connectAttr "place2dTexture12.vt2" "file12.vt2";
connectAttr "place2dTexture12.vt3" "file12.vt3";
connectAttr "place2dTexture12.vc1" "file12.vc1";
connectAttr "place2dTexture12.o" "file12.uv";
connectAttr "place2dTexture12.ofs" "file12.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file12.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file12.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file12.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file12.ws";
connectAttr "a3:blinn5SG.msg" "a3:materialInfo1.sg";
connectAttr "a3:blinn5SG1P2D.c" "a3:blinn5SG1F.c";
connectAttr "a3:blinn5SG1P2D.tf" "a3:blinn5SG1F.tf";
connectAttr "a3:blinn5SG1P2D.rf" "a3:blinn5SG1F.rf";
connectAttr "a3:blinn5SG1P2D.s" "a3:blinn5SG1F.s";
connectAttr "a3:blinn5SG1P2D.wu" "a3:blinn5SG1F.wu";
connectAttr "a3:blinn5SG1P2D.wv" "a3:blinn5SG1F.wv";
connectAttr "a3:blinn5SG1P2D.re" "a3:blinn5SG1F.re";
connectAttr "a3:blinn5SG1P2D.of" "a3:blinn5SG1F.of";
connectAttr "a3:blinn5SG1P2D.r" "a3:blinn5SG1F.ro";
connectAttr "a3:blinn5SG1P2D.o" "a3:blinn5SG1F.uv";
connectAttr "a3:blinn5SG1P2D.ofs" "a3:blinn5SG1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "a3:blinn5SG1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "a3:blinn5SG1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "a3:blinn5SG1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "a3:blinn5SG1F.ws";
connectAttr "a3:blinn5SG1BMP2D.c" "a3:blinn5SG1BM.c";
connectAttr "a3:blinn5SG1BMP2D.tf" "a3:blinn5SG1BM.tf";
connectAttr "a3:blinn5SG1BMP2D.rf" "a3:blinn5SG1BM.rf";
connectAttr "a3:blinn5SG1BMP2D.s" "a3:blinn5SG1BM.s";
connectAttr "a3:blinn5SG1BMP2D.wu" "a3:blinn5SG1BM.wu";
connectAttr "a3:blinn5SG1BMP2D.wv" "a3:blinn5SG1BM.wv";
connectAttr "a3:blinn5SG1BMP2D.re" "a3:blinn5SG1BM.re";
connectAttr "a3:blinn5SG1BMP2D.of" "a3:blinn5SG1BM.of";
connectAttr "a3:blinn5SG1BMP2D.r" "a3:blinn5SG1BM.ro";
connectAttr "a3:blinn5SG1BMP2D.o" "a3:blinn5SG1BM.uv";
connectAttr "a3:blinn5SG1BMP2D.ofs" "a3:blinn5SG1BM.fs";
connectAttr ":defaultColorMgtGlobals.cme" "a3:blinn5SG1BM.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "a3:blinn5SG1BM.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "a3:blinn5SG1BM.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "a3:blinn5SG1BM.ws";
connectAttr "a3:blinn5SG1BM.oa" "a3:blinn5SG1BMU.bv";
connectAttr "aa2:defaultMat.msg" "aa2:materialInfo1.sg";
connectAttr "aa2:defaultMat1P2D.c" "aa2:defaultMat1F.c";
connectAttr "aa2:defaultMat1P2D.tf" "aa2:defaultMat1F.tf";
connectAttr "aa2:defaultMat1P2D.rf" "aa2:defaultMat1F.rf";
connectAttr "aa2:defaultMat1P2D.s" "aa2:defaultMat1F.s";
connectAttr "aa2:defaultMat1P2D.wu" "aa2:defaultMat1F.wu";
connectAttr "aa2:defaultMat1P2D.wv" "aa2:defaultMat1F.wv";
connectAttr "aa2:defaultMat1P2D.re" "aa2:defaultMat1F.re";
connectAttr "aa2:defaultMat1P2D.of" "aa2:defaultMat1F.of";
connectAttr "aa2:defaultMat1P2D.r" "aa2:defaultMat1F.ro";
connectAttr "aa2:defaultMat1P2D.o" "aa2:defaultMat1F.uv";
connectAttr "aa2:defaultMat1P2D.ofs" "aa2:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "aa2:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "aa2:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "aa2:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "aa2:defaultMat1F.ws";
connectAttr "a4:defaultMat.msg" "a4:materialInfo1.sg";
connectAttr "a4:defaultMat1P2D.c" "a4:defaultMat1F.c";
connectAttr "a4:defaultMat1P2D.tf" "a4:defaultMat1F.tf";
connectAttr "a4:defaultMat1P2D.rf" "a4:defaultMat1F.rf";
connectAttr "a4:defaultMat1P2D.s" "a4:defaultMat1F.s";
connectAttr "a4:defaultMat1P2D.wu" "a4:defaultMat1F.wu";
connectAttr "a4:defaultMat1P2D.wv" "a4:defaultMat1F.wv";
connectAttr "a4:defaultMat1P2D.re" "a4:defaultMat1F.re";
connectAttr "a4:defaultMat1P2D.of" "a4:defaultMat1F.of";
connectAttr "a4:defaultMat1P2D.r" "a4:defaultMat1F.ro";
connectAttr "a4:defaultMat1P2D.o" "a4:defaultMat1F.uv";
connectAttr "a4:defaultMat1P2D.ofs" "a4:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "a4:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "a4:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "a4:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "a4:defaultMat1F.ws";
connectAttr "aa3:defaultMat.msg" "aa3:materialInfo1.sg";
connectAttr "aa3:defaultMat1P2D.c" "aa3:defaultMat1F.c";
connectAttr "aa3:defaultMat1P2D.tf" "aa3:defaultMat1F.tf";
connectAttr "aa3:defaultMat1P2D.rf" "aa3:defaultMat1F.rf";
connectAttr "aa3:defaultMat1P2D.s" "aa3:defaultMat1F.s";
connectAttr "aa3:defaultMat1P2D.wu" "aa3:defaultMat1F.wu";
connectAttr "aa3:defaultMat1P2D.wv" "aa3:defaultMat1F.wv";
connectAttr "aa3:defaultMat1P2D.re" "aa3:defaultMat1F.re";
connectAttr "aa3:defaultMat1P2D.of" "aa3:defaultMat1F.of";
connectAttr "aa3:defaultMat1P2D.r" "aa3:defaultMat1F.ro";
connectAttr "aa3:defaultMat1P2D.o" "aa3:defaultMat1F.uv";
connectAttr "aa3:defaultMat1P2D.ofs" "aa3:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "aa3:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "aa3:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "aa3:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "aa3:defaultMat1F.ws";
connectAttr "a5:defaultMat.msg" "a5:materialInfo1.sg";
connectAttr "a5:defaultMat1P2D.c" "a5:defaultMat1F.c";
connectAttr "a5:defaultMat1P2D.tf" "a5:defaultMat1F.tf";
connectAttr "a5:defaultMat1P2D.rf" "a5:defaultMat1F.rf";
connectAttr "a5:defaultMat1P2D.s" "a5:defaultMat1F.s";
connectAttr "a5:defaultMat1P2D.wu" "a5:defaultMat1F.wu";
connectAttr "a5:defaultMat1P2D.wv" "a5:defaultMat1F.wv";
connectAttr "a5:defaultMat1P2D.re" "a5:defaultMat1F.re";
connectAttr "a5:defaultMat1P2D.of" "a5:defaultMat1F.of";
connectAttr "a5:defaultMat1P2D.r" "a5:defaultMat1F.ro";
connectAttr "a5:defaultMat1P2D.o" "a5:defaultMat1F.uv";
connectAttr "a5:defaultMat1P2D.ofs" "a5:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "a5:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "a5:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "a5:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "a5:defaultMat1F.ws";
connectAttr "aa4:defaultMat.msg" "aa4:materialInfo1.sg";
connectAttr "aa4:defaultMat1P2D.c" "aa4:defaultMat1F.c";
connectAttr "aa4:defaultMat1P2D.tf" "aa4:defaultMat1F.tf";
connectAttr "aa4:defaultMat1P2D.rf" "aa4:defaultMat1F.rf";
connectAttr "aa4:defaultMat1P2D.s" "aa4:defaultMat1F.s";
connectAttr "aa4:defaultMat1P2D.wu" "aa4:defaultMat1F.wu";
connectAttr "aa4:defaultMat1P2D.wv" "aa4:defaultMat1F.wv";
connectAttr "aa4:defaultMat1P2D.re" "aa4:defaultMat1F.re";
connectAttr "aa4:defaultMat1P2D.of" "aa4:defaultMat1F.of";
connectAttr "aa4:defaultMat1P2D.r" "aa4:defaultMat1F.ro";
connectAttr "aa4:defaultMat1P2D.o" "aa4:defaultMat1F.uv";
connectAttr "aa4:defaultMat1P2D.ofs" "aa4:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "aa4:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "aa4:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "aa4:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "aa4:defaultMat1F.ws";
connectAttr "a6:defaultMat.msg" "a6:materialInfo1.sg";
connectAttr "a6:defaultMat1P2D.c" "a6:defaultMat1F.c";
connectAttr "a6:defaultMat1P2D.tf" "a6:defaultMat1F.tf";
connectAttr "a6:defaultMat1P2D.rf" "a6:defaultMat1F.rf";
connectAttr "a6:defaultMat1P2D.s" "a6:defaultMat1F.s";
connectAttr "a6:defaultMat1P2D.wu" "a6:defaultMat1F.wu";
connectAttr "a6:defaultMat1P2D.wv" "a6:defaultMat1F.wv";
connectAttr "a6:defaultMat1P2D.re" "a6:defaultMat1F.re";
connectAttr "a6:defaultMat1P2D.of" "a6:defaultMat1F.of";
connectAttr "a6:defaultMat1P2D.r" "a6:defaultMat1F.ro";
connectAttr "a6:defaultMat1P2D.o" "a6:defaultMat1F.uv";
connectAttr "a6:defaultMat1P2D.ofs" "a6:defaultMat1F.fs";
connectAttr ":defaultColorMgtGlobals.cme" "a6:defaultMat1F.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "a6:defaultMat1F.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "a6:defaultMat1F.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "a6:defaultMat1F.ws";
connectAttr "bump2d5.o" "blinn7.n";
connectAttr "file14.oc" "blinn7.c";
connectAttr "blinn7.oc" "blinn7SG.ss";
connectAttr "blinn7SG.msg" "materialInfo8.sg";
connectAttr "blinn7.msg" "materialInfo8.m";
connectAttr "file14.msg" "materialInfo8.t" -na;
connectAttr "place2dTexture13.c" "file13.c";
connectAttr "place2dTexture13.tf" "file13.tf";
connectAttr "place2dTexture13.rf" "file13.rf";
connectAttr "place2dTexture13.mu" "file13.mu";
connectAttr "place2dTexture13.mv" "file13.mv";
connectAttr "place2dTexture13.s" "file13.s";
connectAttr "place2dTexture13.wu" "file13.wu";
connectAttr "place2dTexture13.wv" "file13.wv";
connectAttr "place2dTexture13.re" "file13.re";
connectAttr "place2dTexture13.of" "file13.of";
connectAttr "place2dTexture13.r" "file13.ro";
connectAttr "place2dTexture13.n" "file13.n";
connectAttr "place2dTexture13.vt1" "file13.vt1";
connectAttr "place2dTexture13.vt2" "file13.vt2";
connectAttr "place2dTexture13.vt3" "file13.vt3";
connectAttr "place2dTexture13.vc1" "file13.vc1";
connectAttr "place2dTexture13.o" "file13.uv";
connectAttr "place2dTexture13.ofs" "file13.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file13.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file13.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file13.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file13.ws";
connectAttr "file13.oa" "bump2d5.bv";
connectAttr "place2dTexture14.c" "file14.c";
connectAttr "place2dTexture14.tf" "file14.tf";
connectAttr "place2dTexture14.rf" "file14.rf";
connectAttr "place2dTexture14.mu" "file14.mu";
connectAttr "place2dTexture14.mv" "file14.mv";
connectAttr "place2dTexture14.s" "file14.s";
connectAttr "place2dTexture14.wu" "file14.wu";
connectAttr "place2dTexture14.wv" "file14.wv";
connectAttr "place2dTexture14.re" "file14.re";
connectAttr "place2dTexture14.of" "file14.of";
connectAttr "place2dTexture14.r" "file14.ro";
connectAttr "place2dTexture14.n" "file14.n";
connectAttr "place2dTexture14.vt1" "file14.vt1";
connectAttr "place2dTexture14.vt2" "file14.vt2";
connectAttr "place2dTexture14.vt3" "file14.vt3";
connectAttr "place2dTexture14.vc1" "file14.vc1";
connectAttr "place2dTexture14.o" "file14.uv";
connectAttr "place2dTexture14.ofs" "file14.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file14.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file14.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file14.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file14.ws";
connectAttr "lambert4SG.msg" "materialInfo9.sg";
connectAttr ":defaultColorMgtGlobals.cme" "file15.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file15.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file15.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file15.ws";
connectAttr "Heel.fat" "HeelFat.i1y";
connectAttr "Heel.fat" "HeelFat.i1z";
connectAttr "Heel.fatY" "HeelFat.i2y";
connectAttr "Heel.fatZ" "HeelFat.i2z";
connectAttr "FootSideInner.fat" "FootSideInnerFat.i1y";
connectAttr "FootSideInner.fat" "FootSideInnerFat.i1z";
connectAttr "FootSideInner.fatY" "FootSideInnerFat.i2y";
connectAttr "FootSideInner.fatZ" "FootSideInnerFat.i2z";
connectAttr "FootSideOuter.fat" "FootSideOuterFat.i1y";
connectAttr "FootSideOuter.fat" "FootSideOuterFat.i1z";
connectAttr "FootSideOuter.fatY" "FootSideOuterFat.i2y";
connectAttr "FootSideOuter.fatZ" "FootSideOuterFat.i2z";
connectAttr "ToesEnd.fat" "ToesEndFat.i1y";
connectAttr "ToesEnd.fat" "ToesEndFat.i1z";
connectAttr "ToesEnd.fatY" "ToesEndFat.i2y";
connectAttr "ToesEnd.fatZ" "ToesEndFat.i2z";
connectAttr "Toes.fat" "ToesFat.i1y";
connectAttr "Toes.fat" "ToesFat.i1z";
connectAttr "Toes.fatY" "ToesFat.i2y";
connectAttr "Toes.fatZ" "ToesFat.i2z";
connectAttr "Ankle.fat" "AnkleFat.i1y";
connectAttr "Ankle.fat" "AnkleFat.i1z";
connectAttr "Ankle.fatY" "AnkleFat.i2y";
connectAttr "Ankle.fatZ" "AnkleFat.i2z";
connectAttr "Knee.fat" "KneeFat.i1y";
connectAttr "Knee.fat" "KneeFat.i1z";
connectAttr "Knee.fatY" "KneeFat.i2y";
connectAttr "Knee.fatZ" "KneeFat.i2z";
connectAttr "Hip.fat" "HipFat.i1y";
connectAttr "Hip.fat" "HipFat.i1z";
connectAttr "Hip.fatY" "HipFat.i2y";
connectAttr "Hip.fatZ" "HipFat.i2z";
connectAttr "MiddleFinger4.fat" "MiddleFinger4Fat.i1y";
connectAttr "MiddleFinger4.fat" "MiddleFinger4Fat.i1z";
connectAttr "MiddleFinger4.fatY" "MiddleFinger4Fat.i2y";
connectAttr "MiddleFinger4.fatZ" "MiddleFinger4Fat.i2z";
connectAttr "MiddleFinger3.fat" "MiddleFinger3Fat.i1y";
connectAttr "MiddleFinger3.fat" "MiddleFinger3Fat.i1z";
connectAttr "MiddleFinger3.fatY" "MiddleFinger3Fat.i2y";
connectAttr "MiddleFinger3.fatZ" "MiddleFinger3Fat.i2z";
connectAttr "MiddleFinger2.fat" "MiddleFinger2Fat.i1y";
connectAttr "MiddleFinger2.fat" "MiddleFinger2Fat.i1z";
connectAttr "MiddleFinger2.fatY" "MiddleFinger2Fat.i2y";
connectAttr "MiddleFinger2.fatZ" "MiddleFinger2Fat.i2z";
connectAttr "MiddleFinger1.fat" "MiddleFinger1Fat.i1y";
connectAttr "MiddleFinger1.fat" "MiddleFinger1Fat.i1z";
connectAttr "MiddleFinger1.fatY" "MiddleFinger1Fat.i2y";
connectAttr "MiddleFinger1.fatZ" "MiddleFinger1Fat.i2z";
connectAttr "ThumbFinger4.fat" "ThumbFinger4Fat.i1y";
connectAttr "ThumbFinger4.fat" "ThumbFinger4Fat.i1z";
connectAttr "ThumbFinger4.fatY" "ThumbFinger4Fat.i2y";
connectAttr "ThumbFinger4.fatZ" "ThumbFinger4Fat.i2z";
connectAttr "ThumbFinger3.fat" "ThumbFinger3Fat.i1y";
connectAttr "ThumbFinger3.fat" "ThumbFinger3Fat.i1z";
connectAttr "ThumbFinger3.fatY" "ThumbFinger3Fat.i2y";
connectAttr "ThumbFinger3.fatZ" "ThumbFinger3Fat.i2z";
connectAttr "ThumbFinger2.fat" "ThumbFinger2Fat.i1y";
connectAttr "ThumbFinger2.fat" "ThumbFinger2Fat.i1z";
connectAttr "ThumbFinger2.fatY" "ThumbFinger2Fat.i2y";
connectAttr "ThumbFinger2.fatZ" "ThumbFinger2Fat.i2z";
connectAttr "ThumbFinger1.fat" "ThumbFinger1Fat.i1y";
connectAttr "ThumbFinger1.fat" "ThumbFinger1Fat.i1z";
connectAttr "ThumbFinger1.fatY" "ThumbFinger1Fat.i2y";
connectAttr "ThumbFinger1.fatZ" "ThumbFinger1Fat.i2z";
connectAttr "IndexFinger4.fat" "IndexFinger4Fat.i1y";
connectAttr "IndexFinger4.fat" "IndexFinger4Fat.i1z";
connectAttr "IndexFinger4.fatY" "IndexFinger4Fat.i2y";
connectAttr "IndexFinger4.fatZ" "IndexFinger4Fat.i2z";
connectAttr "IndexFinger3.fat" "IndexFinger3Fat.i1y";
connectAttr "IndexFinger3.fat" "IndexFinger3Fat.i1z";
connectAttr "IndexFinger3.fatY" "IndexFinger3Fat.i2y";
connectAttr "IndexFinger3.fatZ" "IndexFinger3Fat.i2z";
connectAttr "IndexFinger2.fat" "IndexFinger2Fat.i1y";
connectAttr "IndexFinger2.fat" "IndexFinger2Fat.i1z";
connectAttr "IndexFinger2.fatY" "IndexFinger2Fat.i2y";
connectAttr "IndexFinger2.fatZ" "IndexFinger2Fat.i2z";
connectAttr "IndexFinger1.fat" "IndexFinger1Fat.i1y";
connectAttr "IndexFinger1.fat" "IndexFinger1Fat.i1z";
connectAttr "IndexFinger1.fatY" "IndexFinger1Fat.i2y";
connectAttr "IndexFinger1.fatZ" "IndexFinger1Fat.i2z";
connectAttr "PinkyFinger4.fat" "PinkyFinger4Fat.i1y";
connectAttr "PinkyFinger4.fat" "PinkyFinger4Fat.i1z";
connectAttr "PinkyFinger4.fatY" "PinkyFinger4Fat.i2y";
connectAttr "PinkyFinger4.fatZ" "PinkyFinger4Fat.i2z";
connectAttr "PinkyFinger3.fat" "PinkyFinger3Fat.i1y";
connectAttr "PinkyFinger3.fat" "PinkyFinger3Fat.i1z";
connectAttr "PinkyFinger3.fatY" "PinkyFinger3Fat.i2y";
connectAttr "PinkyFinger3.fatZ" "PinkyFinger3Fat.i2z";
connectAttr "PinkyFinger2.fat" "PinkyFinger2Fat.i1y";
connectAttr "PinkyFinger2.fat" "PinkyFinger2Fat.i1z";
connectAttr "PinkyFinger2.fatY" "PinkyFinger2Fat.i2y";
connectAttr "PinkyFinger2.fatZ" "PinkyFinger2Fat.i2z";
connectAttr "PinkyFinger1.fat" "PinkyFinger1Fat.i1y";
connectAttr "PinkyFinger1.fat" "PinkyFinger1Fat.i1z";
connectAttr "PinkyFinger1.fatY" "PinkyFinger1Fat.i2y";
connectAttr "PinkyFinger1.fatZ" "PinkyFinger1Fat.i2z";
connectAttr "RingFinger4.fat" "RingFinger4Fat.i1y";
connectAttr "RingFinger4.fat" "RingFinger4Fat.i1z";
connectAttr "RingFinger4.fatY" "RingFinger4Fat.i2y";
connectAttr "RingFinger4.fatZ" "RingFinger4Fat.i2z";
connectAttr "RingFinger3.fat" "RingFinger3Fat.i1y";
connectAttr "RingFinger3.fat" "RingFinger3Fat.i1z";
connectAttr "RingFinger3.fatY" "RingFinger3Fat.i2y";
connectAttr "RingFinger3.fatZ" "RingFinger3Fat.i2z";
connectAttr "RingFinger2.fat" "RingFinger2Fat.i1y";
connectAttr "RingFinger2.fat" "RingFinger2Fat.i1z";
connectAttr "RingFinger2.fatY" "RingFinger2Fat.i2y";
connectAttr "RingFinger2.fatZ" "RingFinger2Fat.i2z";
connectAttr "RingFinger1.fat" "RingFinger1Fat.i1y";
connectAttr "RingFinger1.fat" "RingFinger1Fat.i1z";
connectAttr "RingFinger1.fatY" "RingFinger1Fat.i2y";
connectAttr "RingFinger1.fatZ" "RingFinger1Fat.i2z";
connectAttr "Cup.fat" "CupFat.i1y";
connectAttr "Cup.fat" "CupFat.i1z";
connectAttr "Cup.fatY" "CupFat.i2y";
connectAttr "Cup.fatZ" "CupFat.i2z";
connectAttr "Wrist.fat" "WristFat.i1y";
connectAttr "Wrist.fat" "WristFat.i1z";
connectAttr "Wrist.fatY" "WristFat.i2y";
connectAttr "Wrist.fatZ" "WristFat.i2z";
connectAttr "Elbow.fat" "ElbowFat.i1y";
connectAttr "Elbow.fat" "ElbowFat.i1z";
connectAttr "Elbow.fatY" "ElbowFat.i2y";
connectAttr "Elbow.fatZ" "ElbowFat.i2z";
connectAttr "Shoulder.fat" "ShoulderFat.i1y";
connectAttr "Shoulder.fat" "ShoulderFat.i1z";
connectAttr "Shoulder.fatY" "ShoulderFat.i2y";
connectAttr "Shoulder.fatZ" "ShoulderFat.i2z";
connectAttr "Scapula.fat" "ScapulaFat.i1y";
connectAttr "Scapula.fat" "ScapulaFat.i1z";
connectAttr "Scapula.fatY" "ScapulaFat.i2y";
connectAttr "Scapula.fatZ" "ScapulaFat.i2z";
connectAttr "EyeEnd.fat" "EyeEndFat.i1y";
connectAttr "EyeEnd.fat" "EyeEndFat.i1z";
connectAttr "EyeEnd.fatY" "EyeEndFat.i2y";
connectAttr "EyeEnd.fatZ" "EyeEndFat.i2z";
connectAttr "Eye.fat" "EyeFat.i1y";
connectAttr "Eye.fat" "EyeFat.i1z";
connectAttr "Eye.fatY" "EyeFat.i2y";
connectAttr "Eye.fatZ" "EyeFat.i2z";
connectAttr "JawEnd.fat" "JawEndFat.i1y";
connectAttr "JawEnd.fat" "JawEndFat.i1z";
connectAttr "JawEnd.fatY" "JawEndFat.i2y";
connectAttr "JawEnd.fatZ" "JawEndFat.i2z";
connectAttr "joint5.fat" "joint5Fat.i1y";
connectAttr "joint5.fat" "joint5Fat.i1z";
connectAttr "joint5.fatY" "joint5Fat.i2y";
connectAttr "joint5.fatZ" "joint5Fat.i2z";
connectAttr "joint4.fat" "joint4Fat.i1y";
connectAttr "joint4.fat" "joint4Fat.i1z";
connectAttr "joint4.fatY" "joint4Fat.i2y";
connectAttr "joint4.fatZ" "joint4Fat.i2z";
connectAttr "joint3.fat" "joint3Fat.i1y";
connectAttr "joint3.fat" "joint3Fat.i1z";
connectAttr "joint3.fatY" "joint3Fat.i2y";
connectAttr "joint3.fatZ" "joint3Fat.i2z";
connectAttr "joint2.fat" "joint2Fat.i1y";
connectAttr "joint2.fat" "joint2Fat.i1z";
connectAttr "joint2.fatY" "joint2Fat.i2y";
connectAttr "joint2.fatZ" "joint2Fat.i2z";
connectAttr "joint1.fat" "joint1Fat.i1y";
connectAttr "joint1.fat" "joint1Fat.i1z";
connectAttr "joint1.fatY" "joint1Fat.i2y";
connectAttr "joint1.fatZ" "joint1Fat.i2z";
connectAttr "Jaw.fat" "JawFat.i1y";
connectAttr "Jaw.fat" "JawFat.i1z";
connectAttr "Jaw.fatY" "JawFat.i2y";
connectAttr "Jaw.fatZ" "JawFat.i2z";
connectAttr "HeadEnd.fat" "HeadEndFat.i1y";
connectAttr "HeadEnd.fat" "HeadEndFat.i1z";
connectAttr "HeadEnd.fatY" "HeadEndFat.i2y";
connectAttr "HeadEnd.fatZ" "HeadEndFat.i2z";
connectAttr "EyeEnd1.fat" "EyeEnd1Fat.i1y";
connectAttr "EyeEnd1.fat" "EyeEnd1Fat.i1z";
connectAttr "EyeEnd1.fatY" "EyeEnd1Fat.i2y";
connectAttr "EyeEnd1.fatZ" "EyeEnd1Fat.i2z";
connectAttr "Eye1.fat" "Eye1Fat.i1y";
connectAttr "Eye1.fat" "Eye1Fat.i1z";
connectAttr "Eye1.fatY" "Eye1Fat.i2y";
connectAttr "Eye1.fatZ" "Eye1Fat.i2z";
connectAttr "joint6.fat" "joint6Fat.i1y";
connectAttr "joint6.fat" "joint6Fat.i1z";
connectAttr "joint6.fatY" "joint6Fat.i2y";
connectAttr "joint6.fatZ" "joint6Fat.i2z";
connectAttr "joint7.fat" "joint7Fat.i1y";
connectAttr "joint7.fat" "joint7Fat.i1z";
connectAttr "joint7.fatY" "joint7Fat.i2y";
connectAttr "joint7.fatZ" "joint7Fat.i2z";
connectAttr "joint8.fat" "joint8Fat.i1y";
connectAttr "joint8.fat" "joint8Fat.i1z";
connectAttr "joint8.fatY" "joint8Fat.i2y";
connectAttr "joint8.fatZ" "joint8Fat.i2z";
connectAttr "joint9.fat" "joint9Fat.i1y";
connectAttr "joint9.fat" "joint9Fat.i1z";
connectAttr "joint9.fatY" "joint9Fat.i2y";
connectAttr "joint9.fatZ" "joint9Fat.i2z";
connectAttr "joint10.fat" "joint10Fat.i1y";
connectAttr "joint10.fat" "joint10Fat.i1z";
connectAttr "joint10.fatY" "joint10Fat.i2y";
connectAttr "joint10.fatZ" "joint10Fat.i2z";
connectAttr "joint11.fat" "joint11Fat.i1y";
connectAttr "joint11.fat" "joint11Fat.i1z";
connectAttr "joint11.fatY" "joint11Fat.i2y";
connectAttr "joint11.fatZ" "joint11Fat.i2z";
connectAttr "Head.fat" "HeadFat.i1y";
connectAttr "Head.fat" "HeadFat.i1z";
connectAttr "Head.fatY" "HeadFat.i2y";
connectAttr "Head.fatZ" "HeadFat.i2z";
connectAttr "Neck.fat" "NeckFat.i1y";
connectAttr "Neck.fat" "NeckFat.i1z";
connectAttr "Neck.fatY" "NeckFat.i2y";
connectAttr "Neck.fatZ" "NeckFat.i2z";
connectAttr "Chest.fat" "ChestFat.i1y";
connectAttr "Chest.fat" "ChestFat.i1z";
connectAttr "Chest.fatY" "ChestFat.i2y";
connectAttr "Chest.fatZ" "ChestFat.i2z";
connectAttr "Spine1.fat" "Spine1Fat.i1y";
connectAttr "Spine1.fat" "Spine1Fat.i1z";
connectAttr "Spine1.fatY" "Spine1Fat.i2y";
connectAttr "Spine1.fatZ" "Spine1Fat.i2z";
connectAttr "Root.fat" "RootFat.i1y";
connectAttr "Root.fat" "RootFat.i1z";
connectAttr "Root.fatY" "RootFat.i2y";
connectAttr "Root.fatZ" "RootFat.i2z";
connectAttr "blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "blinn2SG.pa" ":renderPartition.st" -na;
connectAttr "blinn3SG.pa" ":renderPartition.st" -na;
connectAttr "blinn4SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "a:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "aa:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "b:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "a1:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "aa1:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "b1:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "blinn5SG.pa" ":renderPartition.st" -na;
connectAttr "a2:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "blinn6SG.pa" ":renderPartition.st" -na;
connectAttr "a3:blinn5SG.pa" ":renderPartition.st" -na;
connectAttr "aa2:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "a4:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "aa3:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "a5:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "aa4:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "a6:defaultMat.pa" ":renderPartition.st" -na;
connectAttr "blinn7SG.pa" ":renderPartition.st" -na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "blinn7.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "a:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "aa:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "b:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "a1:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "aa1:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "b1:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "a2:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "a3:blinn5SG1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "a3:blinn5SG1BMP2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "a3:blinn5SG1BMU.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "aa2:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "a4:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "aa3:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "a5:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "aa4:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "a6:defaultMat1P2D.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "AdvancedSkeleton_defaultRenderLayer1.msg" ":defaultRenderingList1.r"
		 -na;
connectAttr "AdvancedSkeleton_defaultRenderLayer.msg" ":defaultRenderingList1.r"
		 -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "file3.msg" ":defaultTextureList1.tx" -na;
connectAttr "file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "file5.msg" ":defaultTextureList1.tx" -na;
connectAttr "file6.msg" ":defaultTextureList1.tx" -na;
connectAttr "file7.msg" ":defaultTextureList1.tx" -na;
connectAttr "file8.msg" ":defaultTextureList1.tx" -na;
connectAttr "file9.msg" ":defaultTextureList1.tx" -na;
connectAttr "a:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "aa:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "b:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "a1:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "aa1:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "b1:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "file10.msg" ":defaultTextureList1.tx" -na;
connectAttr "file11.msg" ":defaultTextureList1.tx" -na;
connectAttr "a2:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "file12.msg" ":defaultTextureList1.tx" -na;
connectAttr "a3:blinn5SG1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "a3:blinn5SG1BM.msg" ":defaultTextureList1.tx" -na;
connectAttr "aa2:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "a4:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "aa3:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "a5:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "aa4:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "a6:defaultMat1F.msg" ":defaultTextureList1.tx" -na;
connectAttr "file13.msg" ":defaultTextureList1.tx" -na;
connectAttr "file14.msg" ":defaultTextureList1.tx" -na;
connectAttr "file15.msg" ":defaultTextureList1.tx" -na;
connectAttr "DynParticleRampdynjoint5_M4.msg" ":defaultTextureList1.tx" -na;
connectAttr "DynParticleRampdynjoint4_M3.msg" ":defaultTextureList1.tx" -na;
// End of zb.ma
