-------------------------------------------------------------------------------
-- The input library allows you to gather information about the clients input
-- devices (mouse & keyboard), such as the cursor position and whether a key is
-- pressed or not.
-- @module input

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the last key captured by key trapping.
-- @function [parent=#input] CheckKeyTrapping
-- @return #number The key, see **KEY\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the cursor's position on the screen.
-- @function [parent=#input] GetCursorPos
-- @return #number, #number The mouse's current x and y position.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Gets the button name from a numeric button code. The name needs to be
-- translated with **language.GetPhrase** before being displayed.
-- 
-- **Note**: Despite the name of the function, this also works for the full
-- range of keys in **BUTTON\_CODE\_ Enums**.
-- @function [parent=#input] GetKeyName
-- @param  #number button The button, see **BUTTON\_CODE\_ Enums**.
-- @return #string The button's name as a string.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Gets whether the specified button code is down.  
-- Unlike **input.IsKeyDown** this can also detect joystick presses from **JOYSTICK\_ Enums**.
-- @function [parent=#input] IsButtonDown
-- @param  #number button The button, valid values are in the range of **BUTTON\_CODE\_ Enums**.
-- @return #boolean Is the button down.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether a control key is being pressed.
-- @function [parent=#input] IsControlDown
-- @return #boolean Is Ctrl key down or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Gets whether a key is down.
-- @function [parent=#input] IsKeyDown
-- @param  #number key The key, see **KEY\_ Enums**.
-- @return #boolean Is the key down.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether key trapping is activate and the next key press will be captured.
-- @function [parent=#input] IsKeyTrapping
-- @return #boolean Whether key trapping active or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Gets whether a mouse button is down.
-- @function [parent=#input] IsMouseDown
-- @param  #number mouseKey The key, see **MOUSE\_ Enums**.
-- @return #boolean Is the key down.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Gets whether a shift key is being pressed.
-- @function [parent=#input] IsShiftDown
-- @return #boolean Is a shift key down.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Gets the match uppercase key for the specified binding.
-- @function [parent=#input] LookupBinding
-- @param  #string binding The binding name.
-- @param  #boolean exact True if the binding should match exactly. _(Default: false)_
-- @return #string The first key found with that binding or no value if no key with given binding was found.  
-- See also **input.GetKeyCode**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the bind string that the given key is bound to.
-- @function [parent=#input] LookupKeyBinding
-- @param  #number key Key from **BUTTON\_CODE\_ Enums**.
-- @return #string The bind string of the given key.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Switches to the provided weapon on the next **CUserCmd** generation/CreateMove
-- call. Direct binding to **CInput::MakeWeaponSelection**.
-- @function [parent=#input] SelectWeapon
-- @param  #Weapon weapon The weapon entity to switch to.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Sets the cursor's position on the screen, relative to the topleft corner of the window.
-- @function [parent=#input] SetCursorPos
-- @param  #number mouseX X coordinate for mouse position.
-- @param  #number mouseY Y coordinate for mouse position.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Begins waiting for a key to be pressed so we can save it for
-- **input.CheckKeyTrapping**. Used by the **DBinder**.
-- @function [parent=#input] StartKeyTrapping

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether a key was initially pressed in the same frame this function
-- was called. This function only works in Move hooks, and will detect key
-- presses even in main menu or when a typing in a text field.
-- @function [parent=#input] WasKeyPressed
-- @param  #number key The key, see **KEY\_ Enums**.
-- @return #boolean True if the key was initially pressed the same frame that this function was called, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether a key was released in the same frame this function was
-- called. This function only works in Move hooks, and will detect key presses
-- even in main menu or when a typing in a text field.
-- @function [parent=#input] WasKeyReleased
-- @param  #number key The key, see **KEY\_ Enums**.
-- @return #boolean True if the key was released the same frame that this function was called, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether the key is being held down or not. This function only works
-- in Move hooks, and will detect key presses even in main menu or when a
-- typing in a text field.
-- @function [parent=#input] WasKeyTyped
-- @param  #number key The key to test, see **KEY\_ Enums**.
-- @return #boolean Whether the key is being held down or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether a mouse key was double pressed in the same frame this
-- function was called. If this function returns true, **input.WasMousePressed**
-- will return false.
-- 
-- This function only works in Move hooks, and will detect mouse events even in
-- main menu or when a typing in a text field.
-- @function [parent=#input] WasMouseDoublePressed
-- @param  #number button The mouse button to test, see **MOUSE\_ Enums**.
-- @return #boolean Whether the mouse key was double pressed or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether a mouse key was initially pressed in the same frame this
-- function was called. If **input.WasMouseDoublePressed** returns true, this
-- function will return false.
-- 
-- This function only works in Move hooks, and will detect mouse events even in
-- main menu or when a typing in a text field.
-- @function [parent=#input] WasMousePressed
-- @param  #number button The mouse button to test, see **MOUSE\_ Enums**.
-- @return #boolean True if the mouse key was initially pressed the same frame that this function was called, false otherwise.

return nil
