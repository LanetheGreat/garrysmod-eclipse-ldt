-------------------------------------------------------------------------------
-- The presets library lets you add and modify the pre-set options for scripted
-- tools (selected via the white bar at the top of each tools control panel).
-- @module presets

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Adds preset to a preset group.
-- @function [parent=#presets] Add
-- @param  #string groupname The preset group name, usually it's tool class name.
-- @param  #string name Preset name, must be unique.
-- @param  #table values A table of preset console commands.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used internally to tell the player that the name they tried to use in their
-- preset is not acceptable.
-- @function [parent=#presets] BadNameAlert

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether a preset with given name exists or not.
-- @function [parent=#presets] Exists
-- @param  #string type The preset group name, usually it's tool class name.
-- @param  #string name Name of the preset to test.
-- @return #boolean true if the preset does exist.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a table with preset names and values from a single preset group.
-- @function [parent=#presets] GetTable
-- @param  #string groupname Preset group name.
-- @return #table All presets in specified group.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used internally to ask the player if they want to override an already
-- existing preset.
-- @function [parent=#presets] OverwritePresetPrompt
-- @param  #function callback

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Removes a preset entry from a preset group.
-- @function [parent=#presets] Remove
-- @param  #string groupname Preset group to remove from.
-- @param  #string name Name of preset to remove.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Renames preset.
-- @function [parent=#presets] Rename
-- @param  #string groupname Preset group name.
-- @param  #string oldname Old preset name.
-- @param  #string newname New preset name.

return nil
