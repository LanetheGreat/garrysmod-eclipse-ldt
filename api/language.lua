-------------------------------------------------------------------------------
-- The language library is used for translation.
-- @module language

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Adds a language item. Language placeholders preceded with "#" are replaced
-- with full text in Garry's Mod once registered with this function.
-- @function [parent=#language] Add
-- @param  #string placeholder The key for this phrase, without the preceding "#".
-- @param  #string fulltext The phrase that should be displayed whenever this key is used.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Retrieves the translated version of inputed string. Useful for
-- concentrating multiple translated strings.
-- @function [parent=#language] GetPhrase
-- @param  #string phrase The phrase to translate.
-- @return #string The translated phrase.

return nil
