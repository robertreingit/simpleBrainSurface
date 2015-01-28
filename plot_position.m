function pos_fcn = plot_position(n_row,n_col,along_row,along_col)
%plot_position
% Returns a function which specifies the position of a plot in an subplot
% array.
%
% INPUT:
% OUTPUT:
% SIDEEFFECTS:
% None.
% The layout matrix is held in memory due to clojure. Shouldn't be a
% problem as the matrix should be fairly small.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
    layout = reshape(1:(n_row*n_col),n_col,n_row)';
    if (along_row == 0)
        pos_fcn = @(i) 100*n_row + 10*ncol + layout(i,along_col);
    elseif (along_col == 0)
        pos_fcn = @(i) 100*n_row + 10*n_col + layout(along_row,i);
    else
        error('Couldn''t determine layout');    
    end
    
end