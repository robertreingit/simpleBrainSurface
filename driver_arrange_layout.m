function driver_arrange_layout()
% just a driver to play with arrange_layout
% INPUT:
% None.
% OUTPUT:
% None.
% SIDEEFFECTS:
% Layout is produced.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

specs.pos.brain = 'left';
specs.pos.nirs = 'right';

t = 0:0.05:pi;
specs.nirs(1).mni = [-26 65 19];
specs.nirs(1).t    = t;
specs.nirs(1).oxy  = sin(t);
specs.nirs(1).deoxy = -0.1*sin(t);
specs.nirs(1).add_annotation = true;

specs.nirs(2).mni = [-12 70 20];
specs.nirs(2).t    = t;
specs.nirs(2).oxy  = sin(t);
specs.nirs(2).deoxy = -0.1*sin(t);
specs.nirs(2).add_annotation = true;
arrange_layout(specs);