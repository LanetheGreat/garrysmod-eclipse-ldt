-------------------------------------------------------------------------------
-- The list library allows you add and retrieve values to and from lists. The
-- list library is basically a fancy wrapper for a table, but with much more
-- limited functionality.
-- @module list

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Adds an item to a named list.
-- @function [parent=#list] Add
-- @param  #string identifier The list identifier.
-- @param  #any item The item to add to the list.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns true if the list contains the value. (as a value - not a key)
-- @function [parent=#list] Contains
-- @param  #string list List to search through.
-- @param  #any value The value to test.
-- @return #boolean Returns true if the list contains the value, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a copy of the list stored at identifier.
-- @function [parent=#list] Get
-- @param  #string identifier The list identifier.
-- @return #table A copy of the named list.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the actual table of the list stored at identifier. Modifying this
-- will affect the stored list.
-- @function [parent=#list] GetForEdit
-- @param  #string identifier The list identifier.
-- @return #table The actual list.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Sets a specific position in the named list to a value.
-- @function [parent=#list] Set
-- @param  #string identifier The list identifier.
-- @param  #any key The key in the list to set.
-- @param  #any item The item to set to the list as key.

return nil
