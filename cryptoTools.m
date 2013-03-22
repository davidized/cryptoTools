(* ::Package:: *)

BeginPackage["cryptoTools`"];

cryptoTools::usage = "";

(* Analysis Functions *)
freqAnalysis::usage = "freqAnalysis[cryptoText] still needs documentation.";
freqAnalysisNum::usage = "freqAnalysisNum[cryptoText] still needs documentation.";
kappaIC::usage = "kappaIC[text, shift, c] still needs documentation.";
kappaICTable::usage = "kappaICTable[text, maxShifts, c] still needs documentation.";
kappaICPlot::usage = "kappaICPlot[text, maxShifts, c] still needs documentation.";
deltaIC::usage = "deltaIC[text, c] still needs documentation.";
deltaBarIC::usage = "deltaBarIC[text, keyLength, c, letters] still needs documentation.";
deltaBarICTable::usage = "deltaBarICTable[text, maxKeyLength, c, letters] still needs documentation.";
deltaBarICPlot::usage = "deltaBarICPlot[text, maxKeyLength, c, letters] still needs documentation.";

(* Cryptosystems *)
caesarShiftE::usage = "caesarShiftE[plainText, shift] and caesarShiftD[cipherText, shift] still need documentation.";
caesarShiftD::usage = caesarShiftE::usage;
simpleSubE::usage = "simpleSubE[plainText, cipherKey, ignoreCase, plainKey] and simpleSubD[plainText, cipherKey, ignoreCase, plainKey] still need documentation.";
simpleSubD::usage = simpleSubE::usage;

(* Utilities *)
numToLetter::usage = "numToLetter[num, letters] still needs documentation";
shiftChar::usage = "shiftChar[c, shift] still needs documentation";
shiftString::usage = "shiftString[text, shift] still needs documentation";

Begin["`Private`"];
(* Utiltites *)
numToLetter[num_,letters_:CharacterRange["a","z"]]:=letters[[num]]
shiftChar[c_, shift_] :=FromCharacterCode[Mod[ToCharacterCode[c]-If[UpperCaseQ[c],65,97]+shift,26]+If[UpperCaseQ[c],65,97]]
shiftString[text_, shift_]:=StringJoin[Table[If[LetterQ[c],shiftChar[c, shift],c],{c,Characters[text]}]]

(* Analysis *)
freqAnalysis[cryptoText_] := Block[{chars, counts},chars=Sort[DeleteDuplicates[StringCases[cryptoText,_?LetterQ]]];{chars, counts=ParallelTable[StringCount[cryptoText,l],{l,chars}], Table[N[i/Total[counts],2],{i,counts}]}] //TableForm
freqAnalysisNum[cryptoText_]:=Block[{nums,counts}, nums=Sort[DeleteDuplicates[StringCases[cryptoText, _?DigitQ]]]; {nums, counts= ParallelTable[StringCount[cryptoText,n],{n,nums}], Table[N[i/Total[counts],2],{i,counts}]}] //TableForm
kappaIC[text_,shift_,c_:26]:= Module[{textL=Select[Characters[ToUpperCase[text]],LetterQ]},Divide[Sum[If[textL[[i]]==RotateRight[textL,shift][[i]], 1, 0],{i,1,Length[textL]}],(Length[textL]/c)]] //N
kappaICTable[text_, maxShifts_, c_: 26] := ParallelTable[{shift, kappaIC[text, shift, c]}, {shift, 1, maxShifts}] // TableForm
kappaICPlot[text_,maxShifts_,c_:26]:=BarChart[ParallelTable[kappaIC[text,shift,c],{shift,1,maxShifts}],{ChartLabels->Placed[Range[1,maxShifts],Below],AxesLabel->{"Shift","kappaIC"}}]
deltaIC[text_,c_:26,letters_:CharacterRange["a","z"]]:=Module[{textL=Select[Characters[ToLowerCase[text]],LetterQ]},Divide[Sum[Count[textL,numToLetter[l,letters]]*(Count[textL,numToLetter[l,letters]]-1),{l,1,c}],((Length[textL]*(Length[textL]-1))/c)]] //N
deltaBarIC[text_,keyLength_,c_:26,letters_:CharacterRange["a","z"]]:= Module[{textM=Partition[Select[Characters[ToLowerCase[text]],LetterQ],keyLength]},Mean[Table[deltaIC[StringJoin[textM[[All,k]]],c,letters],{k,1,keyLength}]]]
deltaBarICTable[text_,maxKeyLength_,c_:26,letters_:CharacterRange["a","z"]]:=ParallelTable[{keyLength,deltaBarIC[text,keyLength,c,letters]},{keyLength,1,maxKeyLength}] //TableForm
deltaBarICPlot[text_,maxKeyLength_,c_:26,letters_:CharacterRange["a","z"]]:=BarChart[ParallelTable[deltaBarIC[text,keyLength,c,letters],{keyLength, 1,maxKeyLength}],{ChartLabels->Placed[Range[1,maxKeyLength],Below],AxesLabel->{"Key Length","deltaBarIC"}}]

(* Cryptosystems *)
caesarShiftE[plainText_, shift_]:=ToUpperCase[shiftString[plainText,shift]]
caesarShiftD[cipherText_, shift_]:=ToLowerCase[shiftString[cipherText,-shift]]
simpleSubE[plainText_,cipherKey_,ignoreCase_:True, plainKey_:"abcdefghijklmnopqrstuvwxyz"]:=StringReplace[plainText,Inner[Rule,Characters[plainKey],Characters[cipherKey],List],IgnoreCase->ignoreCase]
simpleSubD[cipherText_,cipherKey_,ignoreCase_:True, plainKey_:"abcdefghijklmnopqrstuvwxyz"]:=StringReplace[cipherText,Inner[Rule,Characters[cipherKey],Characters[plainKey],List],IgnoreCase->ignoreCase]

End[];
EndPackage[];
