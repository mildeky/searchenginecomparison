function [ newdata ] = removeoutliers( data, left, right )

newdata = [];

for i=1:length(data)
    if data(i) < right
        if data(i) > left
            newdata = [newdata data(i)];
        end
    end      
end

end