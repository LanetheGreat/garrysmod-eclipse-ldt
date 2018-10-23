-------------------------------------------------------------------------------
-- The weapons library allows you to access information about any scripted
-- weapons loaded into the game, as well as register your own weapons.
-- @module weapons

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets a copy of weapon table by name. If all you need to do is access a
-- variable from the weapon table, use **weapons.GetStored** instead.
-- @function [parent=#weapons] Get
-- @param  #string classname Class name of weapon to retrieve.
-- @return #table The retrieved table or nil.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Get a list of all the registered SWEPs. This does not include weapons added
-- to spawnmenu manually.
-- @function [parent=#weapons] GetList
-- @return #table List of all the registered SWEPs.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the REAL weapon table, not a copy.
-- @function [parent=#weapons] GetStored
-- @param  #string weapon_class Weapon class to retrieve weapon table of.
-- @return #table The weapon table.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if name is based on base.
-- @function [parent=#weapons] IsBasedOn
-- @param  #string name Entity's class name to be checked.
-- @param  #string base Base class name to be checked.
-- @return #boolean Returns true if class name is based on base, else false.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called after all SWEPS have been loaded and runs **baseclass.Set** on each one.  
-- You can retrieve all the currently registered SWEPS with **weapons.GetList**.
-- 
-- **Note**: _This is not called after a SWEP auto refresh, and thus the inherited
-- baseclass functions retrieved with **baseclass.Get** will not be updated._
-- @function [parent=#weapons] OnLoaded

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Used to register your SWEP with the engine.
-- @function [parent=#weapons] Register
-- @param  #table swep_table The SWEP table.
-- @param  #string classname Classname to assign to that swep.

return nil
