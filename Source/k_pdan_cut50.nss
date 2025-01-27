//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_dan15_starmap.dlg in danm15 (Dantooine Ruins).
	
	This script fires in the early nodes of the new DLG for the merged Star Map
	opening scene. It originally fired on dan15_cut01.dlg to make the player
	walk towards the Star Map. It now directs the entire party.
	
	See also k_pdan_cut51, k_pdan_starmap02, k_pdan_starmap05, and cp_dan15_facemap.
	
	Updated 2022-12-15 to tweak the location positions to match the adjustment
	of the Star Map position to the centerline of the room.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	Issue #656: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/656
	
	DP 2019-08-01 / DP 2022-12-15												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(145.42,187.36,4.42), 55.00);
	location lBast = Location(Vector(149.64,187.37,4.42), 125.00);
	location lPM2 = Location(Vector(147.52,185.07,4.42), 90.00);
	
	NoClicksFor(4.0);
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionMoveToLocation(lPC, FALSE));
	
	AssignCommand(oBast, ClearAllActions());
	DelayCommand(1.0, AssignCommand(oBast, ActionMoveToLocation(lBast, FALSE)));
	
	if (GetTag(oPM1) != "bastila")
		{
			AssignCommand(oPM1, ClearAllActions());
			DelayCommand(1.0, AssignCommand(oPM1, ActionMoveToLocation(lPM2, FALSE)));
		}
	
	if (GetTag(oPM2) != "bastila")
		{
			AssignCommand(oPM2, ClearAllActions());
			DelayCommand(1.0, AssignCommand(oPM2, ActionMoveToLocation(lPM2, FALSE)));
		}
}
