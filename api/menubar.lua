-------------------------------------------------------------------------------
-- The menubar library.
-- @module menubar

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates the menu bar (The bar at the top of the screen when holding C or Q
-- in sandbox) and docks it to the top of the screen. It will not appear.  
-- Calling this multiple times will NOT remove previous panel.
-- @function [parent=#menubar] Init

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Checks if the supplied panel is parent to the menubar.
-- @function [parent=#menubar] IsParent
-- @param  #Panel pnl The panel to check.
-- @return #boolean Is parent or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Parents the menubar to the panel and displays the menubar.
-- @function [parent=#menubar] ParentTo
-- @param  #Panel pnl The panel to parent to.

return nil
