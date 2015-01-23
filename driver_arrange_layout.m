function driver_arrange_layout()
% just a driver to play with arrange_layout
% INPUT:
% None.
% OUTPUT:
% None.
% SIDEEFFECTS:
% Layout is produced.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

specs.brain.pos = 'left';

t = 0:0.05:pi;
specs.nirs.pos  = 'right';
specs.nirs.mni = [-26 65 19];
specs.nirs.t    = t;
specs.nirs.oxy  = sin(t);
specs.nirs.deoxy = -0.1*sin(t);

arrange_layout(specs);