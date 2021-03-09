function [Weights, Cluster_type] = trainKohonenNetwork(Train_data, Alpha)
% Inputs
%     Train_data    - Dataset for computing Weight Vector
%     Alpha         - Initial Learning Rate

% Outputs
%     Weights       - Synaptic Weights after Convergence
%     Cluster_tpye  - Clusters corresponding to the computed Weights

% Intial Random Synaptic Weights between[0, 1]
Weights = rand(size(Train_data,2),2);
% rand(rows,column)
% size(Train_data which is matrix name, Find length of second dim of Train_data)
% Initialization for calculating Convergence Error
Weights1 = [];
temp=2;

% Number of Training Iterations
Iter = 100;





%% Begin Training
figure() % begining figure here to plot convergence
for i = 1:Iter
    for j = 1:size(Train_data,1)
        
        % Calculate distances between each Node and the given Data
        Distance1 = norm(Train_data(j,:)-Weights(:,1)')^2;        % These distances are heart of algorithm
        Distance2 = norm(Train_data(j,:)-Weights(:,2)')^2;        % Since two final clusters, so two distances 
        
        % Calculate Nearest Node and Update Weights accordingly
        % The winning node will be the one with less distance according to
        % algorithm. This if loop does that job.
        if Distance1 < Distance2
            Weights(:,1) = Weights(:,1) + Alpha*(Train_data(j,:)' - Weights(:,1));
            
            % Define the Cluster type
            % To make things simple we introduce cluster type.Note that its
            % different from 'cluster'.
            if j == 1
                Cluster_type = 1; 
            end
        else
            Weights(:,2) = Weights(:,2) + Alpha*(Train_data(j,:)' - Weights(:,2));
            if j == 1
                Cluster_type = 2;
            end
        end
    end
    
    % Decay Learning Rate
    % According to the algorithm, the learning rate will decrease by 50%
    % after every iteration.
    Alpha = Alpha * exp(-i/Iter);
    



 %% Calculate the Convergence Error (If Error is less than a Threshold, Training Stops)
    % In simple words, we stop training, when we dont see any significant
    % change in weight's after a reasonable amount of iterations, this
    % means that the weights have been converged and we need to let the
    % computer know that it needs to stop training. So these below commands
    % tell computer to stop when you dont see any change in weights. 
    Weights1 = [Weights1 Weights];
    if i ~= 1
        Error =  sum(sum(Weights1(:,temp-1:temp) - Weights1(:,temp+1:temp+2))); % Convergence Error
        
        
        % Plot the Error vs Iterations graph
        scatter(i-1,Error,'b.');
        xlabel('Iterations');
        ylabel('Weight Convergence Error');
        hold on;
        pause(1e-10);
        temp = temp + 2;
        
        % Check if Error is less than a certain Threshold
        if Error < 1e-20
            break;
        end
    end
end

end