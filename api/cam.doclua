-------------------------------------------------------------------------------
-- This directs all drawing to be done to a certain 2D or 3D plane or
-- position, until the corresponding "End" function is called.
-- 
-- The matrix functions exist, but are mostly unusable unless you're
-- familiar with the source engine's layout for each aspect.
-- @module cam

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Shakes the screen at a certain position.
-- @function [parent=#cam] ApplyShake
-- @param  #Vector pos Origin of the shake.
-- @param  #Angle  angles Angles of the shake.
-- @param  #number factor The shake factor.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Switches the renderer back to the previous drawing mode from a 3D context.  
-- This function is an alias of **cam.End3D**.
-- @function [parent=#cam] End

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Switches the renderer back to the previous drawing mode from a 2D context.
-- @function [parent=#cam] End2D

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Switches the renderer back to the previous drawing mode from a 3D context.
-- @function [parent=#cam] End3D

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Switches the renderer back to the previous drawing mode from a 3D2D context.
-- @function [parent=#cam] End3D2D

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Switches the renderer back to the previous drawing mode from a 3D
-- orthographic rendering context.
-- @function [parent=#cam] EndOrthoView

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Tells the renderer to ignore the depth buffer and draw any upcoming
-- operation "ontop" of everything that was drawn yet.
-- @function [parent=#cam] IgnoreZ
-- @param  #boolean ignoreZ Determines whenever to ignore the depth buffer or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pops the current active rendering matrix from the stack and reinstates the
-- previous one.
-- @function [parent=#cam] PopModelMatrix

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pushes the specified matrix onto the render matrix stack. Unlike opengl,
-- this will replace the current model matrix.
-- @function [parent=#cam] PushModelMatrix
-- @param  #VMatrix matrix The matrix to push.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets up a new rendering context. This is an extended version of
-- **cam.Start3D** and **cam.Start2D**. Must be finished by **cam.End3D** or **cam.End2D**.
-- @function [parent=#cam] Start
-- @param  #table dataTbl Render context config. A RenderCamData structure.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets up a new 2D rendering context. Must be finished by **cam.End2D**.
-- 
-- This is almost always used with a render target from the render library.
-- To set its position use **render.SetViewPort** with a target already stored.
-- 
-- **Note**: _This will put an identity matrix at the top of the model matrix
-- stack. If you are trying to use **cam.PushModelMatrix**, call it after this
-- function and not before._
-- 
-- **Note**: _This is a function that starts a 2D rendering context. This
-- means that the only rendering functions will work after it are functions
-- with a 2D rendering context._
-- @function [parent=#cam] Start2D

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets up a new 3D rendering context. Must be finished by **cam.End3D**.  
-- For more advanced settings such as an orthographic view, use **cam.Start** instead.
-- 
-- **Note**: _This is a function that starts a 3D rendering context.  
-- This means that the only rendering functions will work after it are functions
-- with a 3D rendering context._
-- @function [parent=#cam] Start3D
-- @param  #Vector pos Render cam position. _(Default: **EyePos()**)_
-- @param  #Angle  angles Render cam angles. _(Default: **EyeAngles()**)_
-- @param  #number fov Field of view. _(Default: nil)_
-- @param  #number x X coordinate of where to start the new view port. _(Default: 0)_
-- @param  #number y Y coordinate of where to start the new view port. _(Default: 0)_
-- @param  #number w Width of the new viewport. _(Default: **ScrW()**)_
-- @param  #number h Height of the new viewport. _(Default: **ScrH()**)_
-- @param  #number zNear Distance to near clipping plane. _(Default: nil)_
-- @param  #number zFar Distance to far clipping plane. _(Default: nil)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets up a new 2D rendering context. Must be finished by **cam.End3D2D**.
-- 
-- **Notes**: _This is a function that starts a 2D rendering context.  
-- This means that the only rendering functions will work after it are
-- functions with a 2D rendering context._
-- 
-- **Notes**: _This is a rendering function that requires a 3D rendering context.  
-- This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#cam] Start3D2D
-- @param  #Vector pos Origin of the 3D2D context, ie. the top left corner, (0, 0).
-- @param  #Angle  angles Angles of the 3D2D context.  
-- > +x in the 2d context corresponds to +x of the angle (its forward direction).  
-- +y in the 2d context corresponds to -y of the angle (its right direction).  
-- If (dx, dy) are your desired (+x, +y) unit vectors, the angle you want is
-- **dx:AngleEx**(**dx:Cross**(-dy)).
-- @param  #number scale The scale of the render context.
-- > If scale is 1 then 1 pixel in 2D context will equal to 1 unit in 3D context.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets up a new 3d context using orthographic projection.
-- @function [parent=#cam] StartOrthoView
-- @param  #number leftOffset The left plane offset.
-- @param  #number topOffset The top plane offset.
-- @param  #number rightOffset The right plane offset.
-- @param  #number bottomOffset The bottom plane offset.

return nil
