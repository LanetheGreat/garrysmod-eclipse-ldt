-------------------------------------------------------------------------------
-- The gmsave library provides functions relating to the singleplayer save
-- system in Garry's Mod.
-- @module gmsave

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Loads a saved map.
-- @function [parent=#gmsave] LoadMap
-- @param  #string mapData The JSON encoded string containing all the map data.
-- @param  #Player ply The player to load positions for.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets player position and angles from supplied table.
-- @function [parent=#gmsave] PlayerLoad
-- @param  #Player ply The player to "load" values for.
-- @param  #table data A table containing Origin and Angle keys for position and angles to set.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table containing player position and angles. Used by **gmsave.SaveMap**.
-- @function [parent=#gmsave] PlayerSave
-- @param  #Player ply The player to "save".
-- @return #table A table containing player position(Origin) and angles(Angle).

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Saves the map.
-- @function [parent=#gmsave] SaveMap
-- @param  #Player ply The player, whose position should be saved for loading the save.
-- @return #string The encoded to JSON string containing save data.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns if we should save this entity in a duplication or a map save or not.
-- @function [parent=#gmsave] ShouldSaveEntity
-- @param  #Entity ent The entity to check.
-- @param  #table t A table containing classname key with entities classname.
-- @return #boolean Should save entity or not.

return nil
