//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_darthmala2.dlg in lev_m40ac (Leviathan Hangar Bay).
	
	As part of returning Bastila's equipped gear at the end of the Malak showdown
	on the Leviathan, she now only equips a stunt saber if she doesn't already
	have a saber equipped, in much the same way as Carth is already dealt with
	in the vanilla scene. This is where her gear is actually given back to the
	player. If she has it, the stunt saber is destroyed first to make sure it
	isn't accidentally given to the player.
	
	See also k_plev_bastatk, k_plev_finale1, k_plev_malakmov2, k_plev_pause.
	
	Issue #419: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/419
	
	DP 2021/11/26																*/
//////////////////////////////////////////////////////////////////////////////////

void CP_GiveEquipment(object oNPC) {
	object oItem;
	int nSlot = 10;
	
	while (nSlot >= 0)
		{
			oItem = GetItemInSlot(nSlot, oNPC);
			if (GetIsObjectValid(oItem))
				{
					GiveItem(oItem, GetFirstPC());
				}
			
			// Go in reverse inventory slot order to grab an offhand weapon first.
			nSlot--;
		}
	
	ActionResumeConversation();
}

void main() {
	
	object oBastila = GetObjectByTag("bastila", 0);
	object oMalak = GetObjectByTag("darthmalak400", 0);
	object oBastSaber = GetItemPossessedBy(oBastila, "bast_temp_saber");
	
	ActionPauseConversation();
	
	NoClicksFor(3.25);
	
	CancelCombat(oMalak);
	AssignCommand(oMalak, ClearAllActions());
	
	CancelCombat(oBastila);
	AssignCommand(oBastila, ClearAllActions());
	
	// Destroy Bastila's stunt weapon, if applicable.
	DelayCommand(1.0, DestroyObject(oBastSaber));
	
	// Have Bastila return all her gear.
	DelayCommand(1.5, CP_GiveEquipment(oBastila));
}
