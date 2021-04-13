	//By Snir SofeR1994
	#include <a_samp>
	#include "../include/gl_common.inc"
	#define ADMINFS_MESSAGE_COLOR 0xFF444499
	#define COLOR_WHITE 0xFFFFFFAA
	#define PM_INCOMING_COLOR     0xFFFF22AA
	#define PM_OUTGOING_COLOR     0xFFCC2299
	public OnPlayerCommandText(playerid, cmdtext[]){
	new iName[MAX_PLAYER_NAME+1],idx,pName[MAX_PLAYER_NAME+1],gMessage[256],Message[256],tmp[256],cmd[256];
	cmd = strtok(cmdtext, idx);
	// PM Command
	if(strcmp("/pm", cmd, true) == 0){
	tmp = strtok(cmdtext,idx); if(!strlen(tmp) || strlen(tmp) > 5) {
	SendClientMessage(playerid,COLOR_WHITE,"/Pm [id] [Message]"); return 1;} new id = strval(tmp); gMessage = strrest(cmdtext,idx); if(!strlen(gMessage)) {
	SendClientMessage(playerid,COLOR_WHITE,"Usage: /pm (id) (message)"); return 1;} if(!IsPlayerConnected(id)) {
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid,PM_OUTGOING_COLOR,"! השחקן לא מחובר");
	GetPlayerName(id,iName,sizeof(iName)); GetPlayerName(playerid,pName,sizeof(pName));
	format(Message,sizeof(Message),"[PM] %s(%d): %s",iName,id,gMessage); SendClientMessage(playerid,PM_OUTGOING_COLOR,Message);
	format(Message,sizeof(Message),"[PM] %s(%d): %s",pName,playerid,gMessage); SendClientMessage(id,PM_INCOMING_COLOR,Message);
	PlayerPlaySound(id,1085,0.0,0.0,0.0); printf("PM: %s",Message);} else {
	SendClientMessage(playerid,ADMINFS_MESSAGE_COLOR,"אין באפשרותך לשלוח לעצמך הודעה פרטית");}return 1;}
	return 1;
	}
