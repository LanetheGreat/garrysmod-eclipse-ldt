-------------------------------------------------------------------------------
-- The saverestore library contains functions relating to the singleplayer save
-- system built into the game.
-- @module saverestore

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds a restore/load hook for the Half-Life 2 save system.
-- @function [parent=#saverestore] AddRestoreHook
-- @param  #string identifier The unique identifier for this hook.
-- @param  #function callback The function to be called when an engine save is being loaded.
-- It has one argument:
-- 
-- * _#IRestore save_ : The restore object to be used to read data from save file that is being loaded.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds a save hook for the Half-Life 2 save system. You can this to carry data
-- through level transitions in Half-Life 2.
-- @function [parent=#saverestore] AddSaveHook
-- @param  #string identifier The unique identifier for this hook.
-- @param  #function callback The function to be called when an engine save is being saved.
-- It has one argument:
-- 
-- * _#ISave save_ : The save object to be used to write data to the save file that is being saved.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Loads **Entity:GetTable** from the save game file that is being loaded and
-- merges it with the given entitys **Entity:GetTable**.
-- @function [parent=#saverestore] LoadEntity
-- @param  #Entity ent The entity which will receive the loaded values from the save.
-- @param  #IRestore save The restore object to read the **Entity:GetTable** from.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by engine when a save is being loaded. This handles loading gamemode
-- and calls all of the hooks added with **saverestore.AddRestoreHook**.
-- @function [parent=#saverestore] LoadGlobal
-- @param  #IRestore save The restore object to read data from the save file with.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by the engine just before **saverestore.LoadGlobal** is.
-- @function [parent=#saverestore] PreRestore

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by the engine just before **saverestore.SaveGlobal** is.
-- @function [parent=#saverestore] PreSave

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a table from the save game file that is being loaded.
-- @function [parent=#saverestore] ReadTable
-- @param  #IRestore save The restore object to read the table from.
-- @return #table The table that has been read, if any.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Loads a variable from the save game file that is being loaded.  
-- Variables will be read in the save order you have saved them.
-- @function [parent=#saverestore] ReadVar
-- @param  #IRestore save The restore object to read variables from.
-- @return #any The variable that was read, if any.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Saves entitys **Entity:GetTable** to the save game file that is being saved.
-- @function [parent=#saverestore] SaveEntity
-- @param  #Entity ent The entity to save **Entity:GetTable** of.
-- @param  #ISave save The save object to save **Entity:GetTable** to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by engine when a save is being saved. This handles saving gamemode
-- and calls all of the hooks added with **saverestore.AddSaveHook**.
-- @function [parent=#saverestore] SaveGlobal
-- @param  #ISave save The save object to write data into the save file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns how many writable keys are in the given table.
-- @function [parent=#saverestore] WritableKeysInTable
-- @param  #table table The table to test.
-- @return #number The number of keys that can be written with **saverestore.WriteTable**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Write a table to a save game file that is being saved.
-- @function [parent=#saverestore] WriteTable
-- @param  #table table The table to write.
-- @param  #ISave save The save object to write the table to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a variable to the save game file that is being saved.
-- @function [parent=#saverestore] WriteVar
-- @param  #any value The value to save. It can be one of the following types: number, boolean, string, Entity, Angle, Vector or table.
-- @param  #ISave save The save object to write the variable to.

return nil
