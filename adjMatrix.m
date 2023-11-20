% Intra-layer adjacency matrices
adjMatrixLayer1 = [0 1 0 0 1; 
                   1 0 1 0 1; 
                   0 1 0 0 0;
                   0 0 0 0 0;
                   1 1 0 0 0]; % Layer 1 adjacency matrix
adjMatrixLayer2 = [0 1 0 0 0 ; 
                   1 0 1 0 0;
                   0 1 0 1 0;
                   0 0 1 0 0;
                   0 1 0 0 0]; % Layer 2 adjacency matrix
intraLayerAdjMatrices = {adjMatrixLayer1, adjMatrixLayer2};

% Inter-layer adjacency matrices
interLayerAdjMatrix1 = [0 1 1 1 0; 
                        1 0 0 0 0;
                        1 0 0 1 0;
                        1 0 1 0 0;
                        0 0 0 0 0]; % Connections between nodes of Layer 1 and Layer 2
interLayerAdjMatrices = {interLayerAdjMatrix1};

% Flattening the multiplex network
flattenedNetwork = flatten(intraLayerAdjMatrices, interLayerAdjMatrices);

% Display the flattened network's adjacency matrix
disp(flattenedNetwork);