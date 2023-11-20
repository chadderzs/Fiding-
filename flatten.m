function [flattenedMatrix] = flatten(intraLayerAdjMatrices, interLayerAdjMatrices)
    % Sum the intra-layer matrices
    n = size(intraLayerAdjMatrices{1}, 1); % Assuming all layers have the same number of nodes
    flattenedMatrix = zeros(n, n);
    for i = 1:length(intraLayerAdjMatrices)
        flattenedMatrix = flattenedMatrix + intraLayerAdjMatrices{i};
    end
    
    % Add the inter-layer connections
    for i = 1:length(interLayerAdjMatrices)
        flattenedMatrix = flattenedMatrix + interLayerAdjMatrices{i};
    end
end