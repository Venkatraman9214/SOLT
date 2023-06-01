% Parameters
num_servers = 100;    % Total number of servers
num_choices = 5;      % Number of choices (d)
num_iterations = 100; % Number of iterations

% Initialize server loads and fractional assignments
server_loads = zeros(num_servers, 1);
fractional_assignments = zeros(num_servers, 1);

% Simulate the Power of d Choices algorithm for fractional assignments
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
    
    % Update the fractional assignment of the selected server
    fractional_assignments(selected_server) = fractional_assignments(selected_server) + 1;
end

% Calculate the average load and fractional assignment across all servers
average_load = mean(server_loads);
average_fractional_assignment = mean(fractional_assignments);

% Display the results
fprintf('Average load across all servers: %.2f\n', average_load);
fprintf('Average fractional assignment across all servers: %.2f\n', average_fractional_assignment);
