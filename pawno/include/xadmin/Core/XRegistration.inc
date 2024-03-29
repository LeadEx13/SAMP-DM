/********************************************
*       Programmer: Xtreme                  *
*       Include: XRegistration.inc          *
*       Purpose: Registration Callbacks	    *
********************************************/

#if defined _XRegistration_included
  #endinput
#endif
#define _XRegistration_included
#pragma library XRegistration

stock OnPlayerRegister(playerid)
{
	#pragma unused playerid     // Remove this if you are putting code here.
	// The player registered to the server.
	return 1;
}

stock OnPlayerLogin(playerid,bool:Success)
{
	#if !APS
    	#pragma unused playerid     // Remove this if you are putting code here.
	#endif
	if(Success)
	{
		// Did the user login with a correct password?
	}
	else
	{
		// The user entered an incorrect password.
		#if APS
		APS_Login[playerid]++;
		#endif
	}
	return 1;
}

stock OnPlayerLogout(playerid)
{
	#pragma unused playerid     // Remove this if you are putting code here.
	// The player logs out successfully.
	return 1;
}
