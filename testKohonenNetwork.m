function Result = testKohonenNetwork(Test_data, Weights, Cluster_type)

% Inputs
%     Test_data     - Dataset to Classify
%     Weights       - Synaptic Weights computed in Training phase
%     Cluster_type  - To Print Appropriate Cluster
%
% Output
%     Result        - Classification of Clusters for a given Dataset
% Define Cluster Class

if Cluster_type == 1
    Cluster_1 = 1;
    Cluster_2 = 2;
else
    Cluster_1 = 2;
    Cluster_2 = 1;
end

for i = 1:size(Test_data,1)
    
    % Compute Euclidean Distance between Test Data and Synaptic Weights
    Distance1 = norm(Test_data(i,:)-Weights(:,1)')^2;
    Distance2 = norm(Test_data(i,:)-Weights(:,2)')^2;
    
    % Compare the Distance (Data belongs to the Class with Minimum Distnace)
    if Distance1 < Distance2
        Result(i) = Cluster_1;
    else
        Result(i) = Cluster_2;
    end
end


%%

%% Results

if Result(1) == 1
    disp('Control')    
elseif Result(1) == 2
    disp('patient')    
end

if Result(2) == 1
    disp('Control')    
elseif Result(2) == 2
    disp('Patient')
end

if Result(3) == 1
    disp('Control')    
elseif Result(3) == 2
    disp('Patient')
end

if Result(4) == 1
    disp('Control')
elseif Result(4) == 2
    disp('Patient')
end




end