-------------------------------------------------------------------------------
-- The properties library gives you access to the menu that shows up when right
-- clicking entities while holding C.
-- @module properties

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Add properties to the properties module.
-- @function [parent=#properties] Add
-- @param  #string name A unique name used to identify the property.
-- @param  #table propertyData A table that defines the property. See the **PropertyAdd structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if given entity can be targeted by the player via the
-- properties system. This should be used serverside in your properties to
-- prevent abuse by clientside scripting.
-- @function [parent=#properties] CanBeTargeted
-- @param  #Entity ent The entity to test.
-- @param  #Player ply If given, will also perform a distance check based on the entity's Orientated Bounding Box.
-- @return #boolean True if entity can be targeted, false otherwise.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns an entity player is hovering over with his cursor.
-- @function [parent=#properties] GetHovered
-- @param  #Vector pos Eye position of local player, **Entity:EyePos**.
-- @param  #Vector aimVec Aim vector of local player, **Player:GetAimVector**.
-- @return #Entity The hovered entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if player hovers over any entities and open a properties menu for it.
-- @function [parent=#properties] OnScreenClick
-- @param  #Vector eyepos The eye pos of a player.
-- @param  #Vector eyevec The aim vector of a player.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Opens properties menu for given entity.
-- @function [parent=#properties] OpenEntityMenu
-- @param  #Entity ent The entity to open menu for.
-- @param  #table tr The trace that is passed as second argument to Action callback of a property.

return nil
