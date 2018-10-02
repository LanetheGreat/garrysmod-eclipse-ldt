-------------------------------------------------------------------------------
-- The search library.
-- @module search

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Adds a search result provider. For examples,
-- see gamemodes/sandbox/gamemode/cl_search_models.lua.
-- @function [parent=#search] AddProvider
-- @param  #function provider Provider function. It has one argument: string searchQuery.
-- You must return a list of tables structured like this:
-- 
-- * _#string text_ : Text to "Copy to clipboard".
-- * _#function func_ : Function to use/spawn the item.
-- * _#Panel icon_ : A panel to add to spawnmenu.
-- * _#table words_ : A table of word suggestions.
-- @param  #string id If provided, ensures that only one provider exists with the given ID at a time. _(Default: nil)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Retrieves search results.
-- @function [parent=#search] GetResults
-- @param  #string query Search query.
-- @return #table A table of results. (Maximum 1024 items)

return nil
