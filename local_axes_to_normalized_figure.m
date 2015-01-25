function n_point = local_axes_to_normalized_figure(h_axe,point)
%local_axes_to_normalized_figure
%
% Calculates the normalized coordinates of a data value in an axe,
% which is unfortunately necessary to calculate positions for annotations.
% The routine is follows mainly the steps described in:
% http://undocumentedmatlab.com/blog/pinning-annotations-to-graphs
%
% INPUT:
% h_axe = handle to axis
% point = point in axis data units
% OUTPUT:
% n_point = point in normalized figure units
% SIDEEFFECTS:
% None.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55

scribepin = scribe.scribepin('parent',h_axe,'DataAxes',h_axe,'DataPosition',point);
figPixelPos = scribepin.topixels;
hFig = ancestor(h_axe,'figure');
n_point = hgconvertunits(hFig,[figPixelPos,1,1],'pixels','norm',hFig);
