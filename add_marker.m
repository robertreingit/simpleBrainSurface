function h = add_marker( mni, color, marker_size )
%ADD_MARKER Summary of this function goes here
%   Detailed explanation goes here
% INPUT:
% mni       = vector (1x3) or matrix (nx3) of mni coordinate sets
% color     = marker color
% marker_size = radius of markers in mni units
% OUTPUT:
% h = handles to marker patches
% SIDEEFFECTS:
% Markers are added to the current plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if (nargin < 3)        
        marker_size = 3;
    end
    if (nargin < 2)
        color = [0.9 0.1 0.1];
    end
    
    if isvector(mni)
        if iscolumn(mni)
            mni = mni';
        end
    end
    assert(size(mni,2)==3,'Coordinates must be 3D vectors');
    
    
    no_marker = size(mni,1);
    h = zeros(no_marker,1);
    
    for m = 1:no_marker
        marker = generate_sphere(mni(m,:),marker_size);
        h(m) = patch('vertices',marker.vertices,...
                  'faces',marker.faces,...
                  'facecolor',color,...
                  'facealpha',0.6,...
                  'edgecolor','none',...
                  'facelighting','gouraud');
    end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate_sphere(pos)
%generate_sphere Generates sphere vertex and face data.
% Generates the vertex and face data for a sphere.
% Basically, a wrapper for MATALB sphere function.
% INPUT:
% pos = center of sphere 3D
% radius = radius of sphere in mni coordinates
% OUTPUT:
% fvc = face-vertex struct see surf2patch for more information.
% SIDEEFFECTS:
% None.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fvc = generate_sphere(pos,radius)

    [x,y,z] = sphere(40);
    x = radius*x + pos(1);
    y = radius*y + pos(2);
    z = radius*z + pos(3);
    fvc = surf2patch(x,y,z);

end
