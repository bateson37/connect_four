function valid = validPlay(board,row,col)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    valid = 0;

    % Check if they're integers
    if rem(row, 1) == 0 && rem(col, 1) == 0
        % Check if they're within range
        if row > 0 && col > 0 && row <= 6 && col <= 7
            % Check if position don't already exist
            if board(row, col) == 1
                % Check if position is on bottom or on top of other position
                if row == 6 || board(row+1, col) == 2 || board(row+1, col) == 3
                    valid = 1;
                end
            end
        end
    end
end

