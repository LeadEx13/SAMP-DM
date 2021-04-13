#include <a_samp>

#define COLOR_RED 0xAA3333AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_YELLOW 0xFFFF00AA

new bool:IsPlayerSpec[MAX_PLAYERS];
new Killer[MAX_PLAYERS];

public OnFilterScriptInit(){
print("\n--------------------------------------");
print(" Kill Spectating by Deadly[B]oy");
print("--------------------------------------\n");
return 1;}

public OnPlayerSpawn(playerid){
if(IsPlayerSpec[playerid]){
TogglePlayerSpectating(playerid,true);
PlayerSpectatePlayer(playerid,Killer[playerid]);
SendClientMessage(playerid,COLOR_YELLOW,".לכיבוי מצלמת ההרג לחץ על מקש רווח");}
return 1;}

public OnPlayerDeath(playerid, killerid, reason){
if(killerid!=INVALID_PLAYER_ID)IsPlayerSpec[playerid]=true,Killer[playerid]=killerid;
return 1;}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
if(IsKeyJustDown(KEY_SPRINT,newkeys,oldkeys)&&IsPlayerSpec[playerid]){
IsPlayerSpec[playerid]=false;
TogglePlayerSpectating(playerid,false);
SetCameraBehindPlayer(playerid);
PlayerPlaySound(playerid,1056,0,0,0);
OnPlayerSpawn(playerid);}
return 1;}

IsKeyJustDown(key,newkeys,oldkeys){
if((newkeys&key)&&!(oldkeys&key))return 1;
return 0;}
