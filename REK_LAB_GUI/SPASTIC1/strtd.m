function [x] = strtd(A)
j = 1;
last= 0;

for i = 1:length(A)
    if strcmp(A(i),'|')
        j = j+1;
        last = i;
    else
        x(j,i-last) = A(i);
    end
end