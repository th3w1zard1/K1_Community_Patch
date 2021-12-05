//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    UserDefine for kas_xor2.utc / kas_xor3.utc in kas_m22aa (Kashyyyk Landing
	Pad), korr_m33aa (Korriban Dreshdae), manm26ad (Manaan Docking Bay),
	tat_m17ab (Tatooine Docking Bay).
	
    This is the OUD for Xor's two thugs in all eligible landing bay modules. The
	OnDeath event fires the post-combat scene if Xor was taken down to his minimum
	HP before the two mooks were killed. The original could seemingly fail to fire
	in some cases, resulting in the quest breaking, so it has tweaked to hopefully
	prevent that.
	
	See also cp_xor_ptyjmpend, k_kas_xorattack, k_kas_xor_user.

	Issue #8: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/8
	
	Issue #397: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/397
	
	DP 2021-12-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void CP_ClearNPC(object oNPC) {
	CancelCombat(oNPC);
	AssignCommand(oNPC, ClearAllEffects());
	AssignCommand(oNPC, ClearAllActions());
}

void main() {
	
	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oXor = GetObjectByTag("kas_xor1", 0);
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 1001) // HEARTBEAT
		{

		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{

		}
	else if (nUser == 1007) // DEATH
		{
			object oOtherMook;
			
			if (GetTag(OBJECT_SELF) == "kas_xor2")
				{
					oOtherMook = GetObjectByTag("kas_xor3", 0);
				}
				else
					{
						oOtherMook = GetObjectByTag("kas_xor2", 0);
					}
			
			if (!GetIsObjectValid(oOtherMook) && UT_GetTalkedToBooleanFlag(oXor))
				{
					SetGlobalFadeOut();
					
					NoClicksFor(1.0);
					
					SetPartyLeader(NPC_PLAYER);
					
					CP_ClearNPC(oPM0);
					CP_ClearNPC(oPM1);
					CP_ClearNPC(oPM2);
					
					DelayCommand(1.0, AssignCommand(GetObjectByTag("invis_xor_conv", 0), ActionStartConversation(OBJECT_SELF, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
				}
		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
	else if (nUser == HOSTILE_RETREAT)
		{
			UT_ReturnToBase("wp_homebase");
		}
}
