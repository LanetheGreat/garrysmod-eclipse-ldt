-------------------------------------------------------------------------------
-- The timer library is a very useful set of functions which allow you to run a
-- function periodically or after a given delay.
-- @module timer

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Adjusts the timer if the timer with the given identifier exists.
-- @function [parent=#timer] Adjust
-- @param  #any identifier Identifier of the timer to adjust.
-- @param  #number delay The delay interval in seconds.
-- @param  #number repetitions Repetitions. Use 0 for infinite.
-- @param  #function func The new function.
-- @return #boolean true if succeeded.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Creates a new timer that will repeat its function given amount of times.
-- This function also requires the timer to be named, which allows you to
-- control it after it was created via the timer library.
-- 
-- For a simple one-time timer with no identifiers, see **timer.Simple**.
-- 
-- **Note**: _Timers use CurTime for timing._
-- 
-- **Warning**: _Timers won't advance while the client is timing out from the server._
-- @function [parent=#timer] Create
-- @param  #string identifier Identifier of the timer to create. Must be unique. If a timer already exists with the same identifier, that timer will be updated to the new settings and reset.
-- @param  # number delay The delay interval in seconds. If the delay is too small, the timer will fire on the next frame/tick.
-- @param  #number repetitions The number of times to repeat the timer. Enter 0 for infinite repetitions.
-- @param  #function func Function called when timer has finished the countdown.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whenever the given timer exists or not.
-- @function [parent=#timer] Exists
-- @param  #string identifier Identifier of the timer.
-- @return #boolean Returns true if the timer exists, false if it doesn't.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Pauses the given timer.
-- @function [parent=#timer] Pause
-- @param  #any identifier Identifier of the timer.
-- @return #boolean false if the timer didn't exist or was already paused, true otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Stops and removes a timer created by **timer.Create**.
-- @function [parent=#timer] Remove
-- @param  #string identifier Identifier of the timer to remove.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns amount of repetitions/executions left before the timer destroys itself.
-- @function [parent=#timer] RepsLeft
-- @param  #any identifier Identifier of the timer.
-- @return #number The amount of executions left.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Creates a simple timer that runs the given function after a specified delay.
-- For a more advanced version that you can control after creation, see **timer.Create**.
-- 
-- **Note**: _Timers use CurTime for timing._
-- 
-- **Warning**: _Timers won't advance while the client is timing out from the server._
-- @function [parent=#timer] Simple
-- @param  #number delay How long until the function should be ran(in seconds). Use 0 to have the function run in the next **GM:Think**.
-- @param  #function func The function to run after the specified delay.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Restarts the given timer.
-- 
-- **Note**: _Timers use CurTime for timing._
-- 
-- **Warning**: _Timers won't advance while the client is timing out from the server._
-- @function [parent=#timer] Start
-- @param  #any identifier Identifier of the timer.
-- @return #boolean true if the timer exists, false if it doesn't.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Stops the given timer and rewinds it.
-- @function [parent=#timer] Stop
-- @param  #any identifier Identifier of the timer.
-- @return #boolean false if the timer didn't exist or was already stopped, true otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns amount of time left (in seconds) before the timer executes its function.
-- 
-- **Note**: _If the timer is paused, the amount will be negative._
-- @function [parent=#timer] TimeLeft
-- @param  #any identifier Identifier of the timer.
-- @return #number The amount of time left (in seconds).

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Runs either **timer.Pause** or **timer.UnPause** based on the timer's current status.
-- @function [parent=#timer] Toggle
-- @param  #any identifier Identifier of the timer.
-- @return #boolean status of the timer.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Unpauses the timer.
-- @function [parent=#timer] UnPause
-- @param  #any identifier Identifier of the timer.
-- @return #boolean false if the timer didn't exist or was already running, true otherwise.

return nil
