% Parameters
num_servers = 100;    % Total number of servers
num_choices = 5;      % Number of choices (d)
num_iterations = 100; % Number of iterations

% Initialize server loads for Power of d Choices and JSQ algorithms
server_loads_pow_d_choices = zeros(num_servers, 1);
server_loads_jsq = zeros(num_servers, 1);

% Simulate the Power of d Choices and JSQ algorithms
for iter = 1:num_iterations
    % Generate random request load for each server
    request_loads = rand(num_servers, 1);
    
    % Power of d Choices algorithm
    chosen_servers = zeros(num_choices, 1);
    for choice = 1:num_choices
        [~, min_idx] = min(server_loads_pow_d_choices);
        chosen_servers(choice) = min_idx;
    end
    [~, selected_server] = min(server_loads_pow_d_choices(chosen_servers));
    server_loads_pow_d_choices(selected_server) = server_loads_pow_d_choices(selected_server) + request_loads(selected_server);
    
    % Join Shortest Queue (JSQ) algorithm
    [~, min_idx] = min(server_loads_jsq);
    server_loads_jsq(min_idx) = server_loads_jsq(min_idx) + request_loads(min_idx);
end

% Calculate the average load across all servers for Power of d Choices and JSQ
average_load_pow_d_choices = mean(server_loads_pow_d_choices);
average_load_jsq = mean(server_loads_jsq);

% Display the results
fprintf('Average load across all servers (Power of d Choices): %.2f\n', average_load_pow_d_choices);
fprintf('Average load across all servers (Join Shortest Queue): %.2f\n', average_load_jsq);
%The Join Shortest Queue (JSQ) algorithm tends to outperform the Power of d Choices algorithm in scenarios where the workload is unevenly distributed across the servers or when there are specific patterns in the arrival of requests.
%JSQ excels in situations where there are frequent bursts of requests targeting specific servers with high load. In such cases, JSQ dynamically adapts by directing new requests to the server with the shortest queue or lowest load. 
%This allows JSQ to quickly distribute the workload and prevent individual servers from becoming overloaded.
%On the other hand, the Power of d Choices algorithm distributes the load among a random selection of servers, which can result in less efficient load balancing compared to JSQ. If there are servers with consistently high load or if certain servers receive a significantly higher number of requests, the Power of d Choices algorithm might struggle to evenly distribute the workload, leading to suboptimal performance.
%It's important to note that the relative performance of JSQ and Power of d Choices can vary depending on the specific characteristics of the workload, the network environment, and the system requirements. %
