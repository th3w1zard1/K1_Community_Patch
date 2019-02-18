////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	This is the Sandral Estate module's OnEnter script. By default, this
	script will destroy the Sandral protocol droid after having entered
	the estate. This will cause the Casus quest to be orphaned if the
	player failed to inform Nurik of his death and handed over the diary.
	The script has been altered so the protocol droid is no longer removed.
	It will only be destroyed during the DS resolution of the Sandral-Matale
	Feud quest. Otherwise, it will remain outside the estate, allowing the
	player to complete the Casus quest even after the Feud quest has been
	resolved.
	
	The latest revision also adds checks for whether the front door of the
	estate is opened and/or unlocked, closing/locking as appropriate.
	
	Updated further to prevent a potential (literal) lockout if the player
	upsets Rahasia and exits the estate.
	
	DP 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////

// Globals
	int intGLOB_1 = 1;
	int intGLOB_2 = 2;
	int intGLOB_3 = 3;
	int intGLOB_4 = 4;
	int intGLOB_5 = 5;
	int intGLOB_6 = 6;
	int intGLOB_7 = 3;
	int intGLOB_8 = 4;
	int intGLOB_9 = 5;
	int intGLOB_10 = 6;
	int intGLOB_11 = 7;
	int intGLOB_12 = 1;
	int intGLOB_13 = 2;
	int intGLOB_14 = 3;
	int intGLOB_15 = 4;
	int intGLOB_16 = 5;
	int intGLOB_17 = 6;
	int intGLOB_18 = 7;
	int intGLOB_19 = 8;
	int intGLOB_20 = 9;
	int intGLOB_21 = 10;
	int intGLOB_22 = 11;
	int intGLOB_23 = 12;
	int intGLOB_24 = 13;
	int intGLOB_25 = 14;
	int intGLOB_26 = 15;
	int intGLOB_27 = 16;
	int intGLOB_28 = 17;
	int intGLOB_29 = 18;
	int intGLOB_30 = 19;
	int intGLOB_31 = 20;
	int intGLOB_32 = 21;
	int intGLOB_33 = 22;
	int intGLOB_34 = 23;
	int intGLOB_35 = 24;
	int intGLOB_36 = 25;
	int intGLOB_37 = 26;
	int intGLOB_38 = 27;
	int intGLOB_39 = 28;
	int intGLOB_40 = 29;
	int intGLOB_41 = 30;
	int intGLOB_42 = 59;
	int intGLOB_43 = 0;
	int intGLOB_44 = 1;
	int intGLOB_45 = 2;
	int intGLOB_46 = 29;
	int intGLOB_47 = 30;
	int intGLOB_48 = 34;
	int intGLOB_49 = 35;
	int intGLOB_50 = 36;
	int intGLOB_51 = 37;
	int intGLOB_52 = 38;
	int intGLOB_53 = 39;
	int intGLOB_54 = 41;
	int intGLOB_55 = 42;
	int intGLOB_56 = 46;
	int intGLOB_57 = 47;
	int intGLOB_58 = 15;
	int intGLOB_59 = 10;
	int intGLOB_60 = 5;
	int intGLOB_61 = 2;
	int intGLOB_62;
	int intGLOB_63;
	int intGLOB_64;
	object objectGLOB_1;
	int intGLOB_65;
	int intGLOB_66;
	int intGLOB_67;
	int intGLOB_68;
	int intGLOB_69;
	int intGLOB_70;
	int intGLOB_71 = 1;
	int intGLOB_72 = 2;
	int intGLOB_73 = 3;
	int intGLOB_74 = 20;
	int intGLOB_75 = 21;
	int intGLOB_76 = 22;
	int intGLOB_77 = 23;
	int intGLOB_78 = 24;
	int intGLOB_79 = 25;
	int intGLOB_80 = 26;
	int intGLOB_81 = 27;
	int intGLOB_82 = 28;
	int intGLOB_83 = 31;
	int intGLOB_84 = 32;
	int intGLOB_85 = 33;
	int intGLOB_86 = 40;
	int intGLOB_87 = 43;
	int intGLOB_88 = 44;
	int intGLOB_89 = 45;
	int intGLOB_90 = 48;
	int intGLOB_91 = 49;
	int intGLOB_92 = 50;
	int intGLOB_93 = 51;
	int intGLOB_94 = 52;
	int intGLOB_95 = 53;
	int intGLOB_96 = 54;
	int intGLOB_97 = 55;
	int intGLOB_98 = 56;
	int intGLOB_99 = 57;
	int intGLOB_100 = 58;
	int intGLOB_101 = 60;
	int intGLOB_102 = 61;
	int intGLOB_103 = 62;
	int intGLOB_104 = 63;
	int intGLOB_105 = 64;
	int intGLOB_106 = 65;
	int intGLOB_107 = 66;
	int intGLOB_108 = 67;
	int intGLOB_109 = 68;
	int intGLOB_110 = 69;
	int intGLOB_111 = 70;
	int intGLOB_112 = 71;
	int intGLOB_113 = 72;
	int intGLOB_114 = 1;
	int intGLOB_115 = 2;
	int intGLOB_116 = 3;
	int intGLOB_117 = 4;
	int intGLOB_118 = 0;
	int intGLOB_119 = 1;
	int intGLOB_120 = 2;
	int intGLOB_121 = 3;
	int intGLOB_122 = 4;
	int intGLOB_123 = 5;
	int intGLOB_124 = 6;
	int intGLOB_125 = 7;
	int intGLOB_126 = 8;
	int intGLOB_127 = 9;
	int intGLOB_128 = 10;
	int intGLOB_129 = 11;
	int intGLOB_130 = 12;
	int intGLOB_131 = 13;
	int intGLOB_132 = 14;
	int intGLOB_133 = 15;
	int intGLOB_134 = 16;
	int intGLOB_135 = 17;
	int intGLOB_136 = 18;
	int intGLOB_137 = 19;
	int intGLOB_138 = 1100;
	int intGLOB_139 = (-6);
	int intGLOB_140 = (-5);
	int intGLOB_141 = (-4);
	int intGLOB_142 = (-2);
	int intGLOB_143 = (-1);
	int intGLOB_144 = 0;
	int intGLOB_145 = 4;
	int intGLOB_146 = 1;
	int intGLOB_147 = 7;
	int intGLOB_148 = 1;
	int intGLOB_149 = 2;
	int intGLOB_150 = 3;
	int intGLOB_151 = 1;
	int intGLOB_152 = 2;
	int intGLOB_153 = 3;
	int intGLOB_154 = 4;
	int intGLOB_155 = 5;
	int intGLOB_156 = 6;
	string stringGLOB_1 = "bastila";
	string stringGLOB_2 = "carth";
	string stringGLOB_3 = "dan13_WP_council";
	string stringGLOB_4 = "g_w_lghtsbr01";
	string stringGLOB_5 = "g_w_lghtsbr03";
	string stringGLOB_6 = "g_w_lghtsbr04";
	string stringGLOB_7 = "dan_wanderhound";

// Prototypes
void sub6(int intParam1);
void sub5(string stringParam1, string stringParam2);
int sub4();
void sub3(object objectParam1, int intParam2, int intParam3);
int sub2();
int sub1(object objectParam1, int intParam2);


void sub6(int intParam1) {
	string string1 = (stringGLOB_7 + IntToString(intParam1));
	location location1 = GetLocation(GetObjectByTag((("WP_" + string1) + "_01"), 0));
	CreateObject(1, string1, location1, 0);
	(intParam1--);
	if ((intParam1 > 0)) {
		sub6(intParam1);
	}
}

void sub5(string stringParam1, string stringParam2) {
	if ((!GetIsObjectValid(GetObjectByTag(stringParam1, 0)))) {
		CreateObject(1, stringParam1, GetLocation(GetObjectByTag((("POST_" + stringParam1) + stringParam2), 0)), 0);
	}
}

int sub4() {
	return (GetGlobalNumber("DAN_ELISE_PLOT") == intGLOB_151);
}

void sub3(object objectParam1, int intParam2, int intParam3) {
	int nLevel = GetHitDice(GetFirstPC());
	if ((intParam3 == 1)) {
		if (((((intParam2 == intGLOB_129) || (intParam2 == intGLOB_134)) || (intParam2 == intGLOB_135)) || (intParam2 == intGLOB_136))) {
			GiveXPToCreature(GetFirstPC(), (nLevel * 15));
		}
		else {
			if ((((intParam2 == intGLOB_130) || (intParam2 == intGLOB_137)) || (intParam2 == intGLOB_133))) {
				GiveXPToCreature(GetFirstPC(), (nLevel * 20));
			}
			else {
				if (((intParam2 == intGLOB_131) || (intParam2 == intGLOB_132))) {
					GiveXPToCreature(GetFirstPC(), (nLevel * 10));
				}
			}
		}
	}
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		if (((intParam3 == 1) || (intParam3 == 0))) {
			SetLocalBoolean(objectParam1, intParam2, intParam3);
		}
	}
}

int sub2() {
	int int1;
	int nLen = GetStringLength(stringGLOB_7);
	object oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
	while (GetIsObjectValid(oAreaObject)) {
		if ((GetStringLeft(GetTag(oAreaObject), nLen) == stringGLOB_7)) {
			(int1++);
		}
		oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
	}
	return int1;
}

int sub1(object objectParam1, int intParam2) {
	int nLocalBool;
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		nLocalBool = GetLocalBoolean(objectParam1, intParam2);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

void main() {
	int int1 = sub1(OBJECT_SELF, 1);
	object oEntering = GetEnteringObject();
	object oSanDoor = GetObjectByTag("dan14ad_door01", 0);
	
	
	//
	// Adding a check for the front door being open, and closing it if so
	//
	if (GetIsOpen(oSanDoor))
		{
			AssignCommand(oSanDoor,ActionCloseDoor(oSanDoor));
		}
	//
	// Locking the front door if the player has previously entered and spoken to Nurik, didn't piss off Rahasia, and it is currently unlocked
	//
	if ((GetGlobalBoolean("DAN_SAND_REFUSE") == TRUE) && (GetGlobalBoolean("DAN_HATE_DONE") == FALSE)) && (GetLocked(oSanDoor) == FALSE))
		{
			AssignCommand(oSanDoor, SetLocked(oSanDoor, TRUE));
		}
	
	
	if ((GetIsPC(oEntering) && (GetLoadFromSaveGame() == 0))) {
		int int5 = (2 - sub2());
		if ((GetGlobalBoolean("DAN_LEAVE_DONE") && (int1 == 0))) {
			sub3(OBJECT_SELF, 1, 1);
			CreateObject(1, "dan14_shen", GetLocation(GetObjectByTag("POST_dan14_shen", 0)), 0);
			CreateObject(1, "dan14_rahasia", GetLocation(GetObjectByTag("POST_dan14_rahasia", 0)), 0);
			int int8;
			object oPdan_swdroid = GetObjectByTag("pdan_swdroid", int8);
			while (GetIsObjectValid(oPdan_swdroid)) {
				DestroyObject(oPdan_swdroid, 0.0, 0, 0.0);
				(int8++);
				oPdan_swdroid = GetObjectByTag("pdan_swdroid", int8);
			}
		}
		if (sub4()) {
			sub5("dan14_c869", "");
			if ((sub1(OBJECT_SELF, intGLOB_125) == 0)) {
				sub3(OBJECT_SELF, intGLOB_125, 1);
				SetEncounterActive(1, GetObjectByTag("dan14ad_c869hound", 0));
			}
		}
		else {
			DestroyObject(GetObjectByTag("dan14_c869", 0), 0.0, 0, 0.0);
		}
		//
		// Commenting out the original section that destroys the Sandral protocol droid if the player has entered and spoken to Nurik 
		//
		//if (GetGlobalBoolean("DAN_SAND_REFUSE")) {
		//	DestroyObject(GetObjectByTag("dan14_sdroid", 0), 0.0, 1, 0.0);
		//}
		if ((int5 > 0)) {
			sub6(int5);
		}
	}
}