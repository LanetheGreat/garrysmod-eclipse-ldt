-------------------------------------------------------------------------------
-- The mesh library allows you to create meshes. A mesh is a set of vertices
-- that define a 3D shape, for constant meshes you should use the **IMesh** object
-- instead.
-- @module mesh

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pushes the new vertex data onto the render stack.
-- @function [parent=#mesh] AdvanceVertex

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Starts a new dynamic mesh. If an **IMesh** is passed, it will use that mesh instead.
-- @function [parent=#mesh] Begin
-- @param  #IMesh mesh Mesh to build. This argument can be removed if you wish to build a "dynamic" mesh. _(Default: nil)_
-- @param  #number primitiveType Primitive type, see **MATERIAL\_Enums**.
-- @param  #number primitiveCount The amount of primitives.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the color to be used for the next vertex.
-- @function [parent=#mesh] Color
-- @param  #number r Red component.
-- @param  #number g Green component.
-- @param  #number b Blue component.
-- @param  #number a Alpha component.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Ends the mesh and renders it.
-- @function [parent=#mesh] End

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the normal to be used for the next vertex.
-- @function [parent=#mesh] Normal
-- @param  #Vector normal The normal of the vertex.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the position to be used for the next vertex.
-- @function [parent=#mesh] Position
-- @param  #Vector position  The position of the vertex.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a quad using 4 vertices.
-- @function [parent=#mesh] Quad
-- @param  #Vector vector1 The first vertex.
-- @param  #Vector vector2 The second vertex.
-- @param  #Vector vector3 The third vertex.
-- @param  #Vector vector4 The fourth vertex.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a quad using a position, a normal and the size.
-- @function [parent=#mesh] QuadEasy
-- @param  #Vector position The center of the quad.
-- @param  #Vector normal The normal of the quad.
-- @param  #number sizeX X size in pixels.
-- @param  #number sizeY Y size in pixels.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the specular map values. This function actually does nothing.
-- @function [parent=#mesh] Specular
-- @param  #number r The red channel multiplier of the specular map.
-- @param  #number g The green channel multiplier of the specular map.
-- @param  #number b The blue channel multiplier of the specular map.
-- @param  #number a The alpha channel multiplier of the specular map.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the s tangent to be used. This function actually does nothing.
-- @function [parent=#mesh] TangentS
-- @param  #Vector sTanger The s tangent.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the t tangent to be used. This function actually does nothing.
-- @function [parent=#mesh] TangentT
-- @param  #Vector tTanger The t tangent.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the texture coordinates for the next vertex.
-- 
-- Non-zero values of stage require the currently bound material to support it.
-- For example, any LightmappedGeneric material supports stages 1 and 2
-- (lightmap texture coordinates).
-- @function [parent=#mesh] TexCoord
-- @param  #number stage The stage of the texture coordinate.
-- @param  #number u U coordinate.
-- @param  #number v V coordinate.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **Note**: _It is recommended to use **IMesh:BuildFromTriangles** instead of
-- the mesh library._
-- 
-- A table of four numbers. This is used by most shaders in Source to hold
-- tangent information of the vertex. (tangentX, tangentY, tangentZ, tangentHandedness)
-- @function [parent=#mesh] UserData
-- @param  #number tangentX
-- @param  #number tangentY
-- @param  #number tangentZ
-- @param  #number tangentHandedness

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the amount of vertex that have yet been pushed.
-- @function [parent=#mesh] VertexCount
-- @return #number The number of vertices pushed so far.

return nil
