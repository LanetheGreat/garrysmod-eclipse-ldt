-------------------------------------------------------------------------------
-- Add proxies to materials.
-- @module matproxy

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Adds a material proxy.
-- @function [parent=#matproxy] Add
-- @param  #table MatProxyData The information about the proxy. See **MatProxyData structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Called by the engine from OnBind.
-- @function [parent=#matproxy] Call
-- @param  #string uname
-- @param  #IMaterial mat
-- @param  #Entity ent

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Called by the engine from OnBind.
-- @function [parent=#matproxy] Init
-- @param  #string name
-- @param  #string uname
-- @param  #IMaterial mat
-- @param  #table values

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Called by engine, returns true if we're overriding a proxy.
-- @function [parent=#matproxy] ShouldOverrideProxy
-- @param  #string name
-- @return #boolean Are we overriding it.

return nil
