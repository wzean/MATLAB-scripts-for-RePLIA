function [COMMAND_SETTING,OUT_FILENAME] = BuildExp(f,a,t,p,r)
COMMAND_SETTING = ['cd tmp/channels;./settings f ',num2str(f),...
                    ' t ',num2str(t),' m 000000110100 s 0 0 0 a ',...
                    num2str(a),' d 1 1 p ',num2str(p),' r ',num2str(r)];
% input related parameters, name the file
% frequency parameter f (max 50M Hz)
% amplitude parameter a (max 1 V)
% time constant t (max 1 s)
% initial phase p(-180°- 180°)
% sampling rate r (up to 2e6 Sa)
% 输入参数，命名文件
OUT_FILENAME = ['f',num2str(f),'Hz','m',num2str(a),'V','t',num2str(t),'r',num2str(r),'s.lid'];
end