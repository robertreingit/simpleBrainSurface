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
        subplot(122);
        h_nirs = zeros(1,2);
        h_nirs(1) = plot(specs.nirs.t,specs.nirs.oxy,'r');
        set(gca,'nextplot','add');
        h_nirs(2) = plot(specs.nirs.t,specs.nirs.deoxy,'b');
        set(gca,'nextplot','replace');
        legend('oxy','deoxy');
        set(gcf,'currentaxes',h_brain);
        add_marker(specs.nirs.mni);
end
