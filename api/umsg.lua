-------------------------------------------------------------------------------
-- **This library is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should be using the net library instead._
-- 
-- The umsg (user message) library was previously the most common way of
-- sending information from the server to the client.
-- 
-- **Warning**: _Usermessages have a limit of only 256 bytes!_
-- @module umsg

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Writes an angle to the usermessage.
-- @function [parent=#umsg] Angle
-- @param  #Angle angle The angle to be sent.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Writes a bool to the usermessage.
-- @function [parent=#umsg] Bool
-- @param  #boolean bool The bool to be sent.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Writes a signed char to the usermessage.
-- @function [parent=#umsg] Char
-- @param  #number char The char to be sent.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Dispatches the usermessage to the client(s).
-- @function [parent=#umsg] End

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Writes an entity object to the usermessage.
-- @function [parent=#umsg] Entity
-- @param  #Entity entity The entity to be sent.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Writes a float to the usermessage.
-- @function [parent=#umsg] Float
-- @param  #number float The float to be sent.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Writes a signed int (32 bit) to the usermessage.
-- @function [parent=#umsg] Long
-- @param  #number int The int to be sent.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Inferior version of **util.AddNetworkString**._
-- 
-- The string specified will be networked to the client and receive a identifying
-- number, which will be sent instead of the string to optimize networking.
-- @function [parent=#umsg] PoolString
-- @param  #string string The string to be pooled.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Writes a signed short (16 bit) to the usermessage.
-- @function [parent=#umsg] Short
-- @param  #number short The short to be sent.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should be using net library instead._
-- 
-- Starts a new usermessage.
-- 
-- **Warning**: _Usermessages have a limit of only 256 bytes!_
-- @function [parent=#umsg] 
-- @param  #string name The name of the message to be sent.
-- @param  #Player filter If passed a player object, it will only be sent to the player, if passed a **CRecipientFilter** of players, it will be sent to all specified players,
-- if passed nil (or another invalid value), the message will be sent to all players.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Writes a null terminated string to the usermessage.
-- @function [parent=#umsg] String
-- @param  #string string The string to be sent.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Writes a Vector to the usermessage.
-- @function [parent=#umsg] Vector
-- @param  #Vector vector The vector to be sent.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Writes a vector normal to the usermessage.
-- @function [parent=#umsg] VectorNormal
-- @param  #Vector normal The vector normal to be sent.

return nil
