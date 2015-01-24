function h_nirs = draw_signal(specs,h)
%draw_signal
%
% INPUT:
% specs
% h
% OUTPUT:
% h_nirs = handle to nirs data
% SIDEEFFECTS:
% Signal plot is added to axis h.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(gcf,'currentaxes',h)
h_nirs = zeros(1,2);
h_nirs(1) = plot(specs.t,specs.oxy,'r');
set(h,'nextplot','add');
h_nirs(2) = plot(specs.t,specs.deoxy,'b');
set(h,'nextplot','replace',...
    'color','black',...
    'linewidth',1,...
    'xcolor','white',...
    'ycolor','white',...
    'xlim',specs.t([1,end]));
set(h_nirs,'linewidth',2);
xlabel('Time','color','white')
ylabel('Response','color','white');
