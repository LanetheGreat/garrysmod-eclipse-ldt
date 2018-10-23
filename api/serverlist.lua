-------------------------------------------------------------------------------
-- Menu state library to query the master server list.
-- @module serverlist

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Adds current server the player is on to their favorites.
-- @function [parent=#serverlist] AddCurrentServerToFavorites

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Queries a server for its player list.
-- @function [parent=#serverlist] PlayerList
-- @param  #string ip The IP address of the server, including the port.
-- @param  #function callback The function to be called if and when the request finishes. Function has one argument, a table containing tables with player info.
-- Each table with player info has next fields:
-- 
-- * _#number time_ : The amount of time the player is playing on the server, in seconds.
-- * _#string name_ : The player name.
-- * _#number score_ : The players score.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Queries the master server for server list.
-- @function [parent=#serverlist] Query
-- @return #table The information about what kind of servers we want. See **ServerQueryData structure**.

return nil
