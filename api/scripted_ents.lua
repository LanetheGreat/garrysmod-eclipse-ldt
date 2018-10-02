-------------------------------------------------------------------------------
-- The scripted_ents library allows you to access information about any
-- scripted entities loaded into the game, as well as register your own entities.
-- @module scripted_ents

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Defines an alias string that can be used to refer to another classname.
-- @function [parent=#scripted_ents] Alias
-- @param  #string alias A new string which can be used to refer to another classname.
-- @param  #string classname The classname the alias should refer to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a copy of the ENT table for a class, including functions defined by
-- the base class.
-- @function [parent=#scripted_ents] Get
-- @param  #string classname The classname of the ENT table to return, can be an alias.
-- @return #table A copy of the entity's ENT table.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a copy of the list of all ENT tables registered.
-- @function [parent=#scripted_ents] GetList
-- @return #table A table of **ENT structures**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves a member of entity's table.
-- @function [parent=#scripted_ents] GetMember
-- @param  #string class Entity's class name.
-- @param  #string name Name of member to retrieve.
-- @return #any The member or nil if failed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a list of all ENT tables which contain either **ENT.Spawnable** or
-- **ENT.AdminSpawnable**.
-- @function [parent=#scripted_ents] GetSpawnable
-- @return #table A table of **ENT structures**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the actual ENT table for a class. Modifying functions/variables in
-- this table will change newly spawned entities.
-- @function [parent=#scripted_ents] GetStored
-- @param  # string classname The classname of the ENT table to return.
-- @return #table The entity's actual ENT table.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the 'type' of a class, this will one of the following: 'anim', 'ai',
-- 'brush', or 'point'.
-- @function [parent=#scripted_ents] GetType
-- @param  #string classname The classname to check.
-- @return #string The type's name.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the specified class name is based on base.
-- @function [parent=#scripted_ents] IsBasedOn
-- @param  #string name Entity's class name to be checked.
-- @param  #string base Base class name to be checked.
-- @return #boolean Returns true if class name is based on base, else false.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called after all ENTS have been loaded and runs **baseclass.Set** on each one.  
-- You can retrieve all the currently registered ENTS with **scripted_ents.GetList**.
-- 
-- **Note**: _This is not called after an ENT auto refresh, and thus the
-- inherited baseclass functions retrieved with **baseclass.Get** will not be updated._
-- @function [parent=#scripted_ents] OnLoaded

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Registers an ENT table with a classname. Reregistering an existing classname
-- will automatically update the functions of all existing entities of that class.
-- @function [parent=#scripted_ents] Register
-- @param  #table ENT The ENT table to register.
-- @param  #string classname The classname to register.

return nil
