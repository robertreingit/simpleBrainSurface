function h = simpleBrainSurface(range)
% simpleBrainSurface
% Simple function to render a brain in 3D in MNI coordinates.
% Addapted from surfPlot of the MRtools collection from:
% http://mrtools.mgh.harvard.edu/index.php/Main_Page
%
% Initial surface data comes from FreeSurfer template which apparently comes from:
% Fischl, B., Sereno, M. I., Tootell, R. B.H. and Dale, A. M. (1999),
% High-resolution intersubject averaging and a coordinate system for the 
% cortical surface. Hum. Brain Mapp., 8: 272–284.
% doi: 10.1002/(SICI)1097-0193(1999)8:4<272::AID-HBM10>3.0.CO;2-4
%
% INPUT:
% range = 2D vector graycolor range [darkest brightest] 
%           { default [0.1 0.7] }
% OUTPUT:
% h = handle to the surface patch.
% SIDEEFFECTS:
% A brain surface plot is generated.
%
%
% Original:
%%% Written by Aaron P. Schultz - aschultz@martinos.org
%%%
%%% Copyright (C) 2014,  Aaron P. Schultz
%%%
%%% Supported in part by the NIH funded Harvard Aging Brain Study (P01AG036694) and NIH R01-AG027435 
%%%
%%% This program is free software: you can redistribute it and/or modify
%%% it under the terms of the GNU General Public License as published by
%%% the Free Software Foundation, either version 3 of the License, or
%%% any later version.
%%% 
%%% This program is distributed in the hope that it will be useful,
%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%% GNU General Public License for more details.
%%%
% Copyright (C) 2015, Robert Rein
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin == 0
    range = [0.1 0.7];
end

% get vertex data
load('simple_brain_surface.mat');

% figure background color
set(gcf,'renderer','opengl','Color','k');

tmp_shading_color = brain.shading_pre * diff(range);
tmp_shading_color = tmp_shading_color - min(tmp_shading_color) + range(1);
shading_color = repmat(tmp_shading_color,1,3);

h = patch('vertices',brain.vertices, ...
    'faces', brain.faces, ...
    'FaceVertexCdata',shading_color);

set(h,'edgecolor','none','facecolor','interp');
set(gca,'dataaspectratio',ones(1,3),'visible','off');
axis tight;
view(159,6);
