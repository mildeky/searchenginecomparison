function [ filteredData ] = filterData( inputData, left, right )

filteredData = [];
for i = 1:length(inputData)
    if left < inputData(i)
        if right > inputData(i)
            filteredData = [filteredData, inputData(i)];
        end
    end
end