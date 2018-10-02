-------------------------------------------------------------------------------
-- The undo library allows you to add custom entities to the undo list,
-- allowing users to "undo" their creation with their undo (default: Z) key.
-- @module undo

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds an entity to the current undo block.
-- @function [parent=#undo] AddEntity
-- @param  #Entity ent The entity to add.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds a function to call when the current undo block is undone.
-- @function [parent=#undo] AddFunction
-- @param  #function func The function to call.
-- @param  ... Arguments to pass to the function. (after the undo info table)

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Begins a new undo entry
-- @function [parent=#undo] Create
-- @param  #string name Name of the undo message to show to players.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Processes an undo block (in table form). This is used internally by the undo
-- manager when a player presses Z.
-- @function [parent=#undo] Do_Undo
-- @param  #table tab The undo block to process as an **Undo structure**.
-- @return #number Number of removed entities.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Completes an undo entry, and registers it with the player's client.
-- @function [parent=#undo] Finish

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Serverside, returns a table containing all undo blocks of all players.
-- Clientside, returns a table of the local player's undo blocks.
-- @function [parent=#undo] GetTable
-- @return #table The undo table.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Makes the UI dirty - it will re-create the controls the next time it is viewed.
-- @function [parent=#undo] MakeUIDirty

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Replaces any instance of the "from" reference with the "to" reference, in
-- any existing undo block. Returns true if something was replaced
-- @function [parent=#undo] ReplaceEntity
-- @param  #Entity from The old entity.
-- @param  #Entity to The new entity to replace with.
-- @return #boolean true if something was replaced, false otherwise.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets a custom undo text for the current undo block.
-- @function [parent=#undo] SetCustomUndoText
-- @param  #string customText The text to display when the undo block is undone.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the player which the current undo block belongs to.
-- @function [parent=#undo] SetPlayer
-- @param  #Player ply The player responsible for undoing the block.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Adds a hook (CPanelPaint) to the control panel paint function so we can
-- determine when it is being drawn.
-- @function [parent=#undo] SetupUI

return nil
