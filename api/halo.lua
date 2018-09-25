-------------------------------------------------------------------------------
-- The halo library is used to draw glowing outlines around entities, an
-- example of this can be seen by picking up props with the physgun in Garry's
-- Mod 13.
-- @module halo

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Applies a "halo" glow effect to one or multiple entities.
-- @function [parent=#halo] Add
-- @param  #table entities A table of entities to add the halo effect to.
-- @param  #table color The desired color of the halo. See **Color structure**.
-- @param  #number blurX The strength of the halo's blur on the x axis. _(Default: 2)_
-- @param  #number blurY The strength of the halo's blur on the y axis. _(Default: 2)_
-- @param  #number passes The number of times the halo should be drawn per frame. Increasing this may hinder player FPS. _(Default: 1)_
-- @param  #boolean additive Sets the render mode of the halo to additive. _(Default: true)_
-- @param  #boolean ignoreZ Renders the halo through anything when set to true. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Renders a halo according to the specified table, only used internally,
-- called from a PostDrawEffects hook added by the halo library.
-- @function [parent=#halo] Render
-- @param  #table entry Table with info about the halo to draw.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the entity the halo library is currently rendering the halo for.
-- 
-- The main purpose of this function is to be used in **ENTITY:Draw** in order not
-- to draw certain parts of the entity when the halo is being rendered, so
-- there's no halo around unwanted entity parts, such as lasers, 3D2D displays, etc.
-- @function [parent=#halo] RenderedEntity
-- @return #Entity If set, the currently rendered entity by the halo library.

return nil
