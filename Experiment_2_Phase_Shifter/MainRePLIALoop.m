% frequency sweep
clf
clear
%freq1 = linspace(49.99e6,5e7,200)
%freq1 =38e6*ones(1,50);
freq1 =[];
% freq1 = 10e3;
for j = 3:1:5
   for k = 1.2:0.25:10
   A = k * 10^j;
   freq1 = [freq1 A];
   end
end

% freq = sort(freq1);

% main loop
for i = 1:length(freq1)
f = freq1(i);
%mark(i) = 1.269e-36*f^5-1.249e-30*f^4-1.604e-22*f^3+1.666e-15*f^2-1.131e-09*f + 0.1088;
%a = 0.5/demarcate(f)*0.25/sqrt(2);
%a = 0.5/demarcate(f)*0.5;
% set multiple frequency parameters f (max 50 MHz)
% 设置频率参数
a = 0.1;
%a = 0.1;
% set amplitude paramete a (max 1 V)
% 设置振幅参数
t = 1;
% set time constant t (max 1 s)
% 设置时间常数
p = 0;
% set initial phase p (-180°- 180°)
% 设置初相位
r = 2e4;
% set sampling rate r (up to 2e6 Sa)
% 设置采样率

RunRePLIAExp(f,a,t,p,r);

% generate command lines cyclically,
% run cyclically on the lower computer
% to realize a measurement system that can customize the measurement process
% 在下位机运行，实现测量系统功能

% % generate command
% [comm,file] = buildexp(f,a,t,p,s);
% 
% %setting and get lid file
% repliaexp(comm,file);
% 
% % 解析结果
% % parsing result
% % [ch1x ch1y ch1r ch1theta ch2x ch2y ch2r ch2theta] = ReadDataFromLid(file);
% % %disp('----------------------CH1------------------------');
% % %str_ch1 = sprintf('X=%f Y=%f R=%f Theta=%f',ch1x,ch1y,ch1r,ch1theta);
% % %disp(str_ch1);
% % %disp('----------------------CH2------------------------');
% % %str_ch2 = sprintf('X=%f Y=%f R=%f Theta=%f',ch2x,ch2y,ch2r,ch2theta);
% % %disp(str_ch2);
% % %disp('Done');
% % mag(i) = ch1r;
% % pha(i) = ch1theta;
% % X(i) = ch1x;
% % Y(i) = ch1y;
% % disp(freq(i));
% % %pause(5)
% % %HF2LI
% % %pause(2)
% j = 1;
%     while j <= 10
%         if simple_read_example > 0.010
%         hf2R(j) = 1000*simple_read_example;
%         j = j + 1;
%         end
%     end
%         aver_hf2_max(i) = max(hf2R);
%         aver_hf2_min(i) = min(hf2R);
%         aver_hf2R(i) = (sum(hf2R)-aver_hf2_max(i)-aver_hf2_min(i))/8;
%         freq2(i) = 0.02*i;
%         high(i) = (aver_hf2_max(i) - aver_hf2R(i))*i/100;
%         low(i) = (aver_hf2R(i) - aver_hf2_min(i))*i/100;
%         figure(1);
%         subplot(2,1,1)
%         plot(hf2R,'o')
%         xlabel('Number');
%         ylabel('AmpValue/μV');
%         subplot(2,1,2)
%         errorbar(freq2,aver_hf2R,low,high,'-or')
%         xlabel('Noise/mV');
%         ylabel('AmpValue/μV');
end

% subplot(2,2,1)dakai
% plot(freq,mag,'o')
% subplot(2,2,2)
% plot(freq,pha,'o')
% subplot(2,2,3)
% plot(freq,X,'o')
% subplot(2,2,4)
% plot(freq,Y,'o')
