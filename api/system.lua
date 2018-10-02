-------------------------------------------------------------------------------
-- The system library provides functions that allow you to gather information
-- about the system running the game, such as operating system, uptime and
-- battery level.
-- @module system

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the total uptime of the current application as reported by Steam.
-- This will return a similar value to SysTime.
-- 
-- **Note**: _This function does not work on Dedicated Servers and will
-- instead return no value._
-- @function [parent=#system] AppTime
-- @return #number Seconds of game uptime as an integer.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the current battery power.
-- @function [parent=#system] BatteryPower
-- @return #number 0-100 if on battery power. If plugged in, the value will be 255 regardless of charging state.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Flashes the window. Currently works only on Windows.
-- @function [parent=#system] FlashWindow

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the country code of this computer, determined by the localization
-- settings of the OS.
-- 
-- **Note**: _This function does not work on Dedicated Servers and will
-- instead return no value._
-- @function [parent=#system] GetCountry
-- @return #string Two-letter country code, using ISO 3166-1 standard.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether or not the game window has focus. Returns true 100% of the
-- time on OS X.
-- 
-- **Note**: _This function does not work on Dedicated Servers and will
-- instead return no value._
-- @function [parent=#system] HasFocus
-- @return #boolean Whether or not the game window has focus.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether the current OS is Linux.
-- @function [parent=#system] IsLinux
-- @return #boolean Whether or not the game is running on Linux.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether the current OS is OSX.
-- @function [parent=#system] IsOSX
-- @return #boolean Whether or not the game is running on OSX.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns whether the game is being run in a window or in fullscreen.
-- @function [parent=#system] IsWindowed
-- @return #boolean Is the game running in a window.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether the current OS is Windows.
-- @function [parent=#system] IsWindows
-- @return #boolean Whether the system the game runs on is Windows or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the synchronized Steam time. This is the number of seconds since the
-- Unix epoch.
-- 
-- **Note**: _This function does not work on Dedicated Servers and will
-- instead return no value._
-- @function [parent=#system] SteamTime
-- @return #number Current Steam-synchronized Unix time.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the amount of seconds since the Steam user last moved their mouse.
-- This is a direct binding to ISteamUtils->GetSecondsSinceComputerActive, and
-- is most likely related to Steam's automatic "Away" online status.
-- 
-- **Note**: _This function does not work on Dedicated Servers and will
-- instead return no value._
-- @function [parent=#system] UpTime
-- @return #number The amount of seconds since the Steam user last moved their mouse.

return nil
