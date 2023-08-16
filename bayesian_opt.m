% Define the parameter space for Bayesian optimization
params_lower_bounds = [1, 0.1]; % Assuming two parameters: weight and threshold
params_upper_bounds = [10, 0.9];

% Define the number of samples
num_samples = 20;

% Initialize variables to store results
optimized_params = zeros(num_samples, 2);
min_latencies = zeros(num_samples, 1);

% Simulate latency for different parameter combinations
for i = 1:num_samples
    % Randomly sample parameters within bounds
    weight = params_lower_bounds(1) + (params_upper_bounds(1) - params_lower_bounds(1)) * rand();
    threshold = params_lower_bounds(2) + (params_upper_bounds(2) - params_lower_bounds(2)) * rand();
    
    % Simulate latency based on the weight and threshold
    latency = simulate_latency(weight, threshold);
    
    % Store results
    optimized_params(i, :) = [weight, threshold];
    min_latencies(i) = latency;
end

% Find the parameter combination that resulted in the minimum latency
[min_latency_bayesian, min_index] = min(min_latencies);
best_params = optimized_params(min_index, :);

% Display the optimized parameters and minimum latency
disp('Bayesian Optimization:');
disp('Optimized Parameters:');
disp(best_params);
disp(['Minimum Latency: ', num2str(min_latency_bayesian)]);

% Compare with a state-of-the-art model without optimization
state_of_the_art_params = [5, 0.7]; % Example parameters for state-of-the-art model
min_latency_state_of_the_art = simulate_latency(state_of_the_art_params(1), state_of_the_art_params(2));

disp('State-of-the-Art Model:');
disp(['Parameters: ', num2str(state_of_the_art_params)]);
disp(['Minimum Latency: ', num2str(min_latency_state_of_the_art)]);

% Simulate latency for a given set of parameters
function latency = simulate_latency(weight, threshold)
    % Simulate packet scheduling and queueing
    num_packets = 1000; % Number of packets to simulate
    queue = zeros(1, num_packets); % Initialize the queue
    queue_size = 0; % Current queue size
    transmitted_packets = 0; % Number of transmitted packets
    total_latency = 0; % Total latency
    
    for i = 1:num_packets
        % Generate a new packet with random size (bytes) and processing time
        packet_size = randi([100, 1500]); % Example packet size range
        processing_time = packet_size * threshold;
        
        % Check if the queue has space for the packet
        if queue_size + packet_size <= 15000 % Example queue size limit
            queue_size = queue_size + packet_size;
            queue(i) = processing_time;
        else
            % The queue is full, drop the packet
            queue(i) = 0;
        end
        
        % Process packets in the queue
        for j = 1:i
            if queue(j) > 0
                transmitted_packets = transmitted_packets + 1;
                total_latency = total_latency + queue(j);
                queue(j) = 0; % Remove the transmitted packet from the queue
            end
        end
    end
    
    % Calculate average latency
    average_latency = total_latency / transmitted_packets;
    
    % Apply weight to latency and add random noise
    latency = weight * average_latency + rand();
end

