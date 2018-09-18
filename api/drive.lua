-------------------------------------------------------------------------------
-- The drive library is for adding custom control modes to the new "remote
-- control" entity piloting system in Garry's Mod 13.
-- @module drive

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Optionally alter the view.
-- @function [parent=#drive] CalcView
-- @param  #Player ply The player's view to calculate.
-- @param  #table view The view data. See **ViewData structure**.
-- @return #boolean true if succeeded.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Clientside, the client creates the cmd (usercommand) from their input device
-- (mouse, keyboard) and then it's sent to the server. Restrict view angles here.
-- @function [parent=#drive] CreateMove
-- @param  #CUserCmd cmd The user command.
-- @return #boolean true if succeeded.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Destroys players current driving method.
-- @function [parent=#drive] DestroyMethod
-- @param  #Player ply The player to affect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Player has stopped driving the entity.
-- @function [parent=#drive] End
-- @param  #Player ply The player that has stopped driving.
-- @param  #Entity ent The entity that the player was driving.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- The move is finished. Copy mv back into the target.
-- @function [parent=#drive] FinishMove
-- @param  #Player ply The player that moved.
-- @param  #CMoveData The movement data.
-- @return #boolean true if succeeded.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Returns (or creates if non-existent) a driving method.
-- @function [parent=#drive] GetMethod
-- @param  #Player ply The player to retrieve the driving method from.
-- @return #table A method object.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Executes a player's movement method.
-- @function [parent=#drive] Move
-- @param  #Player ply The player whose movement method to call.
-- @param  #CMoveData mv The movement data.
-- @return #boolean true if succeeded.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Starts driving for the player.
-- @function [parent=#drive] PlayerStartDriving
-- @param  #Player ply The player to affect.
-- @param  #Entity ent The entity to drive.
-- @param  #string mode The driving mode.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Stops the player from driving anything. (For example a prop in sandbox)
-- @function [parent=#drive] PlayerStopDriving
-- @param  #Player ply The player to affect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Registers a new entity drive.
-- @function [parent=#drive] Register
-- @param  #string name The name of the drive.
-- @param  #table data The data required to create the drive. This includes the functions used by the drive.
-- @param  #string base The base of the drive.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Called when the player first starts driving this entity.
-- @function [parent=#drive] Start
-- @param  #Player ply The driving player.
-- @param  #Entity ent The entity being driven.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- The user command is received by the server and then converted into a move.
-- This is also run clientside when in multiplayer, for prediction to work.
-- @function [parent=#drive] StartMove
-- @param  #Player ply The player who issued the movement command.
-- @param  #CMoveData mv The server created movement data.
-- @param  #CUserCmd cmd The movement command issued by the user.
-- @return #boolean true is succeeded.

return nil
