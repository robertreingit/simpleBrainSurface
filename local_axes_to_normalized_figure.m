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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% generating scribeping object with coordinates of desired point
scribepin = scribe.scribepin('parent',h_axe,'DataAxes',h_axe,'DataPosition',point);
% map to pixels in figure coordinates
figPixelPos = scribepin.topixels;
% get handle to parent figure
hFig = ancestor(h_axe,'figure');
% get position of parent figure in pixels
figPos = getpixelposition(hFig);
% subtract position of point (in pixelx) from 
% width of figure (in pixels).
figPixelPos(2) = figPos(4) - figPixelPos(2);
% map pixels to normalized units
% hgconvertunits expects a rectangle therefore using dummy
% width and height = 10.
n_point = hgconvertunits(hFig,[figPixelPos,10,10],'pixels','norm',hFig);
% throw away dummy width and height
n_point = n_point(1:2);
