-------------------------------------------------------------------------------
-- Used to display notifications on the screen (mid-right).
-- @module notification

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Adds a standard notification to your screen.
-- @function [parent=#notification] AddLegacy
-- @param  #string text The string to display.
-- @param  #number type Determines the method for displaying the notification. See the **NOTIFY\_Enums**.
-- @param  #number length The number of seconds to display the notification for.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Adds a notification with an animated progress bar.
-- @function [parent=#notification] AddProgress
-- @param  #any id Can be any type. It's used as an index.
-- @param  #string strText The text to show.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Removes the notification after 0.8 seconds.
-- @function [parent=#notification] Kill
-- @param  #any uid The unique ID of the notification.

return nil
