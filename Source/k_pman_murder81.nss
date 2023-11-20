////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_trial.dlg in manm26aa (Manaan Ahto West).
	
	This script fires on the first node of Sunry's trial cutscene. Some duplicated
	commands that were already carried out before the scene started have now been
	removed. The judges get a facing in addition to having their orientation locked.
	
	See also k_pman_26a_aread, k_pman_trial05, k_pman_wit02.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-20																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oSith = GetObjectByTag("man26_sithac");
	object oJudge;
	int nIdx = 1;
	
	oJudge = GetObjectByTag("man26_seljud" + IntToString(nIdx));
	
	while (GetIsObjectValid(oJudge))
		{
			AssignCommand(oJudge, ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("arrest_player_01")))));
			AssignCommand(oJudge, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.1));
			AssignCommand(oJudge, ActionDoCommand(SetLockOrientationInDialog(oJudge, TRUE)));
			
			nIdx++;
			
			oJudge = GetObjectByTag("man26_seljud" + IntToString(nIdx));
		}
	
	SetGlobalNumber("MAN_SELJUD1_STATE", 0);
	SetGlobalNumber("MAN_SELJUD2_STATE", 0);
	SetGlobalNumber("MAN_SELJUD3_STATE", 0);
	SetGlobalNumber("MAN_SELJUD4_STATE", 0);
	SetGlobalNumber("MAN_SELJUD5_STATE", 0);
	
	AssignCommand(oSith, ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("man26_seljud1")))));
	AssignCommand(oSith, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
	AssignCommand(oSith, ActionDoCommand(SetLockOrientationInDialog(oSith, TRUE)));
	
	DelayCommand(3.5, SetDialogPlaceableCamera(6));
}