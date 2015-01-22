% This function implements the fft algorithm using decimation in time as
% a divide and conquer implementation method
% specifically, it implements the algorithm described in chapter 9.3 of
% Oppenheim, A. V., Schafer, R. W., & Buck, J. R. (1989). Discrete-time signal processing (Vol. 2).
% Englewood Cliffs: Prentice-hall.
% more specifically, the flow graph of this algorithm is depicted in figure 9.10

function x = myFFT(x)

% input length must be the power of 2
N = 2^nextpow2(length(x));
% pad x with 0s
x = vertcat(x, zeros(1,N-length(x))');

% number of stages in butterfly computation
S = log2(N);

% first we compute a table of coefficients W_N^0 to W_N^N/2, where
% W_N^r = exp((-j*2*pi*r)/N)  0 <= r <= N/2 - 1
% note the coefficient table is in original order
W = exp((-1j*2*pi*(0:1:N/2-1))/N);

% then we change the input in bit-reverse order for in-place computation
x = bitrevorder(x);

% stage number k, group number l
for k = 1:1:S
    p0 = 1;
    q0 = 2^(k-1)+1;
    r0 = 1;
    skip = 2^k;
    rskip = N/4;
%     display('*******************');
%     display(N);
%     display(p0);
%     display(q0);
%     display(k);
%     display(skip);
%     display(rskip);
    for l = 1:1:N/2
        p = p0 + floor(skip*(l-1) / N) + mod(skip*(l-1),N);
        q = q0 + floor(skip*(l-1) / N) + mod(skip*(l-1),N);
        r = r0 + floor(skip*(l-1) / N)*(rskip/2^(k-2));
%         display(p);
%         display(q);
%         display(r);
        % perform an element butterfly calculation here in-place
        % X_m[p] = X_(m-1)[p] + W_N^r*X_(m-1)[q]
        % X_m[q] = X_(m-1)[p] - W_N^r*X_(m-1)[q]
        tmp = x(p) + W(r)*x(q);
        tmq = x(p) - W(r)*x(q);
        x(p) = tmp;
        x(q) = tmq;
    end
end

