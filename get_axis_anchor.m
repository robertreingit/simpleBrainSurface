function coord = get_axis_anchor(h_axe,location)
%get_axis_anchor(position)
% Returns the position of an axis in normalized
% figure coordinates.
% Possible locations:
% 
%           top
%       --------------
%       |            |
% left  |    axe     |  right
%       |            |
%       --------------
%          bottom
% 
% INPUT:
% h_axes = handle to axe objct
% location = position identified (see figure above)
% OUTPUT:
% coor = anchor coordinates in normalized units.
% SIDEEFFECTS:
% None.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pos = get(h_axe,'outerposition');
switch ( location )
    case 'left'
        x = pos(1);
        y = pos(2) + 0.5*pos(4);
    case 'right'
        x = pos(1) + pos(3);
        y = pos(2) + 0.5*pos(4);
    case 'top'
        x = pos(1) + 0.5*pos(3);
        y = pos(2) + pos(4);
    case 'bottom'
        x = pos(1) + 0.5*pos(3);
        y = pos(2);
    otherwise
        error('Not recognized position');
end
coord = [x,y];