% 此方式可行但是会保持一个Matlab程序，太占用计算机资源
% 因此仍使用putty

% This method is feasible but will maintain a Matlab program, which takes up too much computer resources
% so still use putty

% #!/bin/bash
% ./axstart.sh &
% python aysock.py &
% python aampsock.py &
% python bxsock.py &
% python bysock.py &
% python bampsock.py

%input parameters
HOSTNAME='192.168.1.2';
USERNAME='root';
PASSWORD='nvmag';
%
%Enter the ip address, user name, password, 
%establish the connection between the upper computer and the lower computer, 
%allow the shell script of 'startall.sh', and execute the default settings
%登录以建立上下位机之间的连接，执行默认设置
COMMAND_STARTALL = 'cd tmp/channels;./startall.sh';
%COMMAND_SAVE = 'python expwrite.py';

%ssh connection 01
ssh2_conn01 = ssh2_config(HOSTNAME,USERNAME,PASSWORD);
disp('connection is ok')
%START All
%[ssh2_conn01,command_output] = ssh2_command(ssh2_conn01, 'ls -al',1);%
[ssh2_conn01,command_output] = ssh2_command(ssh2_conn01, COMMAND_STARTALL,1);%
disp('startall');

%close
ssh2_conn01 = ssh2_close(ssh2_conn01); %close connection when done
