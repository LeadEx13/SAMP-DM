//RCXD By Deadly[B]oy

#include <a_samp>
#include <FAC>

#define yellow	0xFFFF00AA
#define green	0x16EB43FF
#define red		0xFF0000AA



forward DestroyRC(playerid);

new RC[MAX_PLAYERS],TimerRC[MAX_PLAYERS];
new bool:GotRC[MAX_PLAYERS],bool:InRC[MAX_PLAYERS];
new Float:Px[MAX_PLAYERS],Float:Py[MAX_PLAYERS],Float:Pz[MAX_PLAYERS],Float:Pa[MAX_PLAYERS];
public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" RCXD by EscaPe - Loaded.");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	print("\n--------------------------------------");
	print(" RCXD by EsCaPe - Unloaded.");
	print("--------------------------------------\n");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	GotRC[playerid]=false,InRC[playerid]=false;
	DestroyVehicle(RC[playerid]);
	KillTimer(TimerRC[playerid]);
}

public OnPlayerDeath(playerid, killerid, reason)
{
	for(new i; i<GetMaxPlayers(); i++)if(InRC[i])
	{
	    KillTimer(TimerRC[i]);
	    DestroyRC(i);
	    break;
	}
}

public OnVehicleDeath(vehicleid, killerid)
{
	for(new i; i<GetMaxPlayers(); i++)if(RC[i] == vehicleid)
	{
	    KillTimer(TimerRC[i]);
	    DestroyRC(i);
	    break;
	}
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256],tmp[256],idx;
	cmd = strtok(cmdtext,idx);
	if(!strcmp(cmd,"/RCXD",true))
	{
	    tmp = strtok(cmdtext,idx);
	    if(!strlen(tmp))return SendClientMessage(playerid,yellow,"איך להשתמש: /RCXD [Buy/Use]");
	    if(!strcmp(tmp,"Buy",true))
	    {
	        if(GotRC[playerid])return SendClientMessage(playerid,red,".RCXD יש לך כבר");
	        if(GetPlayerMoney(playerid)<2000)
	        {
	            new string[128];
	            format(string, sizeof(string), "($%d)אין לך מספיק כסף",2000);
	            return SendClientMessage(playerid,red,string);
	        }
	        GotRC[playerid]=true;
	        GivePlayerMoney(playerid,-2000);
	        return SendClientMessage(playerid,red,"/RCXD Use:בישביל להשתמש .RCXD קניתה");
	    }
	    if(!strcmp(tmp,"Use",true))
	    {
	        if(!GotRC[playerid])return SendClientMessage(playerid,red,"/RCXD Buy :RCXDאין לך");
	        if(InRC[playerid])return SendClientMessage(playerid,red,"RCXD-אתה כבר ב");
	        SendClientMessage(playerid,green,"בישביל לפוצץ אותו לחצו על התקפה | RCXD מופעל.");
	        GotRC[playerid]=false;
	        InRC[playerid]=true;
	        GetPlayerPos(playerid,Px[playerid],Py[playerid],Pz[playerid]);
	        GetPlayerFacingAngle(playerid,Pa[playerid]);
	        RC[playerid]=CreateVehicle(441,Px[playerid],Py[playerid],Pz[playerid],Pa[playerid],-1,-1,0);
	        PutPlayerInVehicle(playerid,RC[playerid],0);
	        TimerRC[playerid]=SetTimerEx("DestroyRC",120000,0,"%d",playerid);
	    }
	}
	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsKeyJustDown(KEY_FIRE,newkeys,oldkeys) && InRC[playerid])
	{
		KillTimer(TimerRC[playerid]);
		DestroyRC(playerid);
	}
}

public DestroyRC(playerid)
{
	new Float:x,Float:y,Float:z;
	GetVehiclePos(RC[playerid],x,y,z);
	SetPlayerPos(playerid,Px[playerid],Py[playerid],Pz[playerid]);
	SetPlayerFacingAngle(playerid,Pa[playerid]);
	DestroyVehicle(RC[playerid]);
    CreateExplosion(x,y,z,2,15);
    InRC[playerid]=false;
}

IsKeyJustDown(key,newkeys,oldkeys)
{
	if((newkeys & key) && !(oldkeys & key))return true;
	return false;
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

