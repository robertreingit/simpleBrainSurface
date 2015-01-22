%% Example usage
% generate figure
h_brain = simpleBrainSurface();

% add MNI-Marker
mni = [-26 65 19;-12 70 20];
h_marker = add_marker(mni);
