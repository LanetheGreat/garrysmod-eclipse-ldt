-------------------------------------------------------------------------------
-- The numpad module allows you to execute functions on a key press or release.
-- @module numpad

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Activates numpad key owned by the player.
-- @function [parent=#numpad] Activate
-- @param  #Player ply The player whose numpad should be simulated.
-- @param  #number key The key to press, see **KEY\_ Enums**.
-- @param  #boolean isButton Should this keypress pretend to be a from a gmod_button? (causes **numpad.FromButton** to return true)

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Deactivates numpad key owned by the player.
-- @function [parent=#numpad] Deactivate
-- @param  #Player ply The player whose numpad should be simulated.
-- @param  #number key The key to press, see **KEY\_ Enums**.
-- @param  #boolean isButton Should this keypress pretend to be a from a gmod_button? (causes **numpad.FromButton** to return true)

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true during a function added with **numpad.Register** when the third
-- argument to **numpad.Activate** is true. 
-- 
-- This is caused when a numpad function is triggered by a button SENT being used.
-- @function [parent=#numpad] FromButton
-- @return #boolean Was a button or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Calls a function registered with **numpad.Register** when a player presses specified key.  
-- See **numpad.OnUp** for key released action.
-- @function [parent=#numpad] OnDown
-- @param  #Player ply The player whose numpad should be watched.
-- @param  #number key The key, corresponding to **KEY\_ Enums**.
-- @param  #string name The name of the function to run, corresponding with the one used in **numpad.Register**.
-- @param  ... Arguments to pass to the function passed to **numpad.Register**.
-- @return #number The impulse ID.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Calls a function registered with **numpad.Register** when a player releases specified key.  
-- See **numpad.OnDown** for key pressed action.
-- @function [parent=#numpad] OnUp
-- @param  #Player ply The player whose numpad should be watched.
-- @param  #number key The key, corresponding to **KEY\_ Enums**.
-- @param  #string name The name of the function to run, corresponding with the one used in **numpad.Register**.
-- @param  ... Arguments to pass to the function passed to **numpad.Register**.
-- @return #number The impulse ID.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Registers a numpad library action for use with **numpad.OnDown** and **numpad.OnUp**.
-- @function [parent=#numpad] Register
-- @param  #string id The unique id of your action.
-- @param  #function func The function to be executed.
-- Arguments are:
-- 
-- * _#Player ply_ : The player who pressed the button.
-- * _..._ : The 4th and all subsequent arguments passed from **numpad.OnDown** and/or **numpad.OnUp**.
-- 
-- Returning false in this function will remove the listener which triggered this function. (example: return false if one of your varargs is an entity which is no longer valid)

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes a function added by either **numpad.OnUp** or **numpad.OnDown**.
-- @function [parent=#numpad] Remove
-- @param  #number ID The impulse ID returned by **numpad.OnUp** or **numpad.OnDown**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Either runs **numpad.Activate** or **numpad.Deactivate** depending on the key's current state.
-- @function [parent=#numpad] Toggle
-- @param  #Player ply The player whose numpad should be simulated.
-- @param  #number key The key to press, corresponding to **KEY\_ Enums**.

return nil
