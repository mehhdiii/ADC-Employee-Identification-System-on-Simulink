function [result] = identify_employee(Sample1, Sample2, out)


% comparing the received signal with archives to identify the employee
for i = 1:2
    if i == 1
        [C,L] = xcorr(Sample1,out.OutputSignal);
        f1 = max(C);
    elseif i == 2
        [C,L] = xcorr(Sample2,out.OutputSignal);
        f2 = max(C);
    %elseif i == 3
        %[C,L] = xcorr(Sample3,out.OutputSignal);
        %f3 = max(C)
    end
end

if f1 > f2
    result = 1;
else
    result = 2;
end

end

