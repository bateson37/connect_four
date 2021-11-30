clc
clear


% Initialize scene
my_scene = simpleGameEngine('ConnectFour.png',86,101);

% Set up variables to name the various sprites
empty_sprite = 1;
red_sprite = 2;
black_sprite = 3;

% Display empty board   
board_display = empty_sprite * ones(6,7);
drawScene(my_scene,board_display)

% Define row and column variables
row = 0;
col = 0;

%Get player names
player_name1 = input('Enter player 1''s name: ', 's');
player_name2 = input('\nEnter player 2''s name: ', 's');
player = 2;

x = 1;

while x <= 42
    if player == 1
        player = 2;
    else
        player = 1;
    end
    if player == 1
        fprintf('\n%s, it is your turn!\n', player_name1);
        while ~validPlay(board_display,row,col)
            [row,col] = getMouseInput(my_scene);
        end
        board_display(row,col) = red_sprite;
        drawScene(my_scene,board_display)
    else
        fprintf('\n%s, it is your turn!', player_name2);
        while ~validPlay(board_display,row,col)
            [row,col] = getMouseInput(my_scene);
        end
        board_display(row,col) = black_sprite;
        drawScene(my_scene,board_display)
    end
    x = x + 1;
    if winner(board_display)
        break
    end
end
if x == 43
    fprintf('It''s a draw')
elseif player == 1
    fprintf('\nThe winner is %s!! :)', player_name1)
else
    fprintf('\nThe winner is %s!! :)', player_name2)
end

