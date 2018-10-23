-------------------------------------------------------------------------------
-- The http library allows either the server or client to communicate with
-- external websites via HTTP, both GET (**http.Fetch**) and POST (**http.Post**) are
-- supported. A more powerful & advanced method can be used via the global HTTP function.
-- @module http

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Launches a GET request.
-- @function [parent=#http] Fetch
-- @param  #string url The URL of the website to fetch.
-- @param  #function onSuccess Function to be called on success. _(Default: nil)_  
-- Arguments are:
-- 
-- * #string body
-- * #string size - equal to **string.len**(body)
-- * #table headers
-- * #number code - The HTTP success code
-- @param  #function onFailure Function to be called on failure. _(Default: nil)_  
-- Arguments are:
-- 
-- * #string error - The error message.
-- @param  #table headers KeyValue table for headers. _(Default: {})_

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Sends an asynchronous POST request to a HTTP server.  
-- HTTP requests returning a status code >= 400 are still considered a success
-- and will call the onSuccess callback.  
-- The onFailure callback is usually only called on DNS or TCP errors. (e.g.
-- the website is unavailable or the domain does not exist)
-- @function [parent=#http] Post
-- @param  #string url The url to of the website to fetch.
-- @param  #table parameters The post parameters to be sent to the server. **Keys and values _must_ be strings.**
-- @param  #function onSuccess Function to be called on success. _(Default: nil)_  
-- Arguments are:
-- 
-- * #string body
-- * #string size - equal to **string.len**(body)
-- * #table headers
-- * #number code - The HTTP success code
-- @param  #function onFailure Function to be called on failure. _(Default: nil)_  
-- Arguments are:
-- 
-- * #string error - The error message.
-- @param  #table headers KeyValue table for headers. _(Default: {})_

return nil
