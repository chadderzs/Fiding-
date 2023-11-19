addpath('path_to_louvain_toolbox');

% Parameters for the Erdős-Rényi model
n = 100; % Number of nodes
p = 0.1; % Probability of edge existence between any pair of nodes

% Generate random adjacency matrix using Erdős-Rényi model
A = rand(n) < p;
A = triu(A, 1) + triu(A, 1)'; % Ensure symmetry

% Apply Louvain method for community detection
[S, Q] = CDTBDemo01(A);

% Visualize the random network and detected communities
G = graph(A);
figure;
plot(G, 'Layout', 'force', 'NodeColor', S);
title('Random Network with Detected Communities');
