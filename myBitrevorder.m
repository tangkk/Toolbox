function y = myBitrevorder(x)

% N must be a pow 2 number
N = length(x);
binLen = log2(N);

% note that this is not an in-place computation of bit reverse order
y = x;

for i = 1:1:N
    % turn it to a 0 - (N/2 - 1) indexing
    oriidx = i - 1;
    bin = de2bi(oriidx, binLen);
    bin = flip(bin);
    newibr = bi2de(bin);
    
    % perform the swap in 1 - N/2 indexing
    oriidx = oriidx + 1;
    newibr = newibr + 1;
    y(oriidx) = x(newibr);
end