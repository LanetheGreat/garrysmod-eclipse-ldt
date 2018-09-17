-------------------------------------------------------------------------------
-- The cleanup library allows you to control what happens to custom entities
-- when the clean-up buttons are pressed in the Utilities tab of the Spawn
-- menu (default Q).
-- @module cleanup

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds an entity to a player's cleanup list.
-- @function [parent=#cleanup] Add
-- @param  #Player p1 Who's cleanup list to add the entity to.
-- @param  #string type The type of cleanup.
-- @param  #Entity ent The entity to add to the player's cleanup list.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by the gmod_admin_cleanup console command. Allows admins to clean
-- up the server.
-- @function [parent=#cleanup] CC_AdminCleanup
-- @param  #Player pl The player that called the console command.
-- @param  #string command The console command that called this function.
-- @param  #table args First and only arg is the cleanup type.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by the gmod_cleanup console command. Allows players to cleanup their
-- own props.
-- @function [parent=#cleanup] CC_Cleanup
-- @param  #Player pl The player that called the console command.
-- @param  #string command The console command that called this function.
-- @param  #table args First and only arg is the cleanup type.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Gets the cleanup list.
-- @function [parent=#cleanup] GetList

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the table of cleanup types.
-- @function [parent=#cleanup] GetTable
-- @return #table The table of cleanup types.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Registers a new cleanup type.
-- @function [parent=#cleanup] Register
-- @param  #string type Name of the new type.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Replaces one entity in the cleanup module with another.
-- @function [parent=#cleanup] ReplaceEntity
-- @param  #Entity from The old entity to replace.
-- @param  #Entity to The new entity to use in place.
-- @return #boolean Whether any action was taken.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Repopulates the clients cleanup menu.
-- @function [parent=#cleanup] UpdateUI

return nil
