-------------------------------------------------------------------------------
-- Steamworks related functions.
-- @module steamworks

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Refreshes clients addons.
-- @function [parent=#steamworks] ApplyAddons

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Downloads a file from the supplied addon and saves it as a .cache file in
-- garrysmod/cache folder. This is mostly used to download the preview image of
-- the addon, but the game seems to also use it to download replays and saves.
-- 
-- In case the retrieved file is an image and you need the **IMaterial**, use
-- **AddonMaterial** with the path supplied from the callback.
-- @function [parent=#steamworks] Download
-- @param  #string workshopPreviewID The Preview ID of workshop item.
-- @param  #boolean uncompress Whether to uncompress the file or not, assuming it was compressed with LZMA.  
-- You will usually want to set this to true.
-- @param  #function resultCallback The function to process retrieved data. The first and only argument is a string, containing path to the saved file.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Retrieves info about supplied Steam Workshop addon.
-- @function [parent=#steamworks] FileInfo
-- @param  #string workshopItemID The ID of Steam Workshop item.
-- @param  #function resultCallback The function to process retrieved data. The first and only argument is a table, containing all the info.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Retrieves a customized list of Steam Workshop addons.
-- @function [parent=#steamworks] GetList
-- @param  #string type The type of items to retrieve.
-- @param  #table tags A table of tags to match.
-- @param  #number offset How much of results to skip from first one. Mainly used for pages.
-- @param  #number numRetrieve How much addons to retrieve.
-- @param  #number days When getting Most Popular content from Steam, this determines a time period. (7=most popular addons in last 7 days, 1=most popular addons today, etc.)
-- @param  #string userID "0" to retrieve all addons, "1" to retrieve addons only published by you.
-- @param  #function resultCallback The function to process retrieved data. The first and only argument is a table, containing all the info.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should use the callback of **steamworks.RequestPlayerInfo** instead._
-- 
-- Retrieves players name by their 64bit SteamID. You must call
-- **steamworks.RequestPlayerInfo** a decent amount of time before calling this function.
-- @function [parent=#steamworks] GetPlayerName
-- @param  #string steamID64 The 64bit Steam ID (aka Community ID) of the player.
-- @return #string The name of that player.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whenever the client is subscribed to the specified Steam Workshop item.
-- @function [parent=#steamworks] IsSubscribed
-- @param  #string workshopItemID The ID of the Steam Workshop item.
-- @return #boolean Is the client subscribed to the addon or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Opens the workshop website in the steam overlay browser.
-- @function [parent=#steamworks] OpenWorkshop

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Publishes dupes, saves or demos to workshop.
-- @function [parent=#steamworks] Publish
-- @param  #table tags The workshop tags to apply.
-- @param  #string filename Path to the file to upload.
-- @param  #string image Path to the image to use as icon.
-- @param  #string name Name of the Workshop submission.
-- @param  #string desc Description of the Workshop submission.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Requests information of the player with SteamID64 for later use with
-- **steamworks.GetPlayerName**.
-- @function [parent=#steamworks] RequestPlayerInfo
-- @param  #string steamID64 The 64bit Steam ID of player.
-- @param  #function callback A callback function with only 1 argument - string name.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- 
-- @function [parent=#steamworks] SetFileCompleted
-- @param  #string workshopid The Steam Workshop item id.
-- @return #string Whatever you have put in as first argument.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Sets whether you have played this addon or not.
-- @function [parent=#steamworks] SetFilePlayed
-- @param  #string workshopid The Steam Workshop item ID.
-- @return #string Whatever you have put in as first argument.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Sets if an addon should be enabled or disabled. Call **steamworks.ApplyAddons**
-- afterwards to update.
-- @function [parent=#steamworks] SetShouldMountAddon
-- @param  #string workshopItemID The ID of the Steam Workshop item we should enable/disable.
-- @param  #boolean shouldMount true to enable the item, false to disable.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whenever the specified Steam Workshop addon will be mounted or not.
-- @function [parent=#steamworks] ShouldMountAddon
-- @param  #string workshopItemID The ID of the Steam Workshop.
-- @return #boolean Will the workshop item be mounted or not.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Subscribes to the specified workshop addon. Call **steamworks.ApplyAddons**
-- afterwards to update.
-- @function [parent=#steamworks] Subscribe
-- @param  #string workshopItemID The ID of the Steam Workshop item we should subscribe to.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Unsubscribes to the specified workshop addon. Call **steamworks.ApplyAddons** afterwards to update.
-- **Note**: _This function should never be called without a user's consent and
-- should not be called if the addon is currently in use (aka: the user is not
-- in the main menu) as it may result in unexpected behaviour._
-- @function [parent=#steamworks] Unsubscribe
-- @param  #string workshopItemID The ID of the Steam Workshop item we should unsubscribe from.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Opens the workshop website for specified Steam Workshop item in the Steam
-- overlay browser.
-- @function [parent=#steamworks] ViewFile
-- @param  #string workshopItemID The ID of workshop item.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Makes the user vote for the specified addon.
-- @function [parent=#steamworks] Vote
-- @param  #string workshopItemID The ID of workshop item.
-- @param  #boolean upOrDown Sets if the user should vote up/down. True makes them upvote, false down.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Retrieves vote info of supplied addon.
-- @function [parent=#steamworks] VoteInfo
-- @param  #string workshopItemID The ID of workshop item.
-- @param  #function resultCallback The function to process retrieved data. The first and only argument is a table, containing all the info.

return nil
