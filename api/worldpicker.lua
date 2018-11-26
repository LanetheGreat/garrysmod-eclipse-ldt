-------------------------------------------------------------------------------
-- util.worldpicker is for picking an entity in the world while GUI is open.
-- @module worldpicker

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the user is currently picking an entity.
-- @function [parent=#worldpicker] Active
-- @return #boolean Is world picking.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Finishes the world picking. This is called when a user presses their mouse
-- after calling **util.worldpicker.Start**.
-- @function [parent=#worldpicker] Finish
-- @param  #table tr **TraceResult structure** from the mouse press.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Starts picking an entity in the world. This will suppress the next mouse
-- click, and instead use it as a direction in the trace sent to the callback.
-- @function [parent=#worldpicker] Start
-- @param  #function callback Function to call after an entity choice has been made.
-- Argument is:
-- 
-- * _#table tr_ : **TraceResult structure** from the mouse press. tr.Entity will return the entity clicked.

return nil
