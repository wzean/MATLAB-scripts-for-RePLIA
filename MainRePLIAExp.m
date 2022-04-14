%����һ��ʵ��

function MainRePLIAExp(f)
tic
% set measurement parameters
% ����ʵ�����
%f = 500e3;  %Ƶ��

a = 0.1;     %���� Amplitude
t = 1;       %ʱ�䳣�� time constant
p = 0;       %��λ phase
r = 2e4;     %������ Sampling Rate

% generate Setting commands
% ����Setting����
[comm,file] = BuildExp(f,a,t,p,r);

% run the experimental process
% ����ʵ������
file = RePLIAExp(comm,file);
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
end