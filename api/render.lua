-------------------------------------------------------------------------------
-- The render library is a powerful set of functions that let you control how
-- the world and its contents are rendered. It can also be used to draw some 3D
-- clientside effects such as beams, boxes and spheres.
-- @module render

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Adds a beam segment to the beam started by **render.StartBeam**.
-- @function [parent=#render] AddBeam
-- @param  #Vector startPos Beam start position.
-- @param  #number width The width of the beam.
-- @param  #number textureEnd The end coordinate of the texture used.
-- @param  #table color The color to be used. Uses the **Color structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Blurs the render target(or a given texture).
-- @function [parent=#render] BlurRenderTarget
-- @param  #ITexture rendertarget The texture to blur.
-- @param  #number blurx Horizontal amount of blur.
-- @param  #number blury Vertical amount of blur.
-- @param  #number passes Amount of passes to go through.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **Warning**: _This function is broken and does absolutely nothing._
-- @function [parent=#render] BrushMaterialOverride
-- @param  #IMaterial mat _(Default: nil)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Captures a part of the current render target and returns the data as a
-- binary string in the given format.
-- 
-- Since the pixel buffer clears itself every frame, this will return a black
-- screen outside of render hooks. To capture the user's final view, use
-- **GM:PostRender**. This will not capture the Steam overlay or third-party
-- injections (such as the Discord overlay, Overwolf, and advanced cheats) on
-- the user's screen.
-- @function [parent=#render] Capture
-- @param  #table captureData Parameters of the capture. See **RenderCaptureData structure**.
-- @return #string The binary image data.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Dumps the current render target and allows the pixels to be accessed by **render.ReadPixel**.
-- @function [parent=#render] CapturePixels

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Clears the current render target and the specified buffers.
-- @function [parent=#render] Clear
-- @param  #number r Red component to clear to.
-- @param  #number g Green component to clear to.
-- @param  #number b Blue component to clear to.
-- @param  #number a Alpha component to clear to.
-- @param  #boolean clearDepth Clear the depth buffer.
-- @param  #boolean clearStencil Clear the stencil buffer.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Clears the current rendertarget for obeying the current stencil buffer conditions.
-- @function [parent=#render] ClearBuffersObeyStencil
-- @param  #number r Value of the red channel to clear the current rt with.
-- @param  #number g Value of the green channel to clear the current rt with.
-- @param  #number b Value of the blue channel to clear the current rt with.
-- @param  #number a Value of the alpha channel to clear the current rt with.
-- @param  #boolean depth Clear the depth buffer.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resets the depth buffer.
-- @function [parent=#render] ClearDepth

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Clears a render target.  
-- It uses **render.Clear** then **render.SetRenderTarget** on the modified render target.
-- @function [parent=#render] ClearRenderTarget
-- @param  #ITexture texture The texture to clear.
-- @param  #table Color The color, see **Color structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resets all values in the stencil buffer to zero.
-- @function [parent=#render] ClearStencil

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the stencil value in a specified rectangle.
-- This is not affected by **render.SetStencilWriteMask**.
-- @function [parent=#render] ClearStencilBufferRectangle
-- @param  #number originX X origin of the rectangle.
-- @param  #number originY Y origin of the rectangle.
-- @param  #number endX The end X coordinate of the rectangle.
-- @param  #number endY The end Y coordinate of the rectangle.
-- @param  #number stencilValue Value to set cleared stencil buffer to.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Calculates the lighting caused by dynamic lights for the specified surface.
-- @function [parent=#render] ComputeDynamicLighting
-- @param  #Vector position The position to sample from.
-- @param  #Vector normal The normal of the surface.
-- @return #Vector A vector representing the light at that point.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Calculates the light color of a certain surface.
-- @function [parent=#render] ComputeLighting
-- @param  #Vector position The position to sample from.
-- @param  #Vector normal The normal of the surface.
-- @return #Vector A vector representing the light at that point.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Copies the currently active Render Target to the specified texture.
-- @function [parent=#render] CopyRenderTargetToTexture
-- @param  #ITexture target The texture to copy to.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Copies the contents of one texture to another. Only works with rendertargets.
-- @function [parent=#render] CopyTexture
-- @param  #ITexture texture_from
-- @param  #ITexture texture_to

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Changes the cull mode.
-- @function [parent=#render] CullMode
-- @param  #number Cullmode, see **MATERIAL\_CULLMODE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Set's the depth range of the upcoming render.
-- @function [parent=#render] DepthRange
-- @param  #number depthmin The minimum depth of the upcoming render. 0.0 = render normally; 1.0 = render nothing.
-- @param  #number depthmax The maximum depth of the upcoming render. 0.0 = render everything (through walls); 1.0 = render normally.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws textured beam.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#render] DrawBeam
-- @param  #Vector startPos Beam start position.
-- @param  #Vector endPos Beam end position.
-- @param  #number width The width of the beam.
-- @param  #number textureStart The start coordinate of the texture used.
-- @param  #number textureEnd The end coordinate of the texture used.
-- @param  #table color The color to be used. Uses the **Color structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a box in 3D space.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#render] DrawBox
-- @param  #Vector position Origin of the box.
-- @param  #Angle angles Orientation of the box.
-- @param  #Vector mins Start position of the box, relative to origin.
-- @param  #Vector maxs End position of the box, relative to origin.
-- @param  #table color The color of the box. Uses the **Color structure**.
-- @param  #boolean writeZ Should this render call write to the depth buffer.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a line in 3D space.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#render] DrawLine
-- @param  #Vector startPos Line start position in world coordinates.
-- @param  #Vector endPos Line end position in world coordinates.
-- @param  #table color The color to be used. Uses the **Color structure**.
-- @param  #boolean writeZ Whether or not to consider the Z buffer. If false, the line will be drawn over everything currently drawn, if true, the line will be drawn with depth considered, as if it were a regular object in 3D space.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws 2 connected triangles.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#render] DrawQuad
-- @param  #Vector vert1 The first vertex.
-- @param  #Vector vert2 The second vertex.
-- @param  #Vector vert3 The third vertex.
-- @param  #Vector vert4 The fourth vertex.
-- @param  #table color The color of the quad. See **Color structure**. _(Default: Color(255,255,255))_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a quad.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#render] DrawQuadEasy
-- @param  #Vector position Origin of the sprite.
-- @param  #Vector normal The face direction of the quad.
-- @param  #number width The width of the quad.
-- @param  #number height The height of the quad.
-- @param  #table color The color of the quad. Uses the **Color structure**.
-- @param  #number rotation The rotation of the quad in degrees.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the the current material set by **render.SetMaterial** to the whole screen.
-- 
-- **Note**: _This is a rendering function that requires a 2D rendering context._
-- _This means that it will only work in hooks with a 2D rendering context._
-- @function [parent=#render] DrawScreenQuad
-- @param  # 

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the the current material set by **render.SetMaterial** to the area specified.
-- 
-- **Note**: _This is a rendering function that requires a 2D rendering context._
-- _This means that it will only work in hooks with a 2D rendering context._
-- @function [parent=#render] DrawScreenQuadEx
-- @param  #number startX X start position of the rect.
-- @param  #number startY Y start position of the rect.
-- @param  #number width Width of the rect.
-- @param  #number height Height of the rect.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a sphere in 3D space. The material previously set with
-- **render.SetMaterial** will be applied the sphere's surface.
-- 
-- See also **render.DrawWireframeSphere** for a wireframe equivalent.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#render] DrawSphere
-- @param  #Vector position Position of the sphere.
-- @param  #number radius Radius of the sphere. Negative radius will make the sphere render inwards rather than outwards.
-- @param  #number longitudeSteps The number of longitude steps. This controls the quality of the sphere. Higher quality will lower performance significantly. 50 is a good number to start with.
-- @param  #number latitudeSteps The number of latitude steps. This controls the quality of the sphere. Higher quality will lower performance significantly. 50 is a good number to start with.
-- @param  #table color The color of the sphere. See **Color structure**. _(Default: Color(255,255,255))_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a sprite in 3d space.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#render] DrawSprite
-- @param  #Vector position Position of the sprite.
-- @param  #number width Width of the sprite.
-- @param  #number height Height of the sprite.
-- @param  #table color Color of the sprite. See **Color structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a texture over the whole screen.
-- 
-- **Note**: _This is a rendering function that requires a 2D rendering context._
-- _This means that it will only work in hooks with a 2D rendering context._
-- @function [parent=#render] DrawTextureToScreen
-- @param  #ITexture tex The texture to draw.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a textured rectangle.
-- 
-- **Note**: _This is a rendering function that requires a 2D rendering context._
-- _This means that it will only work in hooks with a 2D rendering context._
-- @function [parent=#render] DrawTextureToScreenRect
-- @param  #ITexture tex The texture to draw.
-- @param  #number x The x coordinate of the rectangle to draw.
-- @param  #number y The y coordinate of the rectangle to draw.
-- @param  #number width The width of the rectangle to draw.
-- @param  #number height The height of the rectangle to draw.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a wireframe box in 3D space.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#render] DrawWireframeBox
-- @param  #Vector position Position of the box.
-- @param  #Angle angle Angles of the box.
-- @param  #Vector mins The lowest corner of the box.
-- @param  #Vector maxs The highest corner of the box.
-- @param  #table color The color of the box. Uses the **Color structure**.
-- @param  #boolean writeZ Sets whenever to write to the zBuffer. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a wireframe sphere in 3d space.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#render] DrawWireframeSphere
-- @param  #Vector position Position of the sphere.
-- @param  #number radius The size of the sphere.
-- @param  #number longitudeSteps The number of longitude steps. This controls the quality of the sphere. Higher quality will lower performance significantly. 50 is a good number to start with.
-- @param  #number latitudeSteps The number of latitude steps. This controls the quality of the sphere. Higher quality will lower performance significantly. 50 is a good number to start with.
-- @param  #table color The color of the sphere. See **Color structure**. _(Default: Color(255,255,255))_
-- @param  #boolean writeZ Whether or not to consider the Z buffer. _(Default: false)_  
-- If false, the wireframe will be drawn over everything currently drawn. If true, it will be drawn with depth considered, as if it were a regular object in 3D space.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the status of the clip renderer, returning previous state.
-- 
-- **Warning**: _To prevent unintended rendering behavior of other mods/the game, you must reset the clipping state to its previous value._
-- @function [parent=#render] EnableClipping
-- @param  #boolean state New clipping state.
-- @return #boolean Previous clipping state.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Ends the beam mesh of a beam started with **render.StartBeam**.
-- @function [parent=#render] EndBeam

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the color of the fog.
-- @function [parent=#render] FogColor
-- @param  #number r Red channel of the fog color, 0 - 255.
-- @param  #number g Green channel of the fog color, 0 - 255.
-- @param  #number b Blue channel of the fog color, 0 - 255.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the at which the fog reaches its max density.
-- 
-- **Note**: _If used in **GM:SetupSkyboxFog**, this value must be scaled by the
-- first argument of the hook._
-- @function [parent=#render] FogEnd
-- @param  #number distance The distance at which the fog reaches its max density.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the maximum density of the fog.
-- @function [parent=#render] FogMaxDensity
-- @param  #number maxDensity The maximum density of the fog, 0-1.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the mode of fog.
-- @function [parent=#render] FogMode
-- @param  #number fogMode Fog mode, see **MATERIAL\_FOG\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the distance at which the fog starts showing up.
-- 
-- **Note**: _If used in **GM:SetupSkyboxFog**, this value must be scaled by the
-- first argument of the hook._
-- @function [parent=#render] FogStart
-- @param  #number fogStart The distance at which the fog starts showing up.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the ambient color of the map.
-- @function [parent=#render] GetAmbientLightColor
-- @return #Vector color

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the current alpha blending.
-- @function [parent=#render] GetBlend
-- @return #number Alpha blend in the range 0-255.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the first bloom effect texture.
-- @function [parent=#render] GetBloomTex0
-- @return #ITexture The bloom texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the second bloom effect texture.
-- @function [parent=#render] GetBloomTex1
-- @return #ITexture The bloom texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the current color modulation values as normals.
-- @function [parent=#render] GetColorModulation
-- @return #number r

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the maximum available directX version.
-- @function [parent=#render] GetDXLevel
-- @return #number Maximum DirectX version.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the current fog color.
-- @function [parent=#render] GetFogColor
-- @return #number, #number, #number The Red, Green, and Blue color values.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the fog start and end distance.
-- @function [parent=#render] GetFogDistances
-- @return #number, #number, #number Fog start, end, and Z distances set by **render.FogStart**, **render.FogEnd**, and **render.SetFogZ**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the fog mode.
-- @function [parent=#render] GetFogMode
-- @return #number Fog mode, see **MATERIAL\_FOG\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the \_rt\_FullFrameDepth texture. Alias of \_rt\_PowerOfTwoFB.
-- @function [parent=#render] GetFullScreenDepthTexture
-- @return #ITexture The frame's current depth texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets the light exposure on the specified position.
-- @function [parent=#render] GetLightColor
-- @param  #Vector position The position of the surface to get the light from.
-- @return #Vector The light's color.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the first motion blur texture.
-- @function [parent=#render] GetMoBlurTex0
-- @return #ITexture The first motion blur texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the second motion blur texture.
-- @function [parent=#render] GetMoBlurTex1
-- @return #ITexture The second motion blur texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the first morph texture.
-- @function [parent=#render] GetMorphTex0
-- @return #ITexture The first morph texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the second morph texture.
-- @function [parent=#render] GetMorphTex1
-- @return #ITexture The second morph texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the render target's power of two texture.
-- @function [parent=#render] GetPowerOfTwoTexture
-- @return #ITexture The power of two texture, which is \_rt\_poweroftwofb by default.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Alias of **render.GetPowerOfTwoTexture**.
-- @function [parent=#render] GetRefractTexture
-- @return #ITexture The power of two texture, which is \_rt\_poweroftwofb by default.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the currently active render target.
-- 
-- Instead of saving the current render target using this function and
-- restoring to it later, it is generally better practice to use
-- **render.PushRenderTarget** and **render.PopRenderTarget**.
-- @function [parent=#render] GetRenderTarget
-- @return #ITexture The currently active Render Target.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the \_rt\_ResolvedFullFrameDepth texture for SSAO depth.
-- @function [parent=#render] GetResolvedFullFrameDepth
-- @return #ITexture The \_rt\_ResolvedFullFrameDepth texture

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Obtain an **ITexture** of the screen. You must call
-- **render.UpdateScreenEffectTexture** in order to update this texture with the
-- currently rendered scene.
-- 
-- This texture is mainly used within **GM:RenderScreenspaceEffects**.
-- @function [parent=#render] GetScreenEffectTexture
-- @param  #number textureIndex Max index is 3, but engine only creates the first two for you. _(Default: 0)_
-- @return #ITexture The selected effect texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the first small render texture.
-- @function [parent=#render] GetSmallTex0
-- @return #ITexture The first small render texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the second small render texture.
-- @function [parent=#render] GetSmallTex1
-- @return #ITexture The second small render texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a floating point texture the same resolution as the screen.
-- 
-- **Note**: _The gmodscreenspace shader doesn't behave as expected when
-- drawing a floating-point texture to an integer texture (e.g. the default
-- render target). Use an UnlitGeneric material instead._
-- @function [parent=#render] GetSuperFPTex
-- @return #ITexture Render target named "\_\_rt\_supertexture1".

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a floating point texture the same resolution as the screen.
-- 
-- **Note**: _The gmodscreenspace shader doesn't behave as expected when
-- drawing a floating-point texture to an integer texture (e.g. the default
-- render target). Use an UnlitGeneric material instead._
-- @function [parent=#render] GetSuperFPTex2
-- @return #ITexture Render target named "\_\_rt\_supertexture2".

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Performs a render trace and returns the color of the surface hit, this uses
-- a low res version of the texture.
-- @function [parent=#render] GetSurfaceColor
-- @param  #Vector startPos The start position to trace from.
-- @param  #Vector endPos The end position of the trace.
-- @return #Vector color The trace's resulting color.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a vector representing linear tone mapping scale.
-- @function [parent=#render] GetToneMappingScaleLinear
-- @return #Vector The vector representing linear tone mapping scale.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the render material override for all next calls of **Entity:DrawModel**.
-- Also overrides **render.MaterialOverrideByIndex**.
-- @function [parent=#render] MaterialOverride
-- @param  #IMaterial material The material to use as override, use nil to disable.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Similar to **render.MaterialOverride**, but overrides the materials per index.
-- **render.MaterialOverride** overrides effects of this function.
-- @function [parent=#render] MaterialOverrideByIndex
-- @param  #number index Starts with 0, the index of the material to override.
-- @param  #IMaterial material The material to override with.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the maximum texture height the renderer can handle.
-- @function [parent=#render] MaxTextureHeight
-- @return #number The maximum texture height.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the maximum texture width the renderer can handle.
-- @function [parent=#render] MaxTextureWidth
-- @return #number The maximum texture width.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a new ClientsideModel, renders it at the specified pos/ang, and
-- removes it. Can also be given an existing **CSEnt** to reuse instead.
-- 
-- **Note**: _This function is only meant to be used in a single render pass
-- kind of scenario, if you need to render a model continuously, use a cached
-- ClientsideModel and provide it as a second argument._
-- @function [parent=#render] Model
-- @param  #table settings Requires:
-- 
-- * _#string model_ : Path to the model to draw.
-- * _#Vector pos_ : The position to draw the model at.
-- * _#Angle angle_ : The angles to draw the model at.
-- @param  #CSEnt ent If provided, this entity will be reused instead of creating a new one with **ClientsideModel**. _(Default: nil)_  
-- Note that the ent's model, position and angles will be changed, and **Entity:SetNoDraw** will be set to true.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets a material to override a model's default material. Similar to
-- **Entity:SetMaterial** except it uses an **IMaterial** argument and it can be used
-- to change materials on models which are part of the world geometry.
-- @function [parent=#render] ModelMaterialOverride
-- @param  #IMaterial material The material override.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Overrides the write behaviour of all next rendering operations towards the
-- alpha channel of the current render target. See also **render.OverrideBlend**.
-- 
-- **Note**: _Doing surface library draw calls with alpha set to 0 is a no-op
-- and will never have any effect._
-- @function [parent=#render] OverrideAlphaWriteEnable
-- @param  #boolean enable Enable or disable the override.
-- @param  #boolean shouldWrite If the previous argument is true, sets whether the next rendering operations should write to the alpha channel or not. Has no effect if the previous argument is false.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Overrides the internal graphical functions used to determine the final color
-- and alpha of a rendered texture. See also **render.OverrideAlphaWriteEnable**.
-- 
-- **Note**: _Doing surface library draw calls with alpha set to 0 is a no-op and won't have an effect._
-- @function [parent=#render] OverrideBlend
-- @param  #boolean enabled true to enable, false to disable. No other arguments are required when disabling.
-- @param  #number srcBlend The source color blend function **BLEND\_ Enums**. Determines how a rendered texture's final color should be calculated.
-- @param  #number destBlend The destination color blend function **BLEND\_ Enums**.
-- @param  #number blendFunc The blend mode used for drawing the color layer **BLENDFUNC\_ Enums**.
-- @param  #number srcBlendAlpha The source alpha blend function **BLEND\_ Enums**. Determines how a rendered texture's final alpha should be calculated. _(Default: none)_
-- @param  #number destBlendAlpha The destination alpha blend function **BLEND\_ Enums**. _(Default: none)_
-- @param  #number blendFuncAlpha The blend mode used for drawing the alpha layer **BLENDFUNC\_ Enums**. _(Default: none)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Overrides the write behavior of all next rendering operations towards the
-- color channel of the current render target.
-- @function [parent=#render] OverrideColorWriteEnable
-- @param  #boolean enable Enable or disable the override.
-- @param  #boolean shouldWrite If the previous argument is true, sets whether the next rendering operations should write to the color channel or not. Has no effect if the previous argument is false.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Overrides the write behaviour of all next rendering operations towards the depth buffer.
-- @function [parent=#render] OverrideDepthEnable
-- @param  #boolean enable Enable or disable the override.
-- @param  #boolean shouldWrite If the previous argument is true, sets whether the next rendering operations should write to the depth buffer or not. Has no effect if the previous argument is false.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- @function [parent=#render] PerformFullScreenStencilOperation

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Removes the current active clipping plane from the clip plane stack.
-- @function [parent=#render] PopCustomClipPlane

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pops the current texture magnification filter from the filter stack.
-- See **render.PushFilterMag**.
-- @function [parent=#render] PopFilterMag

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pops the current texture minification filter from the filter stack.
-- See **render.PushFilterMin**.
-- @function [parent=#render] PopFilterMin

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pops the current flashlight mode from the flashlight mode stack.
-- @function [parent=#render] PopFlashlightMode

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pops the last render target and viewport from the RT stack and sets them as
-- the current render target and viewport.
-- 
-- This is should be called to restore the previous render target and viewport
-- after a call to **render.PushRenderTarget**.
-- @function [parent=#render] PopRenderTarget

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pushes a new clipping plane of the clip plane stack and sets it as active.
-- 
-- **Note**: _A max of 2 clip planes are supported on Linux/POSIX, and 6 on Windows._
-- @function [parent=#render] PushCustomClipPlane
-- @param  #Vector normal The normal of the clipping plane.
-- @param  #number The distance of the plane from the world origin. You can use **Vector:Dot** between the normal and any point on the plane to find this.0

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pushes a texture filter onto the magnification texture filter stack.
-- @function [parent=#render] PushFilterMag
-- @param  #number texFilterType The texture filter type, see **TEXFILTER\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pushes a texture filter onto the minification texture filter stack.
-- @function [parent=#render] PushFilterMin
-- @param  #number texFilterType The texture filter type, see **TEXFILTER\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables the flashlight projection for the upcoming rendering.
-- @function [parent=#render] PushFlashlightMode
-- @param  #boolean enable Whether the flashlight mode should be enabled or disabled. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pushes the current render target and viewport to the RT stack then sets a
-- new current render target and viewport. If the viewport is not specified,
-- the dimensions of the render target are used instead.
-- 
-- This is similar to a call to **render.SetRenderTarget** and **render.SetViewPort**
-- where the current render target and viewport have been saved beforehand,
-- except the viewport isn't clipped to screen bounds.
-- 
-- See also **render.PopRenderTarget**.
-- 
-- **Note**: _If you want to render to the render target in 2d mode and it is
-- not the same size as the screen, use **cam.Start2D** and **cam.End2D**._
-- 
-- **Note**: _If the render target is bigger than the screen, rendering done
-- with the surface library will be clipped to the screen bounds unless you
-- call **surface.DisableClipping**._
-- @function [parent=#render] PushRenderTarget
-- @param  #ITexture texture The new render target to be used.
-- @param  #number x X origin of the viewport. _(Default: 0)_
-- @param  #number y Y origin of the viewport. _(Default: 0)_
-- @param  #number w Width of the viewport. _(Default: **texture:Width**())_
-- @param  #number h Height of the viewport. _(Default: **texture:Height**())_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads the color of the specified pixel from the RenderTarget sent by
-- **render.CapturePixels**.
-- @function [parent=#render] ReadPixel
-- @param  #number x The x coordinate to read from.
-- @param  #number y The y coordinate to read from.
-- @return #number, #number, #number The red, green, and blue color components.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- This applies the changes made to map lighting using **engine.LightStyle**.
-- @function [parent=#render] RedownloadAllLightmaps
-- @param  #boolean DoStaticProps When true, this will also apply lighting changes to static props. _(Default: false)_  
-- This is really slow on large maps.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Renders the HUD on the screen.
-- @function [parent=#render] RenderHUD
-- @param  #number x X position for the HUD draw origin.
-- @param  #number y Y position for the HUD draw origin.
-- @param  #number w Width of the HUD draw.
-- @param  #number h Height of the HUD draw.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Renders the scene with the specified viewData to the current active render target.
-- @function [parent=#render] RenderView
-- @param  #table view The view data to be used in the rendering. _(Default: nil)_  
-- See **ViewData structure**. Any missing value is assumed to be that of the current view. Similarly, you can make a normal render by simply not passing this table at all.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resets the model lighting to the specified color.
-- 
-- Calls **render.SetModelLighting** for every direction with given color.
-- @function [parent=#render] ResetModelLighting
-- @param  #number r The red part of the color, 0-1.
-- @param  #number g The green part of the color, 0-1.
-- @param  #number b The blue part of the color, 0-1.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resets the HDR tone multiplier to the specified value. This will only work
-- on HDR maps, and the value will automatically fade to what it was (or
-- whatever **render.SetGoalToneMappingScale** is) if called only once.
-- @function [parent=#render] ResetToneMappingScale
-- @param  #number scale The value which should be used as multiplier.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the ambient lighting for any upcoming render operation.
-- @function [parent=#render] SetAmbientLight
-- @param  #number r The red part of the color, 0-1.
-- @param  #number g The green part of the color, 0-1.
-- @param  #number b The blue part of the color, 0-1.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the alpha blending for every upcoming render operation.
-- @function [parent=#render] SetBlend
-- @param  #number blending Blending value from 0-1.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the current drawing material to "color".
-- @function [parent=#render] SetColorMaterial

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the current drawing material to "color_ignorez".
-- @function [parent=#render] SetColorMaterialIgnoreZ

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the color modulation.
-- @function [parent=#render] SetColorModulation
-- @param  #number r The red channel multiplier normal ranging from 0-1.
-- @param  #number g The green channel multiplier normal ranging from 0-1.
-- @param  #number b The blue channel multiplier normal ranging from 0-1.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- If the fog mode is set to **MATERIAL\_FOG\_LINEAR\_BELOW\_FOG\_Z**, the fog will only
-- be rendered below the specified height.
-- @function [parent=#render] SetFogZ
-- @param  #number fogZ The fog Z distance.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the goal HDR tone mapping scale. Use this in a rendering/think hook as
-- it is reset every frame.
-- @function [parent=#render] SetGoalToneMappingScale
-- @param  #number scale The target scale.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets lighting mode when rendering something.
-- 
-- **Note**: _**Do not forget to restore the default value** to avoid unexpected
-- behavior, like the world and the HUD/UI being affected._
-- @function [parent=#render] SetLightingMode
-- @param  #number Mode Lighting render mode.
-- Possible values are:
-- 
-- * 0 - Default.
-- * 1 - Total fullbright, similar to mat_fullbright 1 but excluding some weapon view models.
-- * 2 - Increased brightness(?), models look fullbright.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the lighting origin.
-- @function [parent=#render] SetLightingOrigin
-- @param  #Vector lightingOrigin The position from which the light should be "emitted".

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the texture to be used as the lightmap in upcoming rendering operations.
-- This is required when rendering meshes using a material with a lightmapped
-- shader such as LightmappedGeneric.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- 
-- **Note**: _This is a rendering function that requires a 2D rendering context._
-- _This means that it will only work in hooks with a 2D rendering context._
-- @function [parent=#render] SetLightmapTexture
-- @param  #ITexture tex The texture to be used as the lightmap.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets up the local lighting for any upcoming render operation. Up to 4 local
-- lights can be defined, with one of three different types (point,
-- directional, spot).
-- 
-- Disables all local lights if called with no arguments.
-- @function [parent=#render] SetLocalModelLights
-- @param  #table lights A table containing up to 4 tables for each light source that should be set up. _(Default: {})_  
-- Each of these tables should contain the properties of its associated light source, see **LocalLight structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the material to be used in any upcoming render operation using the
-- render library. Not to be confused with **surface.SetMaterial**.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- 
-- **Note**: _This is a rendering function that requires a 2D rendering context._
-- _This means that it will only work in hooks with a 2D rendering context._
-- @function [parent=#render] SetMaterial
-- @param  #IMaterial mat The material to be used.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets up the ambient lighting for any upcoming render operation. Ambient
-- lighting can be seen as a cube enclosing the object to be drawn, each of its
-- faces representing a directional light source that shines towards the object.
-- Thus, there is a total of six different light sources that can be configured
-- separately.
-- 
-- Light color components are not restricted to a specific range (ex: 0-255), instead, higher values will result in a brighter light.
-- @function [parent=#render] SetModelLighting
-- @param  #number lightDirection The light source to edit, see **BOX\_ Enums**.
-- @param  #number red The red component of the light color.
-- @param  #number green The green component of the light color.
-- @param  #number blue The blue component of the light color.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the render target to the specified rt.
-- @function [parent=#render] SetRenderTarget
-- @param  #ITexture texture The new render target to be used.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the render target with the specified index to the specified rt.
-- @function [parent=#render] SetRenderTargetEx
-- @param  #number rtIndex The index of the rt to set.
-- @param  #ITexture texture The new render target to be used.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets a scissoring rect which limits the drawing area.
-- @function [parent=#render] SetScissorRect
-- @param  #number startX X start coordinate of the scissor rect.
-- @param  #number startY Y start coordinate of the scissor rect.
-- @param  #number endX X end coordinate of the scissor rect.
-- @param  #number endY Y end coordinate of the scissor rect.
-- @param  #boolean enable Enable or disable the scissor rect.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the shadow color.
-- @function [parent=#render] SetShadowColor
-- @param  #number red The red channel of the shadow color.
-- @param  #number green The green channel of the shadow color.
-- @param  #number blue The blue channel of the shadow color.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the shadow projection direction.
-- @function [parent=#render] SetShadowDirection
-- @param  #Vector shadowDirections The new shadow direction.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the maximum shadow projection range.
-- @function [parent=#render] SetShadowDistance
-- @param  #number shadowDistance The new maximum shadow distance.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whether any future render operations will ignore shadow drawing.
-- @function [parent=#render] SetShadowsDisabled
-- @param  #boolean newState Enable or disabled shadows.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the compare function of the stencil. Pixels which fail the stencil
-- comparison function are not written to the render target. The operation to
-- be performed on the stencil buffer values for these pixels can be set using
-- **render.SetStencilFailOperation**.
-- 
-- Pixels which pass the stencil comparison function are written to the render
-- target unless they fail the depth buffer test (where applicable). The
-- operation to perform on the stencil buffer values for these pixels can be
-- set using **render.SetStencilPassOperation** and **render.SetStencilZFailOperation**.
-- @function [parent=#render] SetStencilCompareFunction
-- @param  #number compareFunction Compare function, see **STENCILCOMPARISONFUNCTION\_ Enums**, and **STENCIL\_ Enums** for short.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whether stencil tests are carried out for each rendered pixel.  
-- Only pixels passing the stencil test are written to the render target.
-- 
-- @function [parent=#render] SetStencilEnable
-- @param  #boolean newState The new state.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the operation to be performed on the stencil buffer values if the
-- compare function was not successful. Note that this takes place before depth testing.
-- @function [parent=#render] SetStencilFailOperation
-- @param  #number failOperation Fail operation function, see **STENCILOPERATION\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the operation to be performed on the stencil buffer values if the
-- compare function was successful.
-- @function [parent=#render] SetStencilPassOperation
-- @param  #number passOperation Pass operation function, see **STENCILOPERATION\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the reference value which will be used for all stencil operations. This
-- is an unsigned integer.
-- @function [parent=#render] SetStencilReferenceValue
-- @param  #number referenceValue Reference value.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the unsigned 8-bit test bitflag mask to be used for any stencil testing.
-- @function [parent=#render] SetStencilTestMask
-- @param  #number mask The mask bitflag.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the unsigned 8-bit write bitflag mask to be used for any writes to the
-- stencil buffer.
-- @function [parent=#render] SetStencilWriteMask
-- @param  #number mask The mask bitflag.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the operation to be performed on the stencil buffer values if the
-- stencil test is passed but the depth buffer test fails.
-- @function [parent=#render] SetStencilZFailOperation
-- @param  #number zFailOperation Z fail operation function, see **STENCILOPERATION\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- @function [parent=#render] SetToneMappingScaleLinear
-- @param  #Vector vec

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Changes the view port position and size.
-- 
-- **Note**: _This function will override values of **ScrW** and **ScrH** with the ones
-- you set._
-- @function [parent=#render] SetViewPort
-- @param  #number x X origin of the view port.
-- @param  #number y Y origin of the view port.
-- @param  #number w Width of the view port.
-- @param  #number h Height of the view port.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- @function [parent=#render] SetWriteDepthToDestAlpha
-- @param  #boolean enable

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Swaps the frame buffers/cycles the frame. In other words, this updates the
-- screen. If you take a really long time during a single frame render, it is a
-- good idea to use this and let the user know that the game isn't stuck.
-- @function [parent=#render] Spin

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Start a new beam draw operation.
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context._
-- _This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#render] StartBeam
-- @param  #number segmentCount Amount of beam segments that are about to be drawn.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether the game supports HDR, ex: if the DirectX level is higher
-- than or equal to 8.
-- @function [parent=#render] SupportsHDR
-- @return #boolean Whether HDR is supported.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the current settings and the system allow the usage of pixel
-- shaders 1.4.
-- @function [parent=#render] SupportsPixelShaders_1_4
-- @return #boolean Whether Pixel Shaders 1.4 are supported or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the current settings and the system allow the usage of pixel
-- shaders 2.0.
-- @function [parent=#render] SupportsPixelShaders_2_0
-- @return #boolean Whether Pixel Shaders 2.0 are supported or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the current settings and the system allow the usage of vertex
-- shaders 2.0.
-- @function [parent=#render] SupportsVertexShaders_2_0
-- @return #boolean Whether Vertex Shaders 2.0 are supported or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Suppresses or enables any engine lighting for any upcoming render operation.
-- @function [parent=#render] SuppressEngineLighting
-- @param  #boolean suppressLighting True to suppress false to enable.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables HDR tone mapping which influences the brightness.
-- @function [parent=#render] TurnOnToneMapping

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Updates the texture returned by **render.GetFullScreenDepthTexture**.  
-- Silently fails if **render.SupportsPixelShaders_2_0** returns false.
-- @function [parent=#render] UpdateFullScreenDepthTexture

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Updates the power of two texture.
-- @function [parent=#render] UpdatePowerOfTwoTexture
-- @return ITexture Returns **render.GetPowerOfTwoTexture**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pretty much alias of **render.UpdatePowerOfTwoTexture** but does not return the texture.
-- @function [parent=#render] UpdateRefractTexture

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Copies the entire screen to the screen effect texture, which can be acquired
-- via **render.GetScreenEffectTexture**. This function is mainly intended to be
-- used in **GM:RenderScreenspaceEffects**.
-- @function [parent=#render] UpdateScreenEffectTexture

return nil
