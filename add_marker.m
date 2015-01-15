function h = add_marker( mni )
%ADD_MARKER Summary of this function goes here
%   Detailed explanation goes here
% INPUT:
% OUTPUT:
% SIDEEFFECTS:
% Markers are added to the current plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
                  'facecolor',[0.9 0 0],...
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



