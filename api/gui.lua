-------------------------------------------------------------------------------
-- The gui library is similar to the **input library** but features functions that
-- are more focused on the mouse's interaction with GUI panels.
-- @module gui

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Opens the game menu overlay.
-- @function [parent=#gui] ActivateGameUI

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables the mouse cursor without restricting player movement, like using
-- Sandbox's context menu.
-- @function [parent=#gui] EnableScreenClicker
-- @param  #boolean enabled Whether the cursor should be enabled or not. (true = enable, false = disable)

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Hides the game menu overlay.
-- @function [parent=#gui] HideGameUI

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Simulates a mouse move with the given deltas.
-- @function [parent=#gui] InternalCursorMoved
-- @param  #number deltaX The movement delta on the x axis.
-- @param  #number deltaY The movement delta on the y axis.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Simulates a key press for the given key.
-- @function [parent=#gui] InternalKeyCodePressed
-- @param  #number key The key pressed, see **KEY\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Simulates a key release for the given key.
-- @function [parent=#gui] InternalKeyCodeReleased
-- @param  #number key The key released, see **KEY\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Simulates a key type typing to the specified key.
-- @function [parent=#gui] InternalKeyCodeTyped
-- @param  #number key The key typed, see **KEY\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Simulates an ASCII symbol writing. Use to write text in the chat or in VGUI.
-- Doesn't work while the main menu is open!
-- @function [parent=#gui] InternalKeyTyped
-- @param  #number code ASCII code of symbol, see http://www.mikroe.com/img/publication/spa/pic-books/programming-in-basic/chapter/04/fig4-24.gif

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Simulates a double mouse key press for the given mouse key.
-- @function [parent=#gui] InternalMouseDoublePressed
-- @param  #number The key pressed, see **MOUSE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Simulates a mouse key press for the given mouse key.
-- @function [parent=#gui] InternalMousePressed
-- @param  #number The key pressed, see **MOUSE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Simulates a mouse key release for the given mouse key.
-- @function [parent=#gui] InternalMouseReleased
-- @param  #number The key released, see **MOUSE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Simulates a mouse wheel scroll with the given delta.
-- @function [parent=#gui] InternalMouseWheeled
-- @param  #number delta The amount of scrolling to simulate.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether the console is visible or not.
-- @function [parent=#gui] IsConsoleVisible
-- @return #boolean Whether the console is visible or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whenever the game menu overlay(main menu) is open or not.
-- @function [parent=#gui] IsGameUIVisible
-- @return #boolean Whenever the game menu overlay(main menu) is open or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the cursor's position on the screen.
-- @function [parent=#gui] MousePos
-- @return #number, #number The mouse's position along the x and y axis.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns x component of the mouse position.
-- @function [parent=#gui] MouseX
-- @return #number The mouse's current position along the x axis.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- 
-- Returns Y component of the mouse position.
-- @function [parent=#gui] MouseY
-- @return #number The mouse's current position along the y axis.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Opens specified URL in the steam overlay browser. The URL has to start with
-- either http:// or https://.
-- 
-- **Note**: _User will be asked for confirmation before the website will open._
-- @function [parent=#gui] OpenURL
-- @param  #string url URL to open.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Converts the specified screen position to a direction vector local to the
-- player's view. A related function is **Vector:ToScreen**, which translates a 3D
-- position to a screen coordinate.
-- 
-- **util.AimVector** is a more generic version of this, using a custom view
-- instead of the player's current view.
-- @function [parent=#gui] ScreenToVector
-- @param  #number x X coordinate on the screen.
-- @param  #number y Y coordinate on the screen.
-- @return #Vector The direction.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Shows console in the game UI.
-- @function [parent=#gui] ShowConsole

return nil
