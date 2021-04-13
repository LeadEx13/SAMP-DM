#include <a_samp>
#include <dudb>
#include <Fxp>

#define SHIP_OBJECTS 14

new object[SHIP_OBJECTS];
new Float:rotangle, Float:summrot;
new boat, player_in_boat = -1;
new refresh_ship;
new Float:wasX, Float:wasY;
new Float:wasAngle;
new camera;
new Float:PI = 3.1415926535897932384626433832795;

forward RotateAll();
forward RotateShipPart(objectID);
forward RefreshShip();

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Big ship by _Pois0n_");
	print("--------------------------------------\n");

	//here you can change coordinates of ship... If you can
	new Float:modx, Float:mody, Float:modz;
	modx = -2200.45574;
	mody = 2585.92434;
	modz = 0;

	//do not edit coordinates here/delete/modify objects... just recommend to you
	object[0] = CreateObject(10771, -1357.70-modx,  501.30-mody,  5.45-modz, 0.00000, 0.000000, 0.000000); //ship
	object[1] = CreateObject(10772, -1356.35-modx,  501.12-mody,  17.27-modz, 0.00000, 0.000000, 0.000000); //white thing on floor (oh my english...)
	object[2] = CreateObject(11146, -1366.69-modx,  501.85-mody,  12.29-modz, 0.00000, 0.000000, 0.000000); //ship interior
	object[3] = CreateObject(11145, -1420.58-modx,  501.30-mody,  4.26-modz, 0.00000, 0.000000, 0.000000); //ship interior part 2
	object[4] = CreateObject(11148, -1366.69-modx,  501.30-mody,  12.88-modz, 0.00000, 0.000000, 0.000000); //some pipes
	object[5] = CreateObject(11147, -1418.41-modx,  501.30-mody,  5.08-modz, 0.00000, 0.000000, 0.000000); //again some pipes
	object[6] = CreateObject(11149, -1363.77-modx,  496.09-mody,  11.98-modz, 0.00000, 0.000000, 0.000000); //ship interior part 3
	object[7] = CreateObject(11237, -1354.42-modx,  493.75-mody,  38.68-modz, 0.00000, 0.000000, 0.000000); //antenas
	object[8] = CreateObject(10770, -1354.47-modx,  493.75-mody,  38.68-modz, 0.00000, 0.000000, 0.000000); //base for antenas
	object[9] = CreateObject(3885, -1324.33-modx,  493.81-mody,  21.02-modz, 0.00000, 0.000000, 0.000000); //base for rockets
	object[10] = CreateObject(3884, -1324.33-modx,  493.81-mody,  21.05-modz, 0.00000, 0.000000, 0.000000); //rockets
	object[11] = CreateObject(3885, -1394.80-modx,  493.40-mody,  18.01-modz, 0.00000, 0.000000, 0.000000); //base for rockets 2
	object[12] = CreateObject(3884, -1394.80-modx,  493.40-mody,  18.05-modz, 0.00000, 0.000000, 0.000000); //rockets 2
	object[13] = CreateObject(11374, -1363.77-modx,  496.09-mody,  11.98-modz, 0.00000, 0.000000, 0.000000); //bended pipes

	return 1;
}

public OnFilterScriptExit()
{
	for(new a; a<SHIP_OBJECTS; a++) {
	    DestroyObject(object[a]);
	}
	
	DestroyVehicle(boat);
	KillTimer(refresh_ship);
	if(player_in_boat != -1) {
		SpawnPlayer(player_in_boat);
		SetCameraBehindPlayer(player_in_boat);
	}

	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if(strcmp(cmdtext, "/shiphelp", true, 9) == 0) 
    {
        SendClientMessage(playerid, 0x00FF00FF, "Big ship by {F57E2F}Ponchik {00FF00}(btw hello to {13A61E}antichat {00FF00}team)");
        SendClientMessage(playerid, 0x00FF00FF, "Use {FFCC00}/goinship {00FF00}to control ship");
        SendClientMessage(playerid, 0x00FF00FF, "Use {FFCC00}/shipcam1 /shipcam2 /shipcam3 /shipcam4{00FF00} to change camera");
        SendClientMessage(playerid, 0x00FF00FF, "Press {FFCC00}F{00FF00} to exit from ship");
        return 1;
    }
    
    if(strcmp(cmdtext, "/goinship", true, 9) == 0 && IsPlayerXAdmin(playerid)) //only for admin
    {
        if(player_in_boat != -1) {
        	SendClientMessage(playerid, 0xFF0000FF, "Other player controling ship");
        	printf("player_in_boat = %i",player_in_boat);
        	return 1;
        }
        new Float:RotX,Float:RotY,Float:RotZ;
		GetObjectRot(object[0], RotX, RotY, RotZ);
        
        boat = CreateVehicle(484, 7000.0, 7000.0, 0, (RotZ-90), 1, 1, 60); //here you can change boat for more cool control, if you will use car - make hard surface
        PutPlayerInVehicle(playerid, boat, 0);
        player_in_boat = playerid;
        refresh_ship = SetTimer("RefreshShip", 100, true); //here you can change refresh time, but i dont think it will help
        
        camera = 1;
        return 1;
    }
    
    if(strcmp(cmdtext, "/shipcam1", true, 9) == 0 && player_in_boat == playerid && IsPlayerXAdmin(playerid))
    {
        camera = 1;
		return 1;
    }

    if(strcmp(cmdtext, "/shipcam2", true, 9) == 0 && player_in_boat == playerid && IsPlayerXAdmin(playerid))
    {
        camera = 2;
		return 1;
    }

    if(strcmp(cmdtext, "/shipcam3", true, 9) == 0 && player_in_boat == playerid && IsPlayerXAdmin(playerid))
    {
        camera = 3;
		return 1;
    }

    if(strcmp(cmdtext, "/shipcam4", true, 9) == 0 && player_in_boat == playerid && IsPlayerXAdmin(playerid))
    {
        camera = 4;
		return 1;
    }

    return 0;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    if(vehicleid == boat) {
    	DestroyVehicle(boat);
        boat = 0;
        player_in_boat = -1;
        KillTimer(refresh_ship);
        new Float:x, Float:y, Float:z;
		GetObjectPos(object[0], x, y, z);
        SetPlayerPos(playerid,x, y, z+15);
        SetCameraBehindPlayer(playerid);
    }
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(player_in_boat == playerid) {
    	DestroyVehicle(boat);
        boat = 0;
        player_in_boat = -1;
        KillTimer(refresh_ship);
        new Float:x, Float:y, Float:z;
		GetObjectPos(object[0], x, y, z);
        SetPlayerPos(playerid,x, y, z+15);
        SetCameraBehindPlayer(playerid);
    }
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(player_in_boat == playerid) {
	    player_in_boat = -1;
    	DestroyVehicle(boat);
        boat = 0;
        KillTimer(refresh_ship);
    }
    return 1;
}

public RotateAll() {
    for(new a; a<SHIP_OBJECTS; a++) {
    	RotateShipPart(object[a]);
    }
}

public RotateShipPart(objectID) { //let's do some math
	new Float:new_BX, Float:new_BY, Float:aradian, Float:x1, Float:y1, Float:x_v_staroi, Float:y_v_staroi, Float:ugol;

    new Float:start_position_AX, Float:start_position_AY, Float:z_tmp;
	GetObjectPos(object[0], start_position_AX, start_position_AY, z_tmp);
	
	new Float:start_position_BX, Float:start_position_BY, Float:z;
	GetObjectPos(objectID, start_position_BX, start_position_BY, z);

	ugol = rotangle;

	new_BX = start_position_BX-start_position_AX;
	new_BY = start_position_BY-start_position_AY;

	aradian = ugol*(PI/180);
	x1 = new_BX*floatcos(aradian)+new_BY*floatsin(aradian);
	y1 = -new_BX*floatsin(aradian)+new_BY*floatcos(aradian);

	x_v_staroi = x1+start_position_AX;
	y_v_staroi = y1+start_position_AY;

    SetObjectPos(objectID, x_v_staroi, y_v_staroi, z);
    SetObjectRot(objectID, 0, 0, summrot);
}

public RefreshShip() {
    new Float:vehx, Float:vehy, Float:vehz;
    GetVehiclePos(boat, vehx, vehy, vehz);
	if(!wasX || !wasY) {
	    wasX = vehx;
	    wasY = vehy;
	}
	
	if(!IsPlayerInRangeOfPoint(player_in_boat, 3000.0, 7000.0, 7000.0, 0)) { // If player go to land or out of world, if you make hard surface - change radius
	    wasX = 7000.0;
	    wasY = 7000.0;
	    SetVehiclePos(boat, 7000.0, 7000.0, 0);
	}
	
	new Float:boat_angle;
	GetVehicleZAngle(boat, boat_angle);

    boat_angle = boat_angle-270;
	summrot = boat_angle;
	rotangle = wasAngle-boat_angle;
	wasAngle = boat_angle;
	
	RotateAll();
	
	new Float:Velocity[3];
	GetVehicleVelocity(boat, Velocity[0], Velocity[1], Velocity[2]);
	if(Velocity[0]<0) Velocity[0] = 0-Velocity[0];
	if(Velocity[1]<0) Velocity[1] = 0-Velocity[1];
    Velocity[2] = Velocity[0]+Velocity[1];
	
	for(new a; a<SHIP_OBJECTS; a++) {
		new Float:x, Float:y, Float:z;
		GetObjectPos(object[a], x, y, z);
	    MoveObject(object[a], x-(wasX-vehx), y-(wasY-vehy), z, Velocity[2]*30); //make it faster or slower for more smoothness
    }
    
    wasX = vehx;
	wasY = vehy;
	
	//change camera position here
	new Float:AX, Float:AY, Float:AZ;
	new Float:BX, Float:BY, Float:BZ;
	new Float:CamPosX, Float:CamPosY, Float:CamPosZ;
	new Float:CamPointX, Float:CamPointY, Float:CamPointZ;

	GetObjectPos(object[0], AX, AY, AZ);
	GetObjectPos(object[3], BX, BY, BZ);
	
	if(camera == 1) {
		CamPointX = AX;
		CamPointY = AY;

		CamPosX = BX-AX;
		CamPosY = BY-AY;
        CamPosX = CamPosX*1.3;
        CamPosY = CamPosY*1.3;
		CamPosX = CamPosX+AX;
		CamPosY = CamPosY+AY;
	
		CamPosZ = 50;
		CamPointZ = 4;
	}else if(camera == 2) {
		CamPointX = AX-BX;
		CamPointY = AY-BY;
        CamPointX = CamPointX*0.1;
        CamPointY = CamPointY*0.1;
		CamPointX = CamPointX+BX;
		CamPointY = CamPointY+BY;

		CamPosX = BX-AX;
		CamPosY = BY-AY;
        CamPosX = CamPosX*2.3;
        CamPosY = CamPosY*2.3;
		CamPosX = CamPosX+AX;
		CamPosY = CamPosY+AY;

		CamPosZ = 80;
		CamPointZ = 1;
    }else if(camera == 3) {
		CamPointX = AX-BX;
		CamPointY = AY-BY;
        CamPointX = CamPointX*1.3;
        CamPointY = CamPointY*1.3;
		CamPointX = CamPointX+BX;
		CamPointY = CamPointY+BY;

		CamPosX = BX-AX;
		CamPosY = BY-AY;
        CamPosX = CamPosX*0.01;
        CamPosY = CamPosY*0.01;
		CamPosX = CamPosX+AX;
		CamPosY = CamPosY+AY;

		CamPosZ = 80;
		CamPointZ = 1;
    }else if(camera == 4) {
		CamPointX = AX-BX;
		CamPointY = AY-BY;
        CamPointX = CamPointX*2.4;
        CamPointY = CamPointY*2.4;
		CamPointX = CamPointX+BX;
		CamPointY = CamPointY+BY;

		CamPosX = BX-AX;
		CamPosY = BY-AY;
        CamPosX = CamPosX*(-1);
        CamPosY = CamPosY*(-1);
		CamPosX = CamPosX+AX;
		CamPosY = CamPosY+AY;

		CamPosZ = 80;
		CamPointZ = 1;
    }
	
	SetPlayerCameraPos(player_in_boat, CamPosX, CamPosY, CamPosZ);
	SetPlayerCameraLookAt(player_in_boat, CamPointX, CamPointY, CamPointZ);
}
