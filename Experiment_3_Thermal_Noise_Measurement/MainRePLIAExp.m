%运行一次实验

function MainRePLIAExp(f)
tic
% set measurement parameters
% 设置实验参数
%f = 500e3;  %频率

a = 0.1;     %幅度 Amplitude
t = 1;       %时间常数 time constant
p = 0;       %相位 phase
r = 2e4;     %采样率 Sampling Rate

% generate Setting commands
% 产生Setting命令
[comm,file] = BuildExp(f,a,t,p,r);

% run the experimental process
% 运行实验流程
file = RePLIAExp(comm,file);
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
end