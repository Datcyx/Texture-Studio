#include <a_samp>
#include <sscanf2>	
#include <Pawn.CMD>
main()
{
	print("\n/*-----------------------------------*\\");
	print("|*=====[TS Base GameMode Loaded]=====*|");
	print("\\*-----------------------------------*/\n");
}

new bool:JustConnected[MAX_PLAYERS];

public OnPlayerRequestClass(playerid, classid)
{
	TogglePlayerSpectating(playerid, true);
	if(JustConnected[playerid])
	{
		JustConnected[playerid] = false;
		SetTimerEx("OnPlayerRequestClass", 100, false, "ii", playerid, classid);
	}
	else
	{
		TogglePlayerSpectating(playerid, false);
		SpawnPlayer(playerid);
	}
	return 1;
}
CMD:gotoco(playerid, params[]) { return callcmd::gotocoords(playerid, params); }
CMD:gotocoords(playerid, params[])
{
	new Float:x, Float:y, Float:z, interiorid;
	if(sscanf(params, "fffI(0)", x, y, z, interiorid))
	{
	    return 1;
	}

	SetPlayerPos(playerid, x, y, z);
	SetPlayerInterior(playerid, interiorid);
	return 1;
}
public OnPlayerConnect(playerid)
{
	GameTextForPlayer(playerid,"~r~T~w~exture ~r~S~w~tudio ~b~1.9~g~c",5000,5);
	JustConnected[playerid] = true;
	return 1;
}

public OnGameModeInit()
{
	SetGameModeText("TS 1.9c");
	UsePlayerPedAnims();

	AddPlayerClass(265,1958.3783,1343.1572,15.3746,270.1425,0,0,0,0,-1,-1);

	return 1;
}
