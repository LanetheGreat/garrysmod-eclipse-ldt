-------------------------------------------------------------------------------
-- The player_manager library lets you manage players, such as setting their
-- models or creating player classes.
-- @module player_manager

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Assigns view model hands to player model.
-- @function [parent=#player_manager] AddValidHands
-- @param  #string name Player model name.
-- @param  #string model Hands model.
-- @param  #number skin Skin to apply to the hands.
-- @param  #string bodygroups Bodygroups to apply to the hands.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Associates a simplified name with a path to a valid player model. _Only used internally._
-- @function [parent=#player_manager] AddValidModel
-- @param  #string name Simplified name.
-- @param  #string model Valid PlayerModel path.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entire list of valid player models.
-- @function [parent=#player_manager] AllValidModels
-- @return #table A table "name":"path" key/value pairs of all valid player models.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Clears a player's class association by setting their ClassID to 0.
-- @function [parent=#player_manager] ClearPlayerClass
-- @param  #Player ply Player to clear class from.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets a players class.
-- @function [parent=#player_manager] GetPlayerClass
-- @param  #Player ply Player to get class of.
-- @return #string The players class.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Applies basic class variables when the player spawns.  
-- Called from **GM:PlayerSpawn** in the base gamemode.
-- @function [parent=#player_manager] OnPlayerSpawn
-- @param  #Player ply Player to setup.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Register a class metatable to be assigned to players later.
-- @function [parent=#player_manager] RegisterClass
-- @param  #string name Class name.
-- @param  #table metatable Class metatable.
-- @param  #string base Base class name.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Execute a named function within the player's set class.
-- @function [parent=#player_manager] RunClass
-- @param  #Player ply Player to execute function on.
-- @param  #string funcName Name of function.
-- @param  ... Optional arguments to pass to the function. Can be of any type.
-- @return ... The values returned by the called function.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a player's class.
-- @function [parent=#player_manager] SetPlayerClass
-- @param  #Player ply Player to set class.
-- @param  #string classname Name of class to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves correct hands for given player model. By default returns citizen hands.
-- @function [parent=#player_manager] TranslatePlayerHands
-- @param  #string name Player model name.
-- @return #table A table with following contents:
-- 
-- * _#string model_ : Model of hands.
-- * _#number skin_ : Skin of hands.
-- * _#string body_ : Bodygroups of hands.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the valid model path for a simplified name.
-- @function [parent=#player_manager] TranslatePlayerModel
-- @param  #string shortName The short name of the model.
-- @return #string The valid model path for the short name.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the simplified name for a valid model path of a player model.
-- Opposite of **player_manager.TranslatePlayerModel**.
-- @function [parent=#player_manager] TranslateToPlayerModelName
-- @param  #string model The model path to a player model.
-- @return #string The simplified name for that model.

return nil
