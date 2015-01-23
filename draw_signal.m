function h_nirs = draw_signal(specs)

set(gcf,'currentaxes',specs.h)
h_nirs = zeros(1,2);
h_nirs(1) = plot(specs.t,specs.oxy,'r');
set(specs.h,'nextplot','add');
h_nirs(2) = plot(specs.t,specs.deoxy,'b');
set(specs.h,'nextplot','replace','color','black',...
    'linewidth',1,...
    'xcolor','white','ycolor','white');
legend('oxy','deoxy');
set(h_nirs,'linewidth',2);
xlabel('Time','color','white')
ylabel('Response','color','white');
