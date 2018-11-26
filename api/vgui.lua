-------------------------------------------------------------------------------
-- The vgui library allows you to script and create your own panels using
-- Valve's GUI system. For an alphabetically ordered list of VGUI panels, see
-- **VGUI Element List**.
-- @module vgui

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Creates a panel by the specified classname.
-- @function [parent=#vgui] Create
-- @param  #string classname Classname of the panel to create. Valid classnames are listed at: **VGUI Element List**.
-- @param  #Panel parent Parent of the created panel. _(Default: nil)_
-- @param  #string name Name of the created panel. _(Default: nil)_
-- @return #Panel New panel.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Creates a panel from table.
-- @function [parent=#vgui] CreateFromTable
-- @param  #table metatable Your PANEL table.
-- @param  #Panel parent Which panel to parent the newly created panel to. _(Defaault: nil)_
-- @param  #string name Name of your panel. _(Default: nil)_
-- @return #Panel Created panel.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Creates a engine panel.
-- @function [parent=#vgui] CreateX
-- @param  #string class Class of the panel to create.
-- @param  #Panel parent If specified, parents created panel to given one. _(Default: nil)_
-- @param  #string name Name of the created panel. _(Default: nil)_
-- @return #Panel Created panel.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whenever the cursor is currently active and visible.
-- @function [parent=#vgui] CursorVisible
-- @return #boolean Is cursor visible.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether the currently focused panel is a child of the given one.
-- @function [parent=#vgui] FocusedHasParent
-- @param  #Panel parent The parent panel to check the currently focused one against.
-- This doesn't need to be a direct parent. (focused panel can be a child of a child and so on)
-- @return #boolean Whether or not the focused panel is a child of the passed one.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Gets the method table of this panel. Does not return parent methods!
-- @function [parent=#vgui] GetControlTable
-- @param  #string Panelname The name of the panel.
-- @return #table Panel methods.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the panel the cursor is hovering above.
-- 
-- **Warning**: _This returns a cached value that is only updated after
-- rendering and before the next VGUI Think/Layout pass._
-- _ex: it lags one frame behind panel layout and is completely unhelpful for
-- **PANEL:Paint** if your panels are moving around under the mouse a lot every frame._
-- @function [parent=#vgui] GetHoveredPanel
-- @return #Panel The panel that the user is currently hovering over with their cursor.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the panel which is currently receiving keyboard input.
-- @function [parent=#vgui] GetKeyboardFocus
-- @return #Panel The panel with keyboard focus.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the global world panel which is the parent to all others. See also **GetHUDPanel**.
-- @function [parent=#vgui] GetWorldPanel
-- @return #Panel The world panel.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whenever the cursor is hovering the world panel.
-- @function [parent=#vgui] IsHoveringWorld
-- @return #boolean Is hovering over world panel.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Registers a panel for later creation.
-- @function [parent=#vgui] Register
-- @param  #string classname Classname of the panel to create.
-- @param  #table panelTable The table containing the panel information.
-- @param  #string baseName Name of the base of the panel.
-- @return #Panel New panel.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Registers a new VGUI panel from a file.
-- @function [parent=#vgui] RegisterFile
-- @param  #string file The file to register.
-- @return #table A table containing info about the panel. Can be supplied to **vgui.CreateFromTable**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Registers a table to use as a panel. All this function does is assigns Base
-- key to your table and returns the table.
-- @function [parent=#vgui] RegisterTable
-- @param  #table panel The PANEL table.
-- @param  #string base A base for the panel. _(Default: "Panel")_
-- @return #table The PANEL table.

return nil
