function [ number ] = findpositive( data )

number = 0;
for i=1:length(data)
    if data(i) > 0
        number = number + 1;
    end
end

end

