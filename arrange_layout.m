function arrange_layout(specs)
%arange_layout
% proof-of-concept
%
% INPUT:
% OUTPUT:
% SIDEEFFECTS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

switch (specs.brain.pos)
    case 'left'
        h_brain = subplot(121);
        h_brain_patch = simpleBrainSurface();
end

switch (specs.nirs.pos)
    case 'right'
        specs.nirs.h = subplot(122);
        draw_signal(specs.nirs);
        set(gcf,'currentaxes',h_brain);
        add_marker(specs.nirs.mni);
end
