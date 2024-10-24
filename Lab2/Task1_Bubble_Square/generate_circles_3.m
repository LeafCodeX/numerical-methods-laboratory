function [circles, index_number, circle_areas, rand_counts, counts_mean] = generate_circles_3(a, r_max, n_max)
    index_number = 193696;
    L1 = mod(index_number, 10);
    circles = zeros(n_max, 3); % Matrix for circles (x, y, r)
    iteration = 1; % Number of generated circles
    L2 = floor(mod(index_number, 100) / 10);
    rand_counts = zeros(n_max, 1); % Vector for storing the number of random selection
    counts_mean = zeros(n_max, 1);
    count = 0; % Counter for number of random selections for each circle
    
    if mod(L1, 2) == 0 && mod(L2,2) ~= 0
        while iteration <= n_max % Loop generating circles
            count = count + 1; % Increment the count for each random selection
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
                    rand_counts(iteration) = count; % Store the number of random selections for this circle
                    iteration = iteration + 1;
                    count = 0; % Reset the count for the next circle
                else
                    count = count + 1; % If overlap with previous circles
                end
            end
        end
        circle_areas = cumsum(pi * circles(:, 3).^2); % P = pi * r^2
        
        % Calculate the mean number of random selections for each circle
        counts_mean(1) = rand_counts(1);
        for i = 2:n_max
            counts_mean(i) = sum(rand_counts(1:i)) / i;
        end
    else
        exit % if L1 is an odd number
    end
end
