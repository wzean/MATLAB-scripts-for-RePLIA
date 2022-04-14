% calibration @ one frequency
%clf
%clear
%close all

%addpath('E:\RePLIA使用0811\RePLIA使用\matlab scripts\ssh2_v2_m1_r7\ssh2_v2_m1_r7')
function MainRePLIACalibration(f)

%f = 500e3;
t = 1;
p = 0;
r = 2e4;

% 扫描幅度
% Sweep Amplitude
np = 20;
for i = 1:np
    a(i) = i/np;
    % amp loop
    [ch1x(i) ch1y(i) ch1r(i) ch1p(i) ch2x(i) ch2y(i) ch2r(i) ch2p(i)] = RunRePLIAEXP(f,a(i),t,p,r);
end

%figure(1)
subplot(121)
plot(a*1e3,ch1r,'b-o',a*1e3,a*1e3,'r-o');
save('amp_amp_cal.mat','a','ch1x','ch1y','ch1r','ch1p',...
    'ch2x','ch2y','ch2r','ch2p');
xlabel('Modulation Amplitude mV','FontSize',14)
ylabel('Measured Amplitude mV','FontSize',14)

% scan the phase
% 扫描相位
a = 0.1;
dp = 18;
for i = 1:360/dp+1
    p(i) = -180+(i-1)*dp;
    %phase loop
    [plch1x(i) plch1y(i) plch1r(i) plch1p(i) plch2x(i) plch2y(i) plch2r(i) plch2p(i)] = RunRePLIAEXP(f,a,t,p(i),r);
end

%figure(2)
subplot(122)
plot(p,plch1p,'b-o',p,p,'r-o');
save('pha_pha_cal.mat','p','plch1x','plch1y','plch1r','plch1p',...
    'plch2x','plch2y','plch2r','plch2p');
xlabel('Modulation Phase deg','FontSize',14)
ylabel('Measured Phase mV','FontSize',14)

title(['f=' num2str(f) 'Hz'])

print('-dpng','-r200',['respng' num2str(f)]);

%freq = linspace(1e4,5e7,200)
% freq1 =38e6*ones(1,50);
%freq1 =[];
%freq1 = 10e3;
% for j = 3:1:5
%    for k = 1.5:0.5:10
%    A = k * 10^j;
%    freq1 = [freq1 A];
%    end
% end

% freq = sort(freq1);

% main loop
% for i = 1:length(freq)
% f = freq(i);
% %mark(i) = 1.269e-36*f^5-1.249e-30*f^4-1.604e-22*f^3+1.666e-15*f^2-1.131e-09*f + 0.1088;
% %a = 0.5/demarcate(f)*0.25/sqrt(2);
% %a = 0.5/demarcate(f)*0.5;
% a = 0.68;
% %a = 0.1;
% t = 1;
% p = 0;
% s = 2e6;
% 
% 
% RunRePLIAEXP(f,a,t,p);
% 
% 
% % % generate command
% % [comm,file] = buildexp(f,a,t,p,s);
% % 
% % %setting and get lid file
% % repliaexp(comm,file);
% % 
% % % 解析结果
% % % parsing result
% % % [ch1x ch1y ch1r ch1theta ch2x ch2y ch2r ch2theta] = ReadDataFromLid(file);
% % % %disp('----------------------CH1------------------------');
% % % %str_ch1 = sprintf('X=%f Y=%f R=%f Theta=%f',ch1x,ch1y,ch1r,ch1theta);
% % % %disp(str_ch1);
% % % %disp('----------------------CH2------------------------');
% % % %str_ch2 = sprintf('X=%f Y=%f R=%f Theta=%f',ch2x,ch2y,ch2r,ch2theta);
% % % %disp(str_ch2);
% % % %disp('Done');
% % % mag(i) = ch1r;
% % % pha(i) = ch1theta;
% % % X(i) = ch1x;
% % % Y(i) = ch1y;
% % % disp(freq(i));
% % % %pause(5)
% % % %HF2LI
% % % %pause(2)
% % j = 1;
% %     while j <= 10
% %         if simple_read_example > 0.010
% %         hf2R(j) = 1000*simple_read_example;
% %         j = j + 1;
% %         end
% %     end
% %         aver_hf2_max(i) = max(hf2R);
% %         aver_hf2_min(i) = min(hf2R);
% %         aver_hf2R(i) = (sum(hf2R)-aver_hf2_max(i)-aver_hf2_min(i))/8;
% %         freq2(i) = 0.02*i;
% %         high(i) = (aver_hf2_max(i) - aver_hf2R(i))*i/100;
% %         low(i) = (aver_hf2R(i) - aver_hf2_min(i))*i/100;
% %         figure(1);
% %         subplot(2,1,1)
% %         plot(hf2R,'o')
% %         xlabel('Number');
% %         ylabel('AmpValue/μV');
% %         subplot(2,1,2)
% %         errorbar(freq2,aver_hf2R,low,high,'-or')
% %         xlabel('Noise/mV');
% %         ylabel('AmpValue/μV');
% end

% subplot(2,2,1)dakai
% plot(freq,mag,'o')
% subplot(2,2,2)
% plot(freq,pha,'o')
% subplot(2,2,3)
% plot(freq,X,'o')
% subplot(2,2,4)
% plot(freq,Y,'o')
end
