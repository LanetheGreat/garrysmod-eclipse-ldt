-------------------------------------------------------------------------------
-- The gamemode library provides functions relating to the gamemode system in
-- Garry's Mod.
-- @module gamemode

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Called by the engine to call a hook within the loaded gamemode.
-- 
-- The supplied event 'name' must be defined in the active gamemode. Otherwise,
-- nothing will happen - not even hooks added with **hook.Add** will be called.
-- 
-- This is similar to **hook.Run** and **hook.Call**, except the hook library will call
-- hooks created with **hook.Add** even if there is no corresponding gamemode function.
-- @function [parent=#gamemode] Call
-- @param  #string name The name of the hook to call.
-- @param  ... Arguments to pass to the hook function(s).
-- @return #any The result of the hook function - can be up to 6 values. Returns false if the gamemode function doesn't exist (ex: nothing happened), but remember - a hook can also return false.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This returns the internally stored gamemode table.
-- @function [parent=#gamemode] Get
-- @param  #string name The name of the gamemode you want to get.
-- @return #table The gamemode's table.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by the engine when a gamemode is being loaded.
-- @function [parent=#gamemode] Register
-- @param  #table gm Your GM table.
-- @param  #string name Name of your gamemode, lowercase, no spaces.
-- @param  #string derived The gamemode name that your gamemode is derived from.

return nil
