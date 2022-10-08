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
        • We're working as an independent Faction<br/>
            • Few NATO and UNA operatives know of our presence<br/>
            • NATO and UNA have been cooperating<br/>
            • Tura/SFIA forces have attacked UNA personnel<br/>
            • Expect attacks by Tura/SFIA<br/>
            • You may RTB anytime to rearm<br/>
        • Enemy types to expect:<br/>
            • Infantry<br/>
            • Technicals<br/>
            • Few APCs<br/>
            • Prior use of IEDs<br/>
            • SFIA forces stole a helicopter it was last seen circling Bir-Dakhla<br/>
            • Known checkpoints are marked on the map<br/>
            • Check your fire civilians are still in the area<br/>
            • Enemy forces have redeployed into cities you've attack before<br/>
        • Civilians are still in cities check your fire<br/>
<br/>
    Extract UNA members:<br/>
        • Intel Indicates that UNA is in Bir-Dakhla<br/>
        • Considerable defences<br/>
        • Analysts marked the estimated position on the map<br/>
<br/>
    Support:<br/>
        • Supply drop<br/>
            • If called in Tura will most likely respond<br/>
<br/>"+
"";

waitUntil {!isNull player};
player createDiaryRecord ["Diary", ["Briefing",_roles]];
player createDiaryRecord ["Diary", [_mission, _diary_text]];