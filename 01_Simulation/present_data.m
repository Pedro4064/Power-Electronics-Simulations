function var_table = present_data(data, variable_names)
% PRESENT_DATA returns a formatted table to easily present variables on matlab live scripts. 
% Keep in mind that the first arg must be a cell array and the second a simple array
%
%   present_data({2, 3, 4}, ["Normal Integration", "Method 1", "Method 2"])

  
raw_table = table(data{:}, 'VariableNames',variable_names); %{:} dereferences all the elements in the cell array
table_array = table2array(raw_table);
var_table = array2table(table_array.');
var_table.Properties.RowNames = raw_table.Properties.VariableNames;
var_table.Properties.VariableNames = {'Values'};
end