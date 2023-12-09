//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul403.dlg in lev_m40aa (Leviathan Prison Block).
	
	This is the script that fires the third time a male PC refuses to answer Saul
	during the Leviathan interrogation cutscene, causing Bastila to be tortured.
	It has been tweaked to extend the shot to show her passing out.
	
	See also k_plev_tortbast, k_plev_tortbast3, k_plev_tortcarth, k_plev_tortcarth2,
	k_plev_tortcarth3.
	
	Issue #145: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/145
	
	DP 2023-12-09																*/
//////////////////////////////////////////////////////////////////////////////////

void PrisonerAnim(float fLength) {
	ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, fLength / 3.0);
	ActionPlayAnimation(ANIMATION_LOOPING_HORROR, 1.0, fLength / 3.0);
	ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, fLength / 3.0);
}

void ApplyVFX(object oTarget, object oNPC, float fDuration) {
	AssignCommand(oNPC, PrisonerAnim(fDuration));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING_DARK_S, oTarget, BODY_NODE_HEAD, FALSE), oNPC, fDuration);
}

void Torture(object oTarget, object oNPC, float fDuration) {
	object oSnd = GetObjectByTag("lev40_tortsnd", 0);
	ActionPauseConversation();
	DelayCommand(fDuration + 1.5, ActionResumeConversation());
	NoClicksFor(fDuration + 1.0);
	ApplyVFX(oTarget, oNPC, fDuration);
	SoundObjectPlay(oSnd);
	DelayCommand(fDuration, SoundObjectStop(oSnd));
}

void main() {
	
	object oBastila = GetObjectByTag("bastila", 0);
	
	Torture(GetNearestObjectByTag("lev40_tortcage", oBastila, 1), oBastila, 6.0);
	
	DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSleep(), oBastila, 0.0));
}
