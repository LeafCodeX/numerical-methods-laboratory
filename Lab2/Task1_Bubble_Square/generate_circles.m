function [circles, index_number] = generate_circles(a, r_max, n_max)
    index_number = 193696;
    L1 = mod(index_number, 10);
    circles = zeros(n_max, 3); % Matrix for circles (x, y, r)
    iteration = 1; % Number of generated circles
    if mod(L1, 2) == 0
        while iteration <= n_max % Loop generating circles
            x = rand() * a; 
            y = rand() * a; 
            r = rand() * r_max; 

            down_axis = y - r; % Bounds of the plane (square)
            up_axis = y + r; 
            right_axis = x + r;
            left_axis = x - r; 

            % Checking if the circle fits in the plane area
            if up_axis < a && down_axis > 0 && right_axis < a && left_axis > 0
                overlap = false;
                for j = 1:iteration-1 % Detecting collisions with previously generated circles

                    % Distances between circle centers, d = sqrt((x2-x1)^2 + (y2 - y1)^2)
                    distance = sqrt((x - circles(j, 1))^2 + (y - circles(j, 2))^2);
                    if distance < r + circles(j, 3) % Checking if they overlap
                        overlap = true; 
                        break;
                    end
                end

                % Adding circle (met all existence conditions)
                if ~overlap
                    circles(iteration, :) = [x, y, r]; 
                    iteration = iteration + 1;
                end
            end
        end
    else
        exit % if L1 is an odd number
    end
end