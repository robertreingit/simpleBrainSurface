function handle_object = arrange_layout(specs)
%arange_layout
% proof-of-concept
%
% INPUT:
% OUTPUT:
% SIDEEFFECTS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

switch (specs.pos.brain)
    case 'left'
        handle_object.h_brain = subplot(121);
        handle_object.h_brain_patch = simpleBrainSurface();
end


switch (specs.pos.nirs)
    case 'right'
        no_signals = numel(specs.nirs);
        h = zeros(1,no_signals);
        for s = 1:no_signals        
            h(s) = subplot(no_signals,2,(s-1)*2+2);
            draw_signal(specs.nirs(s),h(s));
            set(gcf,'currentaxes',handle_object.h_brain);
            add_marker(specs.nirs(s).mni);            
        end
        handle_object.h_nirs = h;
        
end

drawnow

% add annotations
handle_object.h_anno = zeros(1,no_signals);
for s = 1:no_signals
    if ( specs.nirs(s).add_annotation )
       anno_start = local_axes_to_normalized_figure(...
           handle_object.h_brain,specs.nirs(s).mni);
       anno_end = get_axis_anchor(handle_object.h_nirs(s),'left');
       handle_object.h_anno(s) = annotation('arrow',[anno_start(1) anno_end(1)],...
           [anno_start(2) anno_end(2)],'color','white',...
           'linewidth',1.5);
    end
end
