-------------------------------------------------------------------------------
-- **This library is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should be using the net library instead._
-- 
-- The usermessage library is used to receive user messages from the server on
-- the client.
-- 
-- **Warning**: _Usermessages have a limit of only 256 bytes!_
-- @module usermessage

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table of every usermessage hook.
-- @function [parent=#usermessage] GetTable
-- @return #table Table of hooks.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should be using net library instead._
-- 
-- Sets a hook for the specified to be called when a usermessage with the
-- specified name arrives.
-- 
-- **Warning**: _Usermessages have a limit of only 256 bytes!_
-- @function [parent=#usermessage] 
-- @param  #string name The message name to hook to.
-- @param  #function callback The function to be called if the specified message was received.
-- Parameters (Optional):
-- 
-- * _#bf\_read msg_
-- * _... varargs_
-- @param  ... Arguments that are passed to the callback function when the hook is called.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Called by the engine when a usermessage arrives, this method calls the hook
-- function specified by **usermessage.Hook** if any.
-- @function [parent=#usermessage] IncomingMessage
-- @param  #string name The message name.
-- @param  #bf_read msg The message.

return nil
