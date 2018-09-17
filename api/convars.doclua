-------------------------------------------------------------------------------
-- The cvars library allows you to control what happens when a cvar (console
-- variable) is changed.
-- @module convars

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Adds a callback to be called when the named convar changes.
-- @function [parent=#convars] AddChangeCallback
-- @param  #string name The name of the convar to add the change callback to.
-- @param  #function callback The function to be called when the convar changes.  
-- The arguments passed are:
-- 
-- * _#string convar_   : The name of the convar.
-- * _#string oldValue_ : The old value of the convar.
-- * _#string newValue_ : The new value of the convar.
-- @param  #string identifier If set, you will be able to remove the callback using **cvars.RemoveChangeCallback**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Retrieves console variable as a boolean.
-- @function [parent=#convars] Bool
-- @param  #string cvar Name of console variable.
-- @param  #boolean default The value to return if the console variable does not exist. _(Default: false)_
-- @return #boolean The convar value as a boolean.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a table of the given **ConVars** callbacks.
-- @function [parent=#convars] GetConVarCallbacks
-- @param  #string name The name of the **ConVar**.
-- @param  #boolean createIfNotFound Whether or not to create the internal callback table for given **ConVar** if there isn't one yet. _(Default: false)_  
-- This argument is internal and should not be used.
-- @return #table A table of the convar's callbacks, or nil if the convar doesn't exist.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Retrieves console variable as a number.
-- @function [parent=#convars] Number
-- @param  #string cvar Name of console variable.
-- @param  #number default The value to return if the console variable does not exist. _(Default: false)_
-- @return #number The convar value as a number.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._  
-- _You are probably looking for **cvars.AddChangeCallback**._
-- 
-- Called by the engine when a convar value changes.
-- @function [parent=#convars] OnConVarChanged
-- @param  #string name Name of console variable.
-- @param  #string oldVal The old value of the convar.
-- @param  #string newVal The new value of the convar.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Removes a callback for a convar using the the callback's identifier. The
-- identifier should be the third argument specified for **cvars.AddChangeCallback**.
-- @function [parent=#convars] RemoveChangeCallback
-- @param  #string name The name of the convar to remove the callback from.
-- @param  #string identifier The callback's identifier.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Retrieves console variable as a string.
-- @function [parent=#convars] String
-- @param  #string cvar Name of console variable.
-- @param  #string default The value to return if the console variable does not exist. _(Default: false)_
-- @return #string The convar value as a string.

return nil
