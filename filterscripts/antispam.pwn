#include <a_samp>
#include <dini>
#define  White       0xFFFFFFAA
new aaa[MAX_PLAYERS];
new spamer[MAX_PLAYERS];
new Warningchet[MAX_PLAYERS];
//------------------------------------------------------------------------------
public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Anti Spam System By Eli(DisPlay/Eli12332100)");
	print("--------------------------------------\n");
	return 1;
}
//------------------------------------------------------------------------------
public OnPlayerConnect(playerid)
{
	spamer[playerid] = 0;
	Warningchet[playerid] = 0;
	return 1;
}
//------------------------------------------------------------------------------
public OnPlayerText(playerid, text[])
{
	if(spamer[playerid] == 1 && !IsPlayerAdmin(playerid))
	{
	    SendClientMessage(playerid ,0xFFFFFFAA, "נא לא להציף את הצאט");
	    Warningchet[playerid]++;
		return 0;
	}
 	aaa[playerid] = SetTimerEx("spamchet", 1000*2, 0, "d", playerid);
 	spamer[playerid] = 1;
	return 1;
}
//------------------------------------------------------------------------------
forward spamchet(playerid);
public spamchet(playerid)
{
    spamer[playerid] = 0;
    KillTimer(aaa[playerid]);
	return 1;
}
//------------------------------------------------------------------------------

stock GetName(playerid)
{
    new Name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, Name, sizeof(Name));
    return Name;
}

