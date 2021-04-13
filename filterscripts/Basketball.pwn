#include <a_samp>
#include <core>
#include <float>

new glob0[500];

new glob7D0[500];

new globFA0;

new globFA4;

new globFA8;

new globFAC;

new globFB0;


public OnFilterScriptInit()
{
	globFA8 = 999;
	DestroyObject(globFA0);
	globFA0 = CreateObject(2114, 2782.3027, -2019.0827, 13.5546 - 0.8, 0.0, 0.0, 96.0, 0);
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnObjectMoved(objectid)
{
	new var0 = globFA8;
	if(globFAC == 2)
	{
		BallDown2(var0);
		return 1;
	}
	if(globFAC == 3)
	{
		BallDown3(var0);
		return 1;
	}
	if(globFAC == 4)
	{
		BallDown4(var0);
		return 1;
	}
	if(globFAC == 5)
	{
		BallDown5(var0);
		return 1;
	}
	if(globFAC == 6)
	{
		ApplyAnimation(var0, "BSKTBALL", "BBALL_walk", 4.0999, 1, 1, 1, 1, 1, 0);
		glob0[var0] = 1;
		glob7D0[var0] = 0;
	}
	if(globFB0 == 1)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		GetObjectPos(globFA0, var1, var2, var3);
		MoveObject(globFA0, var1, var2, 1.2 + var3, 4.0);
		globFB0 = 2;
	}
	else if(globFB0 == 2)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		GetObjectPos(globFA0, var1, var2, var3);
		MoveObject(globFA0, var1, var2, var3 - 1.2, 4.0);
		globFB0 = 3;
	}
	else if(globFB0 == 3)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		GetObjectPos(globFA0, var1, var2, var3);
		MoveObject(globFA0, var1, var2, 0.8 + var3, 3.0);
		globFB0 = 4;
	}
	else if(globFB0 == 4)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		GetObjectPos(globFA0, var1, var2, var3);
		MoveObject(globFA0, var1, var2, var3 - 0.8, 3.0);
		globFB0 = 5;
	}
	else if(globFB0 == 5)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		GetObjectPos(globFA0, var1, var2, var3);
		MoveObject(globFA0, var1, var2, 0.5 + var3, 2.0);
		globFB0 = 6;
	}
	else if(globFB0 == 6)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		GetObjectPos(globFA0, var1, var2, var3);
		MoveObject(globFA0, var1, var2, var3 - 0.5, 2.0);
		globFB0 = 7;
	}
	else if(globFB0 == 7)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		GetObjectPos(globFA0, var1, var2, var3);
		MoveObject(globFA0, var1, var2, 0.2 + var3, 1.0);
		globFB0 = 8;
	}
	else if(globFB0 == 8)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		GetObjectPos(globFA0, var1, var2, var3);
		MoveObject(globFA0, var1, var2, var3 - 0.2, 1.0);
		globFB0 = 0;
	}
	if(!glob0[var0])
	{
		return 1;
	}
	new var1 = 0, var2 = 0, var3 = 0;
	GetPlayerKeys(var0, var1, var2, var3);
	if(glob7D0[var0])
	{
		switch(globFA4) {
			case 0:
				globFA4 = 1;
				new Float:var4 = 0.0, Float:var5 = 0.0, Float:var6 = 0.0;
				GetPlayerPos(var0, var4, var5, var6);
				StopObject(globFA0);
				new Float:var7 = 0.0, Float:var8 = 0.0;
				function5D3C(var0, var7, var8, 0.4);
				MoveObject(globFA0, var7, var8, 0.1 + var6, 5.5);
			case 1:
				globFA4 = 0;
				new Float:var4 = 0.0, Float:var5 = 0.0, Float:var6 = 0.0;
				GetPlayerPos(var0, var4, var5, var6);
				StopObject(globFA0);
				new Float:var7 = 0.0, Float:var8 = 0.0;
				function5D3C(var0, var7, var8, 0.4);
				MoveObject(globFA0, var7, var8, var6 - 0.8, 5.5);
		}
		return 1;
	}
	if(var1 & 8)
	{
		ApplyAnimation(var0, "BSKTBALL", "BBALL_run", 4.0999, 1, 1, 1, 1, 1, 0);
		switch(globFA4) {
			case 0:
				globFA4 = 1;
				new Float:var4 = 0.0, Float:var5 = 0.0, Float:var6 = 0.0;
				GetPlayerPos(var0, var4, var5, var6);
				StopObject(globFA0);
				new Float:var7 = 0.0, Float:var8 = 0.0;
				function5D3C(var0, var7, var8, 1.5);
				MoveObject(globFA0, var7, var8, 0.1 + var6, 8.0);
			case 1:
				globFA4 = 0;
				new Float:var4 = 0.0, Float:var5 = 0.0, Float:var6 = 0.0;
				GetPlayerPos(var0, var4, var5, var6);
				StopObject(globFA0);
				new Float:var7 = 0.0, Float:var8 = 0.0;
				function5D3C(var0, var7, var8, 1.5);
				MoveObject(globFA0, var7, var8, var6 - 0.8, 8.0);
		}
		return 1;
	}
	ApplyAnimation(var0, "BSKTBALL", "BBALL_walk", 4.0999, 1, 1, 1, 1, 1, 0);
	switch(globFA4) {
		case 0:
			globFA4 = 1;
			new Float:var4 = 0.0, Float:var5 = 0.0, Float:var6 = 0.0;
			GetPlayerPos(var0, var4, var5, var6);
			StopObject(globFA0);
			new Float:var7 = 0.0, Float:var8 = 0.0;
			function5D3C(var0, var7, var8, 1.2);
			MoveObject(globFA0, var7, var8, 0.1 + var6, 5.0);
		case 1:
			globFA4 = 0;
			new Float:var4 = 0.0, Float:var5 = 0.0, Float:var6 = 0.0;
			GetPlayerPos(var0, var4, var5, var6);
			StopObject(globFA0);
			new Float:var7 = 0.0, Float:var8 = 0.0;
			function5D3C(var0, var7, var8, 1.2);
			MoveObject(globFA0, var7, var8, var6 - 0.8, 5.0);
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	glob0[playerid] = 0;
	glob7D0[playerid] = 0;
	if(glob0[playerid])
	{
		globFA8 = 999;
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	glob0[playerid] = 0;
	if(glob0[playerid])
	{
		globFA8 = 999;
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text)
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext)
{
	if(!strcmp("/ball", cmdtext, true, 6))
	{
		new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
		GetPlayerPos(playerid, var0, var1, var2);
		DestroyObject(globFA0);
		globFA0 = CreateObject(2114, var0 + random(3), var1 + random(3), var2 - 0.8, 0.0, 0.0, 96.0, 0);
		return 1;
	}
	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & 2 && !(oldkeys & 2) && !IsPlayerInAnyVehicle(playerid))
	{
		if(glob0[playerid])
		{
			ApplyAnimation(playerid, "BSKTBALL", "BBALL_idleloop", 4.0999, 1, 1, 1, 1, 1, 0);
		}
		else
		{
			ApplyAnimation(playerid, "BSKTBALL", "BBALL_def_loop", 4.0, 1, 0, 0, 0, 0, 0);
		}
		glob7D0[playerid] = 1;
	}
	if(!(newkeys & 2) && oldkeys & 2 && !IsPlayerInAnyVehicle(playerid))
	{
		ClearAnimations(playerid, 0);
		glob7D0[playerid] = 0;
	}
	if(newkeys & 4 && !IsPlayerInAnyVehicle(playerid))
	{
		if(!glob0[playerid])
		{
			new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
			GetObjectPos(globFA0, var0, var1, var2);
			if(IsPlayerInRangeOfPoint(playerid, 1069547520, var0, var1, var2))
			{
				glob0[playerid] = 1;
				ApplyAnimation(playerid, "BSKTBALL", "BBALL_pickup", 4.0, 0, 0, 0, 0, 0, 0);
				if(999 != globFA8)
				{
					glob0[globFA8] = 0;
					ClearAnimations(globFA8, 0);
					ApplyAnimation(globFA8, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0, 0);
					ApplyAnimation(playerid, "BSKTBALL", "BBALL_walk", 4.0999, 1, 1, 1, 1, 1, 0);
				}
				globFA8 = playerid;
				globFA4 = 1;
				new Float:var3 = 0.0, Float:var4 = 0.0;
				function5D3C(playerid, var3, var4, 0.8);
				GetPlayerPos(playerid, var0, var1, var2);
				StopObject(globFA0);
				MoveObject(globFA0, var3, var4, var2, 2.5);
				glob7D0[playerid] = 0;
				globFB0 = 0;
			}
		}
		else
		{
			if(IsPlayerInRangeOfPoint(playerid, 1073741824, 1160689761, 3304879024, 1096343565))
			{
				MoveObject(globFA0, 2794.9611, -2019.5416, 15.5074, 7.5);
				SetPlayerPos(playerid, 2795.5236, -2019.6153, 13.5546);
				ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 0, 0, 0);
				glob0[playerid] = 0;
				SetTimerEx("ClearAnim", 1100, false, "d", playerid);
				SetTimerEx("BallDown2", 1100, false, "d", playerid);
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 1082130432, 1160689761, 3304879024, 1096343565) && function3DE8(playerid, 20.0, 2795.5236, -2019.6153, 1096343565))
			{
				new var0 = random(1);
				if(!var0)
				{
					MoveObject(globFA0, 2794.9611, -2019.5416, 15.5074, 10.5 + random(4));
					ApplyAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 0, 0, 0);
					globFAC = 2;
					glob0[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid);
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 1088421888, 1160689761, 3304879024, 1096343565) && function3DE8(playerid, 20.0, 2795.5236, -2019.6153, 1096343565))
			{
				new var0 = random(2);
				if(!var0)
				{
					MoveObject(globFA0, 2794.9611, -2019.5416, 15.5074, 11.0 + random(4));
					ApplyAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 0, 0, 0);
					globFAC = 2;
					glob0[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid);
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 1092616192, 1160689761, 3304879024, 1096343565) && function3DE8(playerid, 20.0, 2795.5236, -2019.6153, 1096343565))
			{
				new var0 = random(3);
				if(!var0)
				{
					MoveObject(globFA0, 2794.9611, -2019.5416, 15.5074, 11.5 + random(4));
					ApplyAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 0, 0, 0);
					globFAC = 2;
					glob0[playerid] = 0;
					return 1;
				}
				ShootMiss(playerid);
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 1073741824, 1160578527, 3304879427, 1096343565))
			{
				MoveObject(globFA0, 2768.6289, -2019.7227, 15.6287, 7.5);
				SetPlayerPos(playerid, 2768.3669, -2019.6645, 13.5546);
				ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 0, 0, 0);
				glob0[playerid] = 0;
				SetTimerEx("ClearAnim", 800, false, "d", playerid);
				SetTimerEx("BallDown3", 1100, false, "d", playerid);
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 1082130432, 1160578527, 3304879427, 1096343565) && function3DE8(playerid, 20.0, 2768.3669, -2019.6645, 1096343565))
			{
				new var0 = random(1);
				if(!var0)
				{
					MoveObject(globFA0, 2768.6289, -2019.7227, 15.6287, 10.5 + random(4));
					ApplyAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 0, 0, 0);
					globFAC = 3;
					glob0[playerid] = 0;
					return 1;
				}
				ShootMiss2(playerid);
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 1088421888, 1160578527, 3304879427, 1096343565) && function3DE8(playerid, 20.0, 2768.3669, -2019.6645, 1096343565))
			{
				new var0 = random(2);
				if(!var0)
				{
					MoveObject(globFA0, 2768.6289, -2019.7227, 15.6287, 11.0 + random(4));
					ApplyAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 0, 0, 0);
					globFAC = 3;
					glob0[playerid] = 0;
					return 1;
				}
				ShootMiss2(playerid);
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 1092616192, 1160578527, 3304879427, 1096343565) && function3DE8(playerid, 20.0, 2768.3669, -2019.6645, 1096343565))
			{
				new var0 = random(3);
				if(!var0)
				{
					MoveObject(globFA0, 2768.6289, -2019.7227, 15.6287, 11.5 + random(4));
					ApplyAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 0, 0, 0);
					globFAC = 3;
					glob0[playerid] = 0;
					return 1;
				}
				ShootMiss2(playerid);
				return 1;
			}
			for(new var0 = 0; var0 < 500; var0++)
			{
				if(IsPlayerConnected(var0))
				{
					if(function4664(playerid, var0, 15.0))
					{
						new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
						GetPlayerPos(var0, var1, var2, var3);
						if(IsPlayerInRangeOfPoint(playerid, 1101004800, var1, var2, var3))
						{
							globFA8 = var0;
							glob0[playerid] = 0;
							ClearAnimations(playerid, 0);
							ApplyAnimation(playerid, "BSKTBALL", "BBALL_def_loop", 4.0, 1, 0, 0, 0, 0, 0);
							SetTimerEx("ClearAnim", 700, false, "d", playerid);
							MoveObject(globFA0, var1, var2, var3, random(4) + 13);
							glob7D0[var0] = 0;
							globFAC = 6;
							ApplyAnimation(var0, "BSKTBALL", "BBALL_def_loop", 4.0, 1, 0, 0, 0, 0, 0);
							return 1;
						}
					}
				}
			}
			new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
			GetPlayerPos(playerid, var0, var1, var2);
			glob0[playerid] = 0;
			new Float:var3 = 0.0, Float:var4 = 0.0;
			function5D3C(playerid, var3, var4, 6.0);
			SetTimerEx("BallDown", 600, false, "df", playerid, var2);
			MoveObject(globFA0, var3, var4, var2 + random(8) + 3, 10.0 + random(4));
			ApplyAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 0, 0, 0);
			globFAC = 0;
		}
	}
	return 1;
}

function3DE8(playerid, Float:arg1, Float:arg2, Float:arg3)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0, var4 = 0;
	if(!IsPlayerConnected(playerid))
	{
		return 0;
	}
	GetPlayerPos(playerid, var0, var1, var2);
	GetPlayerFacingAngle(playerid, var3);
	if(var1 > arg3)
	{
		var4 = (-acos((var0 - arg2) / floatsqroot(((var0 - arg2) * (var0 - arg2)) + ((var1 - arg3) * (var1 - arg3))))) - 90.0;
	}
	else if(var1 < arg3 && var0 < arg2)
	{
		var4 = acos((var0 - arg2) / floatsqroot(((var0 - arg2) * (var0 - arg2)) + ((var1 - arg3) * (var1 - arg3)))) - 450.0;
	}
	else if(var1 < arg3)
	{
		var4 = acos((var0 - arg2) / floatsqroot(((var0 - arg2) * (var0 - arg2)) + ((var1 - arg3) * (var1 - arg3)))) - 90.0;
	}
	if(function4F7C(-var4, var3, arg1))
	{
		return 1;
	}
	return 0;
}

function4664(playerid, playerid2, Float:arg2)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0, Float:var4 = 0.0, Float:var5 = 0.0, Float:var6 = 0.0, var7 = 0;
	if(!IsPlayerConnected(playerid) || !IsPlayerConnected(playerid2))
	{
		return 0;
	}
	GetPlayerPos(playerid2, var0, var1, var2);
	GetPlayerPos(playerid, var4, var5, var6);
	GetPlayerFacingAngle(playerid, var3);
	if(var5 > var1)
	{
		var7 = (-acos((var4 - var0) / floatsqroot(((var4 - var0) * (var4 - var0)) + ((var5 - var1) * (var5 - var1))))) - 90.0;
	}
	else if(var5 < var1 && var4 < var0)
	{
		var7 = acos((var4 - var0) / floatsqroot(((var4 - var0) * (var4 - var0)) + ((var5 - var1) * (var5 - var1)))) - 450.0;
	}
	else if(var5 < var1)
	{
		var7 = acos((var4 - var0) / floatsqroot(((var4 - var0) * (var4 - var0)) + ((var5 - var1) * (var5 - var1)))) - 90.0;
	}
	if(function4F7C(-var7, var3, arg2))
	{
		return 1;
	}
	return 0;
}

function4F7C(Float:arg0, Float:arg1, Float:arg2)
{
	arg0 = arg0 - arg1;
	if(arg0 < arg2 && arg0 > -arg2)
	{
		return 1;
	}
	return 0;
}

public BallDown(playerid, Float:arg1)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetObjectPos(globFA0, var0, var1, var2);
	new Float:var3 = 0.0;
	new Float:var4 = 0.0, Float:var5 = 0.0;
	GetPlayerPos(playerid, var4, var5, var3);
	GetPlayerFacingAngle(playerid, var3);
	var4 = var4 + (floatsin(-var3, 1) * 16);
	var5 = var5 + (floatcos(-var3, 1) * 16);
	MoveObject(globFA0, var4, var5, arg1 - 0.8, 10.0 + random(3));
	globFA8 = 999;
	globFAC = 0;
	globFB0 = 1;
	return 1;
}

public BallDown2(playerid)
{
	MoveObject(globFA0, 2795.5236, -2019.6153, 13.5546 - 0.8, 10.0 + random(3));
	globFA8 = 999;
	globFAC = 0;
	GameTextForPlayer(playerid, "Goal :D!", 3000, 3);
	globFB0 = 1;
	return 1;
}

public BallDown3(playerid)
{
	MoveObject(globFA0, 2768.3669, -2019.6645, 13.5546 - 0.8, 10.0 + random(3));
	globFA8 = 999;
	globFAC = 0;
	GameTextForPlayer(playerid, "Goal :D!", 3000, 3);
	globFB0 = 1;
	return 1;
}

public BallDown4(playerid)
{
	MoveObject(globFA0, 2795.5236 + random(5), -2019.6153 + random(5), 13.5546 - 0.8, 10.0 + random(3));
	globFA8 = 999;
	globFAC = 0;
	GameTextForPlayer(playerid, "Missed :(!", 3000, 3);
	globFB0 = 1;
	return 1;
}

public BallDown5(playerid)
{
	MoveObject(globFA0, 2768.3669 + random(5), -2019.6645 + random(5), 13.5546 - 0.8, 10.0 + random(3));
	globFA8 = 999;
	globFAC = 0;
	GameTextForPlayer(playerid, "Missed :(!", 3000, 3);
	globFB0 = 1;
	return 1;
}

public ShootMiss(playerid)
{
	MoveObject(globFA0, 2794.9611 + random(2), -2019.5416 + random(2), 15.5074 + random(2), 12.5 + random(4));
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 0, 0, 0);
	globFAC = 4;
	glob0[playerid] = 0;
	return 1;
}

public ShootMiss2(playerid)
{
	MoveObject(globFA0, 2768.6289 + random(2), -2019.7227 + random(2), 15.6287 + random(2), 12.5 + random(4));
	ApplyAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 0, 0, 0);
	globFAC = 5;
	glob0[playerid] = 0;
	return 1;
}

public ClearAnim(playerid)
{
	ClearAnimations(playerid, 0);
	return 1;
}

function5D3C(playerid, &Float:arg1, &Float:arg2, Float:arg3)
{
	new Float:var0 = 0.0;
	GetPlayerPos(playerid, arg1, arg2, var0);
	GetPlayerFacingAngle(playerid, var0);
	if(GetPlayerVehicleID(playerid))
	{
		GetVehicleZAngle(GetPlayerVehicleID(playerid), var0);
	}
	arg1 = arg1 + (arg3 * floatsin(-var0, 1));
	arg2 = arg2 + (arg3 * floatcos(-var0, 1));
	return 0;
}

