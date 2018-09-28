-------------------------------------------------------------------------------
-- The killicon library is used to add to and control the icons that appear in
-- the top right of your screen when a player is killed.
-- @module killicon

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates new kill icon using a texture.
-- @function [parent=#killicon] Add
-- @param  #string class Weapon or entity class.
-- @param  #string texture Path to the texture.
-- @param  #table color Color of the kill icon. See **Color Structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates kill icon from existing one.
-- @function [parent=#killicon] AddAlias
-- @param  #string new_class New class of the kill icon.
-- @param  #string existing_class Already existing kill icon class.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Adds kill icon for given weapon/entity class using special font.
-- @function [parent=#killicon] AddFont
-- @param  #string class Weapon or entity class.
-- @param  #string font Font to be used.
-- @param  #string symbol The symbol to be used.
-- @param  #table color Color of the killicon. See **Color Structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a kill icon.
-- @function [parent=#killicon] Draw
-- @param  #number x X coordinate of the icon.
-- @param  #number y Y coordinate of the icon.
-- @param  #string name Classname of the kill icon.
-- @param  #number alpha Alpha/transparency value(0 - 255) of the icon.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Checks if kill icon exists for given class.
-- @function [parent=#killicon] Exists
-- @param  #string class The class to test.
-- @return #boolean Returns true if kill icon exists.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the size of a kill icon.
-- @function [parent=#killicon] GetSize
-- @param  #string name Classname of the kill icon.
-- @return #number, #number Width and Height of the kill icon.

return nil
