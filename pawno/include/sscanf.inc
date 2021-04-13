/*
    This is the normal sscanf pimped a little for my own purpose.
    changelog:
      * parameter 'u' now take part of name that are not at the begining of the player name.
      * parameter 'v' added:
        v - Vehicle, takes a vehicle name, part of a vehicle name or a vehicle model and returns the vehicle model if it is valid.
 
    thanks to whoever created the original sscanf !!
*/
 
#if defined _sscanf_included
    #endinput
#endif
#define _sscanf_included
 
#if !defined _Vname_included
#define _Vname_included
/*
native IsValidVehicleModel(Vmodel);
native getvehiclename(vehiclemodel);
*/
enum car_info_nameEX { modelID, modelname[MAX_PLAYER_NAME] }
new car_info_name[][car_info_nameEX] =
{
    { 0, "Unknown Model" }, //
    { 400, "Landstalker" }, //
    { 401, "Bravura" }, //
    { 402, "Buffalo" }, //
    { 403, "Linerunner" }, //
    { 404, "Perenail" }, //
    { 405, "Sentinel" }, //
    { 406, "Dumper" }, //
    { 407, "Firetruck" }, //
    { 408, "Trashmaster" }, //
    { 409, "Stretch" }, //
    { 410, "Manana" }, //
    { 411, "Infernus" }, //
    { 412, "Voodoo" }, //
    { 413, "Pony" }, //
    { 414, "Mule" }, //
    { 415, "Cheetah" }, //
    { 416, "Ambulance" }, //
    { 417, "Levetian" }, //
    { 418, "Moonbeam" }, //
    { 419, "Esperanto" }, //
     { 420, "Taxi" }, //
     { 421, "Washington" }, //
     { 422, "Bobcat" }, //
    { 423, "Mr Whoopee" }, //
    { 424, "BF Injection" }, //
    { 425, "Hunter" }, //
    { 426, "Premier" }, //
    { 427, "Enforcer" }, //
    { 428, "Securicar" }, //
    { 429, "Banshee" }, //
    { 430, "Predator" }, //
    { 431, "Bus" }, //
    { 432, "Rhino" }, //
    { 433, "Barracks" }, //
    { 434, "Hotknife" }, //
    { 435, "Artic Trailer 1" }, //
    { 436, "Previon" }, //
    { 437, "Coach" }, //
    { 438, "Cabbie" }, //
    { 439, "Stallion" }, //
    { 440, "Rumpo" }, //
    { 441, "RC Bandit" }, //
    { 442, "Romero" }, //
    { 443, "Packer" }, //
    { 444, "Monster" }, //
    { 445, "Admiral" }, //
    { 446, "Squalo" }, //
    { 447, "SeaSparrow" }, //
    { 448, "Pizza Boy" }, //
    { 449, "Tram" }, //
    { 450, "Artic Trailer 2" }, //
    { 451, "Turismo" }, //
    { 452, "Speeder" }, //
    { 453, "Reefer" }, //
    { 454, "Tropic" }, //
    { 455, "Flatbed" }, //
    { 456, "Yankee" }, //
    { 457, "Caddy" }, //
    { 458, "Solair" }, //
    { 459, "Top Fun" }, //
    { 460, "Skimmer" }, //
    { 461, "PCJ 600" }, //
    { 462, "Faggio" }, //
    { 463, "Freeway" }, //
    { 464, "RC Barron" }, //
    { 465, "RC Raider" }, //
    { 466, "Glendale" }, //
    { 467, "Oceanic" }, //
    { 468, "Sanchez" }, //
    { 469, "Sparrow" }, //
    { 470, "Patriot" }, //
    { 471, "Quad" }, //
    { 472, "Coastguard" }, //
    { 473, "Dinghy" }, //
    { 474, "Hermes" }, //
    { 475, "Sabre" }, //
    { 476, "Rustler" }, //
    { 477, "ZR 350" }, //
    { 478, "Walton" }, //
    { 479, "Regina" }, //
    { 480, "Comet" }, //
    { 481, "BMX" }, //
    { 482, "Burriro" }, //
    { 483, "Camper" }, //
    { 484, "Marquis" }, //
    { 485, "Baggage" }, //
    { 486, "Dozer" }, //
    { 487, "Maverick" }, //
    { 488, "VCN Maverick" }, //
    { 489, "Rancher" }, //
    { 490, "FBI Rancher" }, //
    { 491, "Virgo" }, //
    { 492, "Greenwood" }, //
    { 493, "Jetmax" }, //
    { 494, "Hotring" }, //
    { 495, "Sandking" }, //
    { 496, "Blistac" }, //
    { 497, "Police Maverick" }, //
    { 498, "Boxville" }, //
    { 499, "Benson" }, //
    { 500, "Mesa" }, //
    { 501, "RC Goblin" }, //
    { 502, "Hotring A" }, //
    { 503, "Hotring B" }, //
    { 504, "Blood Ring Banger" }, //
    { 505, "Rancher" }, //
    { 506, "Super GT" }, //
    { 507, "Elegant" }, //
    { 508, "Journey" }, //
    { 509, "Bike" }, //
    { 510, "Mountain Bike" }, //
    { 511, "Beagle" }, //
    { 512, "Cropduster" }, //
    { 513, "Stuntplane" }, //
    { 514, "Petrol" }, //
    { 515, "Roadtrain" }, //
    { 516, "Nebula" }, //
    { 517, "Majestic" }, //
    { 518, "Buccaneer" }, //
    { 519, "Shamal" }, //
     { 520, "Hydra" }, //
     { 521, "FCR 900" }, //
     { 522, "NRG 500" }, //
    { 523, "HPV 1000" }, //
    { 524, "Cement" }, //
    { 525, "Towtruck" }, //
    { 526, "Fortune" }, //
    { 527, "Cadrona" }, //
    { 528, "FBI Truck" }, //
    { 529, "Williard" }, //
    { 530, "Fork Lift" }, //
    { 531, "Tractor" }, //
    { 532, "Combine" }, //
    { 533, "Feltzer" }, //
    { 534, "Remington" }, //
    { 535, "Slamvan" }, //
    { 536, "Blade" }, //
    { 537, "Freight" }, //
    { 538, "Streak" }, //
    { 539, "Vortex" }, //
    { 540, "Vincent" }, //
    { 541, "Bullet" }, //
    { 542, "Clover" }, //
    { 543, "Sadler" }, //
    { 544, "FireTruck LA" }, //
    { 545, "Hustler" }, //
    { 546, "Intruder" }, //
    { 547, "Primo" }, //
    { 548, "CargoBob" }, //
    { 549, "Tampa" }, //
    { 550, "Sunrise" }, //
    { 551, "Merit" }, //
    { 552, "Utility Van" }, //
    { 553, "Nevada" }, //
    { 554, "Yosemite" }, //
    { 555, "Windsor" }, //
    { 556, "Monster A" }, //
    { 557, "Monster B" }, //
    { 558, "Uranus" }, //
    { 559, "Jester" }, //
    { 560, "Sultan" }, //
    { 561, "Stratum" }, //
    { 562, "Elegy" }, //
    { 563, "Raindance" }, //
    { 564, "RC Tiger" }, //
    { 565, "Flash" }, //
    { 566, "Tahoma" }, //
    { 567, "Savanna" }, //
    { 568, "Bandito" }, //
    { 569, "Freight Flat" }, //
    { 570, "Streak" }, //
    { 571, "Kart" }, //
    { 572, "Mower" }, //
    { 573, "Duneride" }, //
    { 574, "Sweeper" }, //
    { 575, "Broadway" }, //
    { 576, "Tornado" }, //
    { 577, "AT 400" }, //
    { 578, "DFT 30" }, //
    { 579, "Huntley" }, //
    { 580, "Stafford" }, //
    { 581, "BF 400" }, //
    { 582, "News Van" }, //
    { 583, "Tug" }, //
    { 584, "Petrol Tanker" }, //
    { 585, "Emperor" }, //
    { 586, "Wayfarer" }, //
    { 587, "Euros" }, //
    { 588, "Hotdog" }, //
    { 589, "Club" }, //
    { 590, "Freight Box" }, //
    { 591, "Artic Trailer 3" }, //
    { 592, "Andromada" }, //
    { 593, "Dodo" }, //
    { 594, "RC Cam" }, //
    { 595, "Launch" }, //
    { 596, "Cop Car LS" }, //
    { 597, "Cop Car SF" }, //
    { 598, "Cop Car LV" }, //
    { 599, "Ranger" }, //
    { 600, "Picador" }, //
    { 601, "Swat Tank" }, //
    { 602, "Alpha" }, //
    { 603, "Phoenix" }, //
    { 604, "Glendale" }, //
    { 605, "Sadler" }, //
    { 606, "Bag Box A" }, //
    { 607, "Bag Box B" }, //
    { 608, "Stairs" }, //
    { 609, "Boxville Black" }, //
    { 610, "Farm Trailer" }, //
    { 611, "Utility Van Trailer" } //
};
 
forward IsValidVehicleModel(Vmodel);
public IsValidVehicleModel(Vmodel)
{
    for(new i = 1; i < sizeof(car_info_name); i++)
    {
        if(car_info_name[i][modelID] == Vmodel) return 1;
    }
    return 0;
}
 
getvehiclename(vehiclemodel)
{
    new vname[MAX_PLAYER_NAME];
    for(new i = 1; i < sizeof(car_info_name); i++)
    {
        if(car_info_name[i][modelID] == vehiclemodel)
        {
            format(vname, sizeof(vname),"%s",car_info_name[i][modelname]);
            return vname;
        }
    }
    format(vname, sizeof(vname),"%s",car_info_name[0][modelname]);
    return vname;
}
#endif
 
 
/*----------------------------------------------------------------------------*-
Function:
    sscanf
Params:
    string[] - String to extract parameters from.
    format[] - Parameter types to get.
    {Float,_}:... - Data return variables.
Return:
    0 - Successful, not 0 - fail.
Notes:
    A fail is either insufficient variables to store the data or insufficient
    data for the format string - excess data is disgarded.
 
    A string in the middle of the input data is extracted as a single word, a
    string at the end of the data collects all remaining text.
 
    The format codes are:
 
    c - A character.
    d, i - An integer.
    h, x - A hex number (e.g. a colour).
    f - A float.
    s - A string.
    z - An optional string.
    pX - An additional delimiter where X is another character.
    '' - Encloses a litteral string to locate.
    u - User, takes a name, part of a name or an id and returns the id if they're connected.
 
    v - Vehicle, takes a vehicle name, part of a vehicle name or a vehicle model and returns the vehicle model if it is valid.
 
    Now has IsNumeric integrated into the code.
 
    Added additional delimiters in the form of all whitespace and an
    optioanlly specified one in the format string.
-*----------------------------------------------------------------------------*/
/*
native sscanf(string[], format[], {Float,_}:...);
*/
forward sscanf(string[], format[], {Float,_}:...);
public sscanf(string[], format[], {Float,_}:...)
{
    #if defined isnull
        if (isnull(string))
    #else
        if (string[0] == 0 || (string[0] == 1 && string[1] == 0))
    #endif
        {
            return format[0];
        }
    #pragma tabsize 4
    new
        formatPos = 0,
        stringPos = 0,
        paramPos = 2,
        paramCount = numargs(),
        delim = ' ';
    while (string[stringPos] && string[stringPos] <= ' ')
    {
        stringPos++;
    }
    while (paramPos < paramCount && string[stringPos])
    {
        switch (format[formatPos++])
        {
            case '\0':
            {
                return 0;
            }
            case 'i', 'd':
            {
                new
                    neg = 1,
                    num = 0,
                    ch = string[stringPos];
                if (ch == '-')
                {
                    neg = -1;
                    ch = string[++stringPos];
                }
                do
                {
                    stringPos++;
                    if ('0' <= ch <= '9')
                    {
                        num = (num * 10) + (ch - '0');
                    }
                    else
                    {
                        return -1;
                    }
                }
                while ((ch = string[stringPos]) > ' ' && ch != delim);
                setarg(paramPos, 0, num * neg);
            }
            case 'h', 'x':
            {
                new
                    num = 0,
                    ch = string[stringPos];
                do
                {
                    stringPos++;
                    switch (ch)
                    {
                        case 'x', 'X':
                        {
                            num = 0;
                            continue;
                        }
                        case '0' .. '9':
                        {
                            num = (num << 4) | (ch - '0');
                        }
                        case 'a' .. 'f':
                        {
                            num = (num << 4) | (ch - ('a' - 10));
                        }
                        case 'A' .. 'F':
                        {
                            num = (num << 4) | (ch - ('A' - 10));
                        }
                        default:
                        {
                            return -1;
                        }
                    }
                }
                while ((ch = string[stringPos]) > ' ' && ch != delim);
                setarg(paramPos, 0, num);
            }
            case 'c':
            {
                setarg(paramPos, 0, string[stringPos++]);
            }
            case 'f':
            {
                new changestr[16], changepos = 0, strpos = stringPos;
                while(changepos < 16 && string[strpos] && string[strpos] != delim)
                {
                    changestr[changepos++] = string[strpos++];
                }
                changestr[changepos] = '\0';
                setarg(paramPos,0,_:floatstr(changestr));
            }
 
            case 'p':
            {
                delim = format[formatPos++];
                continue;
            }
 
            case '\'':
            {
                new
                    end = formatPos - 1,
                    ch;
                while ((ch = format[++end]) && ch != '\'') {}
                if (!ch)
                {
                    return -1;
                }
                format[end] = '\0';
                if ((ch = strfind(string, format[formatPos], false, stringPos)) == -1)
                {
                    if (format[end + 1])
                    {
                        return -1;
                    }
                    return 0;
                }
                format[end] = '\'';
                stringPos = ch + (end - formatPos);
                formatPos = end + 1;
            }
 
            case 'u':
            {
                new
                    end = stringPos - 1,
                    id = 0,
                    bool:num = true,
                    ch;
                while ((ch = string[++end]) && ch != delim)
                {
                    if (num)
                    {
                        if ('0' <= ch <= '9')
                        {
                            id = (id * 10) + (ch - '0');
                        }
                        else
                        {
                            num = false;
                        }
                    }
                }
                if (num && IsPlayerConnected(id))
                {
                    setarg(paramPos, 0, id);
                }
                else
                {
                    #if !defined foreach
                        #define foreach(%1,%2) for (new %2 = 0; %2 < MAX_PLAYERS; %2++) if (IsPlayerConnected(%2))
                        #define __SSCANF_FOREACH__
                    #endif
                    string[end] = '\0';
                    num = false;
                    new
                        name[MAX_PLAYER_NAME];
                    id = end - stringPos;
                    foreach (Player, playerid)
                    {
                        GetPlayerName(playerid, name, sizeof (name));
                        if (!strcmp(name, string[stringPos], true, id)) //check form start of string
                        {
                            setarg(paramPos, 0, playerid);
                            num = true;
                            break;
                        }
                    }
                    if (!num)
                    {
                        foreach (Player, playerid)
                        {
                            GetPlayerName(playerid, name, sizeof (name));
                            if(strfind(name, string[stringPos], true) != -1) //check anywhere in string
                            {
                                setarg(paramPos, 0, playerid);
                                num = true;
                                break;
                            }
                        }
                    }
                    if (!num)
                    {
                        setarg(paramPos, 0, INVALID_PLAYER_ID);
                    }
                    string[end] = ch;
                    #if defined __SSCANF_FOREACH__
                        #undef foreach
                        #undef __SSCANF_FOREACH__
                    #endif
                }
                stringPos = end;
            }
 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// this parameter was added by snoob.
            case 'v':
            {
                new
                    end = stringPos - 1,
                    id = 0,
                    bool:num = true,
                    ch;
                while ((ch = string[++end]) && ch != delim)
                {
                    if (num)
                    {
                        if ('0' <= ch <= '9')
                        {
                            id = (id * 10) + (ch - '0');
                        }
                        else
                        {
                            num = false;
                        }
                    }
                }
                if (num && IsValidVehicleModel(id))
                {
                    setarg(paramPos, 0, id);
                }
                else
                {
 
                    string[end] = '\0';
                    num = false;
 
                    id = end - stringPos;
 
                    for(new i = 1; i < sizeof(car_info_name); i++)
                    {
 
                        if (!strcmp(car_info_name[i][modelname], string[stringPos], true, id)) //check form start of string
                        {
                            setarg(paramPos, 0, car_info_name[i][modelID]);
                            num = true;
                            break;
                        }
                    }
                    if (!num)
                    {
 
                        for(new i = 1; i < sizeof(car_info_name); i++)
                        {
 
                            if (strfind(car_info_name[i][modelname], string[stringPos], true) != -1 ) //check anywhere in string
                            {
                                setarg(paramPos, 0, car_info_name[i][modelID]);
                                num = true;
                                break;
                            }
                        }
                    }
                    if (!num)
                    {
                        setarg(paramPos, 0, INVALID_VEHICLE_ID);
                    }
                    string[end] = ch;
 
                }
                stringPos = end;
            }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
            case 's', 'z':
            {
                new
                    i = 0,
                    ch;
                if (format[formatPos])
                {
                    while ((ch = string[stringPos++]) && ch != delim)
                    {
                        setarg(paramPos, i++, ch);
                    }
                    if (!i)
                    {
                        return -1;
                    }
                }
                else
                {
                    while ((ch = string[stringPos++]))
                    {
                        setarg(paramPos, i++, ch);
                    }
                }
                stringPos--;
                setarg(paramPos, i, '\0');
            }
            default:
            {
                continue;
            }
        }
        while (string[stringPos] && string[stringPos] != delim && string[stringPos] > ' ')
        {
            stringPos++;
        }
        while (string[stringPos] && (string[stringPos] == delim || string[stringPos] <= ' '))
        {
            stringPos++;
        }
        paramPos++;
    }
    do
    {
        if ((delim = format[formatPos++]) > ' ')
        {
            if (delim == '\'')
            {
                while ((delim = format[formatPos++]) && delim != '\'') {}
            }
            else if (delim != 'z')
            {
                return delim;
            }
        }
    }
    while (delim > ' ');
    return 0;
}
 
// EOF

