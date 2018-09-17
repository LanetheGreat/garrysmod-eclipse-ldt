-------------------------------------------------------------------------------
-- The ai library.
-- @module ai

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Translates a schedule name to its corresponding ID.
-- @function [parent=#ai] GetScheduleID
-- @param  #string sched The schedule name. In most cases, this will be the same as the SCHED_ Enums name.
-- @return #number The schedule ID, see SCHED_ Enums. Returns -1 if the schedule name isn't valid.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Translates a task name to its corresponding ID.
-- @function [parent=#ai] GetTaskID
-- @param  #string task The task name.
-- @return #number The task ID, see ai_task.h. Returns -1 if the schedule name isn't valid.

return nil
