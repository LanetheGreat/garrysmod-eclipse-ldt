-------------------------------------------------------------------------------
-- The game library provides functions to access various features in the
-- game's engine, most of it's functions are related to controlling the map.
-- @module game

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds a new ammo type to the game.  
-- You can find a list of default ammo types **here**.
-- 
-- **Warning**: _This function must be called shared or you will have unexpected problems._
-- 
-- **Note**: _There is a limit of 128 ammo types, including the default ones._
-- @function [parent=#game] AddAmmoType
-- @param  #table ammoData The attributes of the ammo. See the **AmmoData structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Registers a new decal.
-- @function [parent=#game] AddDecal
-- @param  #string decalName The name of the decal.
-- @param  #string materialName The material to be used for the decal. May also be a list of material names, in which case a random material from that list will be chosen every time the decal is placed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Loads a particle file.
-- 
-- **Note**: _You will still need to call this function clientside regardless
-- if you create the particle effects serverside._
-- @function [parent=#game] AddParticles
-- @param  #string particleFileName The path of the file to add. Must be (file).pcf.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by the engine to retrieve the ammo types.
-- @function [parent=#game] BuildAmmoTypes
-- @return #table All ammo types registered via **game.AddAmmoType**, sorted by its name value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- If called serverside it will remove ALL entities which were not created by
-- the map(not players or weapons held by players).
-- 
-- On the client it will remove decals, sounds, gibs, dead NPCs, and entities
-- created via **ents.CreateClientProp**.
-- 
-- This function calls **GM:PreCleanupMap** before cleaning up the map and
-- **GM:PostCleanupMap** after cleaning up the map.
-- @function [parent=#game] CleanUpMap
-- @param  #boolean dontSendToClients If set to true, don't run this functions on all clients. _(Default: false)_
-- @param  #table ExtraFilters Entity classes not to reset during cleanup. _(Default: {})_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Runs a console command. Make sure to add a newline ("\n") at the end of the command.
-- 
-- **Warning**: _If you use data that were received from a client, you should
-- avoid using this function because newline and semicolon (at least) allow the
-- client to run arbitrary commands!_  
-- _For safety, you are urged to prefer using **RunConsoleCommand** in this case._
-- @function [parent=#game] ConsoleCommand
-- @param  #string stringCommand String containing the command and arguments to be ran.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the damage type of given ammo type.
-- @function [parent=#game] GetAmmoDamageType
-- @param  #number id Ammo ID to retrieve the damage type of. Starts from 1.
-- @return #number See **DMG\_Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the ammo bullet force that is applied when an entity is hit by a
-- bullet of given ammo type.
-- @function [parent=#game] GetAmmoForce
-- @param  #number id Ammo ID to retrieve the force of. Starts from 1.
-- @return #number The amount of damage.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the ammo type ID for given ammo type name. See **game.GetAmmoName** for reverse.
-- @function [parent=#game] GetAmmoID
-- @param  #string name Name of the ammo type to look up ID of.
-- @return #number The ammo type ID of given ammo type name, or -1 if not found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the real maximum amount of ammo of given ammo ID.
-- 
-- **Note**: _Currently all ammo types have overridden maximum value of reserve
-- ammo set to 9999._
-- @function [parent=#game] GetAmmoMax
-- @param  #number id Ammo type ID.
-- @return #number The maximum amount of reserve ammo a player can hold of this ammo type.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the ammo name for given ammo type ID. See **game.GetAmmoID** for reverse.
-- @function [parent=#game] GetAmmoName
-- @param  #number id Ammo ID to retrieve the name of. Starts from 1.
-- @return #string The name of given ammo type ID or nil if ammo type ID is invalid.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the damage given ammo type should do to NPCs.
-- @function [parent=#game] GetAmmoNPCDamage
-- @param  #number id Ammo ID to retrieve the damage info of. Starts from 1.
-- @return #number The amount of damage.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the damage given ammo type should do to players.
-- @function [parent=#game] GetAmmoPlayerDamage
-- @param  #number id Ammo ID to retrieve the damage info of. Starts from 1.
-- @return #number The amount of damage.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the counter of a Global State. See **Global States** for more information.
-- @function [parent=#game] GetGlobalCounter
-- @param  #string name The name of the Global State to set.  
-- If the Global State by that name does not exist, it will be created.  
-- See **Global States** for a list of default global states.
-- @return #number The value of the given Global State, 0 if the global state doesn't exist.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether a Global State is off, active or dead (inactive).
-- See **Global States** for more information.
-- @function [parent=#game] GetGlobalState
-- @param  #string name The name of the Global State to retrieve the state of.  
-- If the Global State by that name does not exist, **GLOBAL\_DEAD** will be returned.  
-- See **Global States** for a list of default global states.
-- @return #number The state of the Global State. See **GLOBAL\_Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the public IP address and port of the current server. This will
-- return the IP/port that you are connecting through when ran clientside.
-- 
-- **Note**: _Returns "0.0.0.0:0" in singleplayer._
-- @function [parent=#game] GetIPAddress
-- @return #string The IP address and port in the format "x.x.x.x:x".

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the name of the current map, without a file extension. On the menu
-- state, returns "menu".
-- @function [parent=#game] GetMap
-- @return #string The name of the current map, without a file extension.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the next map that would be loaded according to the file that is set
-- by the mapcyclefile convar.
-- @function [parent=#game] GetMapNext
-- @return #string The name of the next map.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the VBSP version of the current map.
-- @function [parent=#game] GetMapVersion
-- @return #number The map's version.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the difficulty level of the game.
-- 
-- **TIP**: _You can use this function in your scripted NPCs or Nextbots to
-- make them harder, however, it is a good idea to lock powerful attacks behind
-- the highest difficulty instead of just increasing the health._
-- 
-- **Note**: _Internally this is tied to the gamerules entity, so you'll have
-- to wait to wait until **GM:InitPostEntity** is called to return the skill level._
-- @function [parent=#game] GetSkillLevel
-- @return #number The difficulty level, Easy(1), Normal(2), Hard(3).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the time scale of the game.
-- @function [parent=#game] GetTimeScale
-- @return #number The time scale.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the worldspawn entity.
-- @function [parent=#game] GetWorld
-- @return #Entity The world.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the server is a dedicated server, false if it is a **Listen
-- server** or a singleplayer game.
-- @function [parent=#game] IsDedicated
-- @return #boolean Is the server dedicated or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Kicks a player from the server. This can be ran before the player has spawned.
-- @function [parent=#game] KickID
-- @param  #string id UserID or SteamID of the player to kick.
-- @param  #string reason Reason to display to the player. _(Default: "No reason given")_  
-- This can span across multiple lines.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Loads the next map according to the nextlevel convar, or from the current
-- mapcycle file set by the respective convar.
-- @function [parent=#game] LoadNextMap

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the map load type of the current map. After changing the map with
-- the console command changelevel, "newgame" is returned. With changelevel2
-- (single player only), "transition" is returned.
-- @function [parent=#game] MapLoadType
-- @return #string The load type. Possible values are: "newgame", "loadgame", "transition", "background".

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the maximum amount of players (including bots) that the server can have.
-- @function [parent=#game] MaxPlayers
-- @return #number The maximum amount of players.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Mounts a GMA addon from the disk. Any error models currently loaded that the
-- mounted addon provides will be reloaded.  
-- Can be used with **steamworks.Download**.
-- @function [parent=#game] MountGMA
-- @param  #string path Location of the GMA file to mount, relative to the garrysmod/ directory.
-- @return #boolean, #table true with a table of mounted files or false.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes all the clientside ragdolls.
-- @function [parent=#game] RemoveRagdolls

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the counter of a Global State. See **Global States** for more information.
-- @function [parent=#game] SetGlobalCounter
-- @param  #string name The name of the Global State to set. If the Global State by that name does not exist, it will be created.  
-- See **Global States** for a list of default global states.
-- @param  #number count The value to set for that Global State.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets whether a Global State is off, active or dead(inactive). See **Global States**
-- for more information.
-- @function [parent=#game] SetGlobalState
-- @param  #string name The name of the Global State to set. If the Global State by that name does not exist, it will be created.  
-- See **Global States** for a list of default global states.
-- @param  #number state The state of the Global State. See **GLOBAL\_Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the difficulty level of the game, can be retrieved with **game.GetSkillLevel**.  
-- This will automatically change whenever the "skill" convar is modified serverside.
-- @function [parent=#game] SetSkillLevel
-- @param  #number level The difficulty level, Easy(1), Normal(2), Hard(3).

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the time scale of the game. This function is supposed to remove the
-- need of using the host_timescale convar, which is cheat protected.  
-- To slow down or speed up the movement of a specific player, use
-- **Player:SetLaggedMovementValue** instead.
-- 
-- **Note**: _Like host\_timescale, this method does not affect sounds, if you
-- wish to change that, look into **GM:EntityEmitSound**._
-- @function [parent=#game] SetTimeScale
-- @param  #number timeScale The new timescale, minimum value is 0.001 and maximum is 5.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the current session is a single player game.
-- @function [parent=#game] SinglePlayer
-- @return #boolean Is single player game.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns position the player should start from, this is not the same thing as
-- spawn points, it is used to properly transit the player between maps.
-- @function [parent=#game] StartSpot
-- @return #Vector The player's starting position.

return nil
