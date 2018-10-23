-------------------------------------------------------------------------------
-- The drag'n'drop library, used internally by certain base panels to allow
-- for drag'n'drop functionality, like spawnmenu's customizations.
-- @module dragndrop

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Calls the receiver function of hovered panel.
-- @function [parent=#dragndrop] CallReceiverFunction
-- @param  #boolean bDoDrop true if the mouse was released, false if we right clicked.
-- @param  #number command The command value. This should be the ID of the clicked dropdown menu. ( if right clicked, or nil )
-- @param  #number mx The local to the panel mouse cursor X position when the click happened.
-- @param  #number my The local to the panel mouse cursor Y position when the click happened.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Clears all the internal drag'n'drop variables.
-- @function [parent=#dragndrop] Clear

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Handles the drop action of drag'n'drop library.
-- @function [parent=#dragndrop] Drop

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns a table of currently dragged panels.
-- @function [parent=#dragndrop] GetDroppable
-- @param  #string name If set, the function will return only the panels with this **Panel:Droppable** name. _(Default: nil)_
-- @return #table A table of all panels that are being currently dragged, if any.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Currently does nothing when called. Possibly for overriding?
-- @function [parent=#dragndrop] HandleDroppedInGame

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Handles the hover think. Called from **dragndrop.Think**.
-- @function [parent=#dragndrop] HoverThink

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether the user is dragging something with the drag'n'drop system.
-- @function [parent=#dragndrop] IsDragging
-- @return #boolean True if the user is dragging something with the drag'n'drop system.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Starts the drag'n'drop.
-- @function [parent=#dragndrop] StartDragging

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Stops the drag'n'drop and calls **dragndrop.Clear**.
-- @function [parent=#dragndrop] StopDragging

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Handles all the drag'n'drop processes. Calls **dragndrop.UpdateReceiver** and
-- **dragndrop.HoverThink**.
-- @function [parent=#dragndrop] Think

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Updates the receiver to drop the panels onto. Called from **dragndrop.Think**.
-- @function [parent=#dragndrop] UpdateReceiver

return nil
