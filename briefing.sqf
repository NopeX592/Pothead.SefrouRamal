_run_1 = true;
_run_2 = true;

private ["_mission", "_diary_text", "_roles"];
_mission = toUpper (format ["%1",getText (missionconfigfile >> "onLoadName")]);

_diary_text = _mission + "<br/>" + 
format [" Date: %3.%2.%1<br/>",date select 0,date select 1,date select 2]+
format [" Location: %1<br/>",worldName]+
format [" Type: %1<br/>",getText (missionconfigfile >> "Header" >> "gameType")]+
format [" Players: %1-%2<br/>",getNumber (missionconfigfile >> "Header" >> "minPlayers"),getNumber (missionconfigfile >> "Header" >> "maxPlayers")]+
format [" Authors: %1<br/><br/>",getText (missionconfigfile >> "author")]+
"<br/>"+
"FEATURES:<br/>"+
"• Virtual Arsenal<br/>"+
"<br/>"+
"THANKS:<br/>"+
"• Alex for helping me with programming<br/>"+
"";

_roles = "<br/>"+
"Briefing:<br/>
    General:<br/>
    • NATOs Objective:<br/>
        • NATO forces are in the process of encircling the local Airbase<br/>
        • If successful we expect encircled enemy forces to surrender<br/>
        • We're here to support them in any way possible<br/>
    • You're working as military contractors<br/>
        • NATO and UNA have been cooperating<br/>
        • Expect attacks by Tura/SFIA<br/>
        • You may RTB anytime to rearm<br/>
        • Opfor forces have been supporting independent forces<br/>
    • Enemy types to expect:<br/>
        • Infantry<br/>
        • Technicals<br/>
        • Few APCs<br/>
        • Prior use of IEDs<br/>
        • Known Enemy checkpoints are marked on the map<br/>
        • Known Enemy movements are marked on the map<br/>
        • Civilians have remained in contested cities<br/>
    • Your task:<br/>
        • Transport ammo and equipment to Mhamid<br/>
        • Do not drive through M'Semrir<br/>
        • MRAPs have been provided and are outside<br/>
        • Independent forces are known to operate behind our lines<br/>
        • Upon arrival at our base in Mhamid talk to O'Connor<br/>
<br/>"+
"";

waitUntil {!isNull player};
player createDiaryRecord ["Diary", ["Briefing",_roles]];
player createDiaryRecord ["Diary", [_mission, _diary_text]];