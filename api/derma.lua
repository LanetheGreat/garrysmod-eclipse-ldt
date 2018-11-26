-------------------------------------------------------------------------------
-- The derma library allows you to add custom derma controls and create &
-- modify derma skins.
-- @module derma

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Gets the color from a Derma skin of a panel and returns default color if
-- not found.
-- @function [parent=#derma] Color
-- @param  #string name The name of the skin in the panel.
-- @param  #Panel pnl The Panel to pull the skin color from.
-- @param  #table default The default color in case of failure.
-- @return #table The skin's color or the default argument if not found.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Defines a new Derma control with an optional base.
-- 
-- This calls **vgui.Register** internally, but also does the following:
-- 
-- * Adds the control to **derma.GetControlList**.
-- * Adds a key "Derma" - This is returned by **derma.GetControlList**.
-- * Makes a global table with the name of the control. _(This is technically
-- deprecated and should not be relied upon)_
-- * If reloading (ex: called this function with name of an existing panel),
-- updates all existing instances of panels with this name. (Updates functions,
-- calls **PANEL:PreAutoRefresh** and **PANEL:PostAutoRefresh**, etc.)
-- @function [parent=#derma] DefineControl
-- @param  #string name Name of the newly created control.
-- @param  #string description Description of the control.
-- @param  #table tab Table containing control methods and properties.
-- @param  #string base Derma control to base the new control off of.
-- @return #table A table containing the new control's methods and properties.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Defines a new skin so that it is usable by Derma. The default skin can be
-- found in "garrysmod/lua/skins/default.lua"
-- @function [parent=#derma] DefineSkin
-- @param  #string name Name of the new skin.
-- @param  #string description Description of the skin.
-- @param  #skinTable containing skin data.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the **derma.Controls** table, a list of all derma controls registered
-- with **derma.DefineControl**.
-- @function [parent=#derma] GetControlList
-- @return #table A listing of all available derma-based controls. See **derma.Controls** for structure and contents.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the default skin table, which can be changed with the hook **GM/ForceDermaSkin**.
-- @function [parent=#derma] GetDefaultSkin
-- @return #table The default skin's table data.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the skin table of the skin with the supplied name.
-- @function [parent=#derma] GetNamedSkin
-- @param  #string name Name of skin to fetch.
-- @return #table The named skin's table data.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns a copy of the table containing every Derma skin.
-- @function [parent=#derma] GetSkinTable
-- @return #table Copy table of every Derma skin.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Clears all cached panels so that they reassess which skin they should be using.
-- @function [parent=#derma] RefreshSkins

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns how many times **derma.RefreshSkins** has been called.
-- @function [parent=#derma] SkinChangeIndex
-- @return #number Amount of times **derma.RefreshSkins** has been called.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Calls the specified hook for the given panel.
-- @function [parent=#derma] SkinHook
-- @param  #string type The type of hook to run.
-- @param  #string name The name of the hook to run.
-- @param  #Panel panel The panel to call the hook for.
-- @param  #number w The width of the panel.
-- @param  #number h The height of the panel.
-- @return #any The returned variable from the skin hook.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns a function to draw a specified texture of panels skin.
-- @function [parent=#derma] SkinTexture
-- @param  #string name The identifier of the texture.
-- @param  #Panel pnl Panel to get the skin of.
-- @param  #any fallback What to return if we failed to retrieve the texture. _(Default: nil)_
-- @return #function A function that is created with the **GWEN library** to draw a texture.

return nil
