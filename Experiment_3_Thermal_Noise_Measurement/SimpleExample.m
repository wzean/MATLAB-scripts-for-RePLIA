%run('C:\LabOneMatlab-21.02.13366\ziAddPath');
%addpath 'C:\LabOneMatlab-21.02.13366'

function SimpleExample

clear ziDAQ

ziDAQ('connect');

device = autoDetect;

% Record one demodulator sample from the specified node.

sample = ziDAQ('getSample', ['/' device '/demods/0/sample']);

% Calculate r from x and y.

r = sqrt(sample.x.^2 + sample.y.^2);

fprintf('Measured rms amplitude %gV\n', r);


