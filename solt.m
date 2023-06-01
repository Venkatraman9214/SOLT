%Venkatraman-modified 06/1/2023
% Parameters
num_servers = 100;    % Total number of servers
num_choices = 5;      % Number of choices (d)
num_iterations = 100; % Number of iterations

% Initialize server loads
server_loads = zeros(num_servers, 1);

% Simulate the Power of d Choices algorithm
for iter = 1:num_iterations
    % Generate random request load for each server
    request_loads = rand(num_servers, 1);
    
    % Choose servers based on the Power of d Choices algorithm
    chosen_servers = zeros(num_choices, 1);
    for choice = 1:num_choices
        % Select the server with the lowest load among random choices
        [~, min_idx] = min(server_loads);
        chosen_servers(choice) = min_idx;
    end
    
    % Choose the server with the lowest load among the chosen servers
    [~, selected_server] = min(server_loads(chosen_servers));
    
    % Update the load of the selected server
    server_loads(selected_server) = server_loads(selected_server) + request_loads(selected_server);
end

% Calculate the average load across all servers
average_load = mean(server_loads);

% Display the results
fprintf('Average load across all servers: %.2f\n', average_load);
