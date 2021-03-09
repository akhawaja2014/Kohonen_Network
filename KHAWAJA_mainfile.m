%%                         KHAWAJA Muhammad Arsalan
%                           test file Khawaja.txt

%                           test results 
%  patient 
%  patient 
%  control
%  control




%%                          Section 1 - Loading Training Data

% Select Class-I Data for part 1 or control.txt for part 3
[filename, pathname] = uigetfile({'*.txt','All Files'}, 'Select Control / Class-1 Data');
fileName = fullfile(pathname, filename);
[~,Name1] = fileparts(fileName);
% Load the Data
Data1 = load(fileName);

% Select Class-II Data
[filename, pathname] = uigetfile({'*.txt','All Files'}, 'Select Patient / Class-2 Data');
fileName = fullfile(pathname, filename);
[~,Name1] = fileparts(fileName);
% Load the Data
Data2 = load(fileName);
Train_data = [Data1; Data2];   % Putiing data in one matrix as following the guidelines of example given in slides.



%%                              Section 2 - Settting the Learning Rate
Alpha = inputdlg('Please Enter Learning Rate')   % UI for taking input
Alpha=str2double(Alpha)                          % input that user gives is by default in string. it has to be converted 
[Weights, Cluster_type] = trainKohonenNetwork(Train_data, Alpha)      % to float or double. 
% calling fuction to train the weights. we give Two data sets and learning
% rate




%%                              Section 3 - Testing the Data
% Load the Test Data
[filename, pathname] = uigetfile({'*.txt','All Files'}, 'Select Test Data');
fileName = fullfile(pathname, filename);
Test_data = load(fileName);
%Testing data, calling function with giving three arguemwnts
Result = testKohonenNetwork(Test_data, Weights, Cluster_type);