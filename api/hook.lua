-------------------------------------------------------------------------------
-- The hook library allows you to add hooks called by the game engine, allowing
-- multiple scripts to modify game function.
-- @module hooks

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Add a hook to be called upon the given event occurring.
-- @function [parent=#hook] Add
-- @param  #string eventName The event to hook on to, see **GM Hooks** and **Sandbox Hooks**.
-- @param  #any identifier The unique identifier, usually a string. This can be used elsewhere in the code to replace or remove the hook. The identifier should be unique so that you do not accidentally override some other mods hook, unless that's what you are trying to do.  
-- The identifier can be either a string, or a table/object with an IsValid function defined such as an Entity or Panel. numbers and booleans, for example, are not allowed.  
-- If the identifier is a table/object, it will be inserted in front of the other arguments in the callback and the hook will be called as long as it's valid. However, as soon as IsValid( identifier ) returns false, the hook will be removed.
-- @param  #function func The function to be called, arguments given to it depend on the hook.
-- 
-- **Warning**: _Returning any value besides nil from the hook's function will stop other hooks of the same event down the loop from being executed. Only return a value when absolutely necessary and when you know what you are doing. It **WILL** break other addons._

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Calls all hooks associated with the given event until one returns something
-- other than nil, and then returns that data.  
-- In almost all cases, you should use **hook.Run** instead - it calls **hook.Call**
-- internally but supplies the gamemode table by itself, making your code neater.
-- @function [parent=#hook] Call
-- @param  #string eventName The event to call hooks for.
-- @param  #table gamemodeTable If the gamemode is specified, the gamemode hook within will be called, otherwise not.
-- @param  ... The arguments to be passed to the hooks.
-- @return ... Return data from called hooks. Limited to 6 return values.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a list of all the hooks registered with **hook.Add**.
-- @function [parent=#hook] GetTable
-- @return #table A table of tables.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Removes the hook with the supplied identifier from the given event.
-- @function [parent=#hook] Remove
-- @param  #string eventName The event name.
-- @param  #any identifier The unique identifier of the hook to remove, usually a string.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Calls hooks associated with the given event. Calls all hooks until one
-- returns something other than nil and then returns that data.
-- 
-- If no hook returns any data, it will try to call the **GAMEMODE:**<**eventName**>
-- alternative, if one exists.  
-- 
-- This function internally calls **hook.Call**.  
-- 
-- See also: **gamemode.Call** - same as this, but does not call hooks if the
-- gamemode hasn't defined the function.
-- @function [parent=#hook] Run
-- @param  #string eventName The event to call hooks for.
-- @param  ... The arguments to be passed to the hooks.
-- @return #any Returned data from called hooks.

return nil
