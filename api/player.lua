-------------------------------------------------------------------------------
-- The player library is used to get the Lua objects that represent players in-game.
-- @module player

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Similar to the serverside command "bot", this function creates a new Player
-- bot with the given name. This bot will not obey to the usual "bot_*"
-- commands, and it's the same bot base used in TF2 and CS:S.
-- 
-- The best way to control the behaviour of a Player bot right now is to use
-- the **GM:StartCommand** hook and modify its input serverside.
-- 
-- **Note**: _Despite this Player being fake, it has to be removed from the
-- server by using **Player:Kick** and **NOT Entity:Remove**. Also keep in mind that
-- these bots still use player slots, so you won't be able to spawn them in singleplayer!_
-- 
-- **Note**: _Any Bot created using this method will be considered UnAuthed by Garry's Mod._
-- @function [parent=#player] CreateNextBot
-- @param  #string botName The name of the bot, using an already existing name will append brackets at the end of it with a number pertaining it.
-- Example: "Bot name test", "Bot name test(1)".
-- @return #Player The newly created Player bot. Returns NULL if there's no Player slots available to host it.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets all the current players in the server (not including connecting clients).
-- 
-- **Note**: _This function returns bots as well as human players.
-- See **player.GetBots** and **player.GetHumans**._
-- @function [parent=#player] GetAll
-- @return #table All Players currently in the server.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table of all bots on the server.
-- @function [parent=#player] GetBots
-- @return #table A table only containing bots(AI/non human players).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the player with the specified connection ID. Connection ID can be
-- retrieved via **gameevent.Listen** events.
-- 
-- For a function that returns a player based on their **Entity:EntIndex**, see **Entity**.  
-- For a function that returns a player based on their **Player:UserID**, see **Player**.
-- @function [parent=#player] GetByID
-- @param  #number connectionID The connection ID to find the player by.
-- @return #Player Player if one is found, otherwise nil.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the player with the specified SteamID.
-- @function [parent=#player] GetBySteamID
-- @param  #string steamID The **Player:SteamID** to find the player by.
-- @return #Player Player if one is found, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the player with the specified SteamID64.
-- @function [parent=#player] GetBySteamID64
-- @param  #string steamID64 The **Player:SteamID64** to find the player by. Also accepts numbers.
-- @return #Player Player if one is found, false otherwise.


-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the player with the specified uniqueID (not recommended way to identify players).
-- 
-- **Warning**: _It is highly recommended to use **player.GetBySteamID** or
-- **player.GetBySteamID64** instead as this function can have collisions (be same
-- for different people) while SteamID is guaranteed to unique to each player._
-- @function [parent=#player] GetByUniqueID
-- @param  #string uniqueID The **Player:UniqueID** to find the player by.
-- @return #Player Player if one is found, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gives you the player count. Similar to #**player.GetAll** but with much better performance.
-- @function [parent=#player] GetCount
-- @return #number Number of players.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table of all human(non bot/AI) players. Unlike **player.GetAll**, this
-- does not include bots.
-- @function [parent=#player] GetHumans
-- @return #table A table of all human(non bot/AI) players.

return nil
