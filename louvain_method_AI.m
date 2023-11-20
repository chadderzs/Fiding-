function [S, Q] = louvain_method_AI(A)
    % A is the adjacency matrix of the graph

    % Initialize each node to be in its own community
    n = size(A, 1);
    S = (1:n)';

    % Calculate the initial modularity
    Q = calculate_modularity(A, S);

    % Flag to check if there is any change in communities
    change = true;

    while change
        change = false;

        % Iterate over all nodes and try moving them to a neighboring community
        for i = 1:n
            neighbors = find(A(i, :)); % Find neighbors of node i
            current_community = S(i);

            % Try moving node i to each neighbor's community and calculate the change in modularity
            for j = neighbors
                S(i) = S(j);
                new_Q = calculate_modularity(A, S);

                % If modularity increases, keep the change
                if new_Q > Q
                    Q = new_Q;
                    change = true;
                else
                    S(i) = current_community; % Revert the change
                end
            end
        end
    end
end

function Q = calculate_modularity(A, S)
    % Calculate modularity given adjacency matrix A and community assignments S

    m = sum(A, 'all') / 2; % Total number of edges, considering each edge twice

    Q = 0;
    for i = 1:max(S)
        nodes_in_community = find(S == i);
        subgraph = A(nodes_in_community, nodes_in_community);
        L_in = sum(subgraph, 'all') / 2; % Sum of edges within the community
        d_in = sum(sum(subgraph)); % Sum of degrees within the community
        Q = Q + (L_in / m - (d_in / (2 * m))^2);
    end
end

