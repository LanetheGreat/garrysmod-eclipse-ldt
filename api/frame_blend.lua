-------------------------------------------------------------------------------
-- The frame blending library.
-- @module frame_blend

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Adds a frame to the blend. Calls **frame_blend.CompleteFrame** once enough
-- frames have passed since last **frame_blend.CompleteFrame** call.
-- @function [parent=#frame_blend] AddFrame

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Blends the frame(s).
-- @function [parent=#frame_blend] BlendFrame

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Renders the frame onto the internal render target.
-- @function [parent=#frame_blend] CompleteFrame

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Actually draws the frame blend effect.
-- @function [parent=#frame_blend] DrawPreview

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether frame blend post processing effect is enabled or not.
-- @function [parent=#frame_blend] IsActive
-- @return #boolean Is frame blend enabled or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Returns whether the current frame is the last frame.
-- @function [parent=#frame_blend] IsLastFrame
-- @return #boolean Whether the current frame is the last frame.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Returns amount of frames needed to render.
-- @function [parent=#frame_blend] RenderableFrames
-- @return #number Amount of frames needed to render

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether we should skip frame or not.
-- @function [parent=#frame_blend] ShouldSkipFrame
-- @return #boolean Should the frame be skipped or not.

return nil
