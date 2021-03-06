function y = myLPF(x)
%MYLPF Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.1 and the Signal Processing Toolbox 6.19.
% Generated on: 06-Oct-2014 10:59:05

%#codegen

% To generate C/C++ code from this function use the codegen command. Type
% 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    % % Equiripple Lowpass filter designed using the FIRPM function.
    %
    % % All frequency values are in Hz.
    % Fs = 44100;  % Sampling Frequency
    %
    % Fpass = 800;             % Passband Frequency
    % Fstop = 2000;            % Stopband Frequency
    % Dpass = 0.057501127785;  % Passband Ripple
    % Dstop = 0.01;            % Stopband Attenuation
    % dens  = 20;              % Density Factor
    %
    % % Calculate the order from the parameters using FIRPMORD.
    % [N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);
    %
    % % Calculate the coefficients using the FIRPM function.
    % b  = firpm(N, Fo, Ao, W, {dens});
    
    Hd = dsp.FIRFilter( ...
        'Numerator', [-0.00994237171060323 -0.00376007145705101 ...
        -0.00418713649191029 -0.00441691272847254 -0.00438571353009598 ...
        -0.00403468468173993 -0.00330651904565872 -0.00215098701263607 ...
        -0.000529753739356889 0.00158281829588715 0.00419542241173606 ...
        0.00730001063417118 0.010868938580083 0.0148559622643071 ...
        0.0191936685582427 0.023800447284521 0.0285853880933172 ...
        0.0334198982944354 0.0382097430592616 0.0428107169631563 ...
        0.0471008895036399 0.0509723788479959 0.054310060186457 ...
        0.0570131531933143 0.0590038151864256 0.0602227814778136 ...
        0.06063368656274 0.0602227814778136 0.0590038151864256 ...
        0.0570131531933143 0.054310060186457 0.0509723788479959 ...
        0.0471008895036399 0.0428107169631563 0.0382097430592616 ...
        0.0334198982944354 0.0285853880933172 0.023800447284521 ...
        0.0191936685582427 0.0148559622643071 0.010868938580083 ...
        0.00730001063417118 0.00419542241173606 0.00158281829588715 ...
        -0.000529753739356889 -0.00215098701263607 -0.00330651904565872 ...
        -0.00403468468173993 -0.00438571353009598 -0.00441691272847254 ...
        -0.00418713649191029 -0.00376007145705101 -0.00994237171060323]);
end

y = step(Hd,x);
release(Hd);


% [EOF]
