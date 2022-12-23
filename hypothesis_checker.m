%% Please read the PDFs to understand what's going on.

%% Function
function []=hypothesis_checker(hmatrix);

a = hmatrix;
a2=a.*a;
[row, column] = size(a2);

SSW = sum(sum(a2,2))-sum(sum(a,2).^2)/column;
dof1 = (row-1);



SSB = sum((sum(a,2).^2)/column)-sum((sum(sum(a)).^2)/(row*column));
dof2 = (row*(column-1));

MSB=SSB/dof1;
MSW=SSW/dof2;

Fcal = MSB/MSW;
Ftab = finv(0.99,dof1,dof2);

if Ftab>Fcal
    if sum(sum(a))/(column*row)>5.0;
        disp("Severe Issue and universally relevant")
    else
        disp("Failed to reject hypothesis.")
    end
 else Ftab<Fcal
    disp("Hypothesis rejected.")
end

end
%% CALL
% clc
% clear
% 
% 
% c=[3 2 9 8 9 9;5 9 10 5 8 9;6 7 10 5 7 8;8 9 9 8 2 8;3 8 7 10 10 4;2 7 9 10 6 7];
% n=[3 2 9 8 9 7;5 4 4 5 3 2;5 2 4 5 1 2;3 1 1 2 6 2;3 8 7 10 10 4;3 1 9 8 6 7];
% o=[9 9 10 8 7 8;5 4 4 5 3 2;4 6 7 2 8 9;3 1 5 2 6 2;7 4 5 1 2 3;3 2 9 8 6 7];
% p=[6 9 5 5 7 6;6 4 6 5 7 8;4 6 7 2 8 9;4 6 6 1 8 9;10 7 8 1 5 6;3 2 9 8 6 7];
% 
% hypothesis_checker(p)

%%