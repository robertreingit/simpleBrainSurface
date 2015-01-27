function h_nirs = draw_signal(specs,h)
%draw_signal
%
% INPUT:
% specs = specs struct
% h = handle to axes object
% OUTPUT:
% h_nirs = handle to nirs data
% SIDEEFFECTS:
% Signal plot is added to axis h.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(gcf,'currentaxes',h)
h_nirs = zeros(1,2);
y_min = min(min(specs.oxy),min(specs.deoxy));
y_max = max(max(specs.oxy),max(specs.deoxy));
d_y = y_max - y_min;
y_limits_factor = 0.1;
h_nirs(1) = plot(specs.t,specs.oxy,'r');
set(h,'nextplot','add');
h_nirs(2) = plot(specs.t,specs.deoxy,'b');
set(h,'nextplot','replace',...
    'color','black',...
    'linewidth',1,...
    'xcolor','white',...
    'ycolor','white',...
    'xlim',specs.t([1,end]),...
    'ylim',[y_min-y_limits_factor*d_y,y_max+y_limits_factor*d_y]);
set(h_nirs,'linewidth',2);
xlabel('Time','color','white')
ylabel('Response','color','white');
