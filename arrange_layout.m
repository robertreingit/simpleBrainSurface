function handle_object = arrange_layout(specs)
%arange_layout
% proof-of-concept
%
% INPUT:
% OUTPUT:
% SIDEEFFECTS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    handle_object = [];
    switch (specs.pos.brain)
        case 'left'
            handle_object = plot_brain(handle_object,121);
        case 'right'
            handle_object = plot_brain(handle_object,122);
            
    end

    no_signals = numel(specs.nirs);
    switch (specs.pos.nirs)
        case 'right'
            handle_object = plot_signals(handle_object,[no_signals,2,-13],specs.nirs);
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

end

function handle_object = plot_brain(handle_object,plot_pos)
    handle_object.h_brain = subplot(plot_pos);
    handle_object.h_brain_patch = simpleBrainSurface();
end

function handle_object = plot_signals(handle_object,plot_pos,nirs)
    no_signals = numel(nirs);
    h = zeros(1,no_signals);
    for s = 1:no_signals        
        h(s) = subplot(no_signals,2,(s-1)*2+2);
        draw_signal(nirs(s),h(s));
        set(gcf,'currentaxes',handle_object.h_brain);
        add_marker(nirs(s).mni);            
    end
    handle_object.h_nirs = h;
end

