% run the experiment
% 运行一次实验
function [ch1x ch1y ch1r ch1theta ch2x ch2y ch2r ch2theta] = RunRePLIAExp(f,a,t,p,r)
tic
% set eperiement parameters
% 设置实验参数
%f = 1000;  %频率 frequency
%a = 0.3;   %幅度 amplitude
%t = 1;     %时间常数 time constant
%p = 0;     %相位 phase
%r = 2e6;   %数据传输速率 data transfer rate

% generate Setting command
% 产生Setting命令
[comm,file] = buildexp(f,a,t,p,r);

% run the experiment
% 运行实验流程
file = repliaexp(comm,file);
%pause(100);

% analyze the results
% 解析结果
[ch1x ch1y ch1r ch1theta ch2x ch2y ch2r ch2theta] = ReadDataFromLid(file);
disp('----------------------CH1------------------------');
str_ch1 = sprintf('X=%f Y=%f R=%f Theta=%f',ch1x,ch1y,ch1r,ch1theta);
disp(str_ch1);
disp('----------------------CH2------------------------');
str_ch2 = sprintf('X=%f Y=%f R=%f Theta=%f',ch2x,ch2y,ch2r,ch2theta);
disp(str_ch2);
disp('Done');
toc