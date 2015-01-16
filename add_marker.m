function h = add_marker( mni, color )
%ADD_MARKER Summary of this function goes here
%   Detailed explanation goes here
% INPUT:
% mni = vector (1x3) or matrix (nx3) of mni coordinate sets
% color = marker color
% OUTPUT:
% h = handles to marker patches
% SIDEEFFECTS:
% Markers are added to the current plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if (nargin == 1)
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
        marker = generate_sphere(mni(m,:));
        h(m) = patch('vertices',marker.vertices,...
                  'faces',marker.faces,...
                  'facecolor',color,...
                  'facealpha',0.6,...
                  'edgecolor','none',...
                  'facelighting','gouraud');
    end

end

function fvc = generate_sphere(pos)

    expand = 3;
    [x,y,z] = sphere(40);
    x = expand*x + pos(1);
    y = expand*y + pos(2);
    z = expand*z + pos(3);
    fvc = surf2patch(x,y,z);

end



