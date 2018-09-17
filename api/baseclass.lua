-------------------------------------------------------------------------------
-- The baseclass library.
-- @module baseclass

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Gets the base class of an an object.
-- 
-- This is used not just by entities, but also by widgets, panels, drive modes, weapons and gamemodes (with "gamemode_" prefix).
-- 
-- The keyword **DEFINE_BASECLASS** translates into a call to this function.
-- In the engine, it is replaced with:
-- 
-- `local BaseClass = baseclass.Get`
-- 
-- @function [parent=#baseclass] Get
-- @param  #string name The child class.
-- @return #table The base class's meta table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Add a new base class that can be derived by others. This is done
-- automatically for:
-- 
-- * widgets
-- * panels
-- * drive modes
-- * entities
-- * weapons
-- * gamemodes (with prefix "gamemode_")
-- 
-- @function [parent=#baseclass] Set
-- @param  #string name The name of this base class. Must be completely unique.
-- @param  #table tab The base class.

return nil
