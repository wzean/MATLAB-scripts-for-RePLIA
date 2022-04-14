% run the experiment
% ����һ��ʵ��
function [ch1x ch1y ch1r ch1theta ch2x ch2y ch2r ch2theta] = RunRePLIAExp(f,a,t,p,r)
tic
% set eperiement parameters
% ����ʵ�����
%f = 1000;  %Ƶ�� frequency
%a = 0.3;   %���� amplitude
%t = 1;     %ʱ�䳣�� time constant
%p = 0;     %��λ phase
%r = 2e6;   %���ݴ������� data transfer rate

% generate Setting command
% ����Setting����
[comm,file] = buildexp(f,a,t,p,r);

% run the experiment
% ����ʵ������
file = repliaexp(comm,file);
%pause(100);

% analyze the results
% �������
[ch1x ch1y ch1r ch1theta ch2x ch2y ch2r ch2theta] = ReadDataFromLid(file);
disp('----------------------CH1------------------------');
str_ch1 = sprintf('X=%f Y=%f R=%f Theta=%f',ch1x,ch1y,ch1r,ch1theta);
disp(str_ch1);
disp('----------------------CH2------------------------');
str_ch2 = sprintf('X=%f Y=%f R=%f Theta=%f',ch2x,ch2y,ch2r,ch2theta);
disp(str_ch2);
disp('Done');
toc