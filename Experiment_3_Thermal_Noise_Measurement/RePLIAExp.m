function OUT_FILENAME = RePLIAExp(COMMAND_SETTING,OUT_FILENAME)

%input parameters
HOSTNAME='192.168.1.40';
USERNAME='root';
PASSWORD='nvmag';

% Use settings configurator
% ./settings A X A X
% Where A is the setting you wish to change and X is the value:
% f - Modulation frequency in Hz (floating point, can be given as 10e3).
% t - Averaging period in s (floating point, can be given as 10e3).
% m - mode - set as bits from right to left:
%   1 slave - 1 is slave, 0 is master
%   2 inputs - 1 is dual input, 0 is single
%   3 output type - 1 is amp (and phase for single input), 0 is X (+Y for single)
%   4 sync - 1 sends a sync signal to syncronise all the boards (affects master only)
%   e.g. 100 will output amp and phase of single channel in master mode.
%   5 sweep on dac b
%   6 ref wave on top of sweep
%   7 drop at start of sweep on dac a signal
%   8 output Y/phase instead of X/amp when in sweep or two input mode.
%   9 ref wave square (default sine)
%  10 sweep output is a constant value (uses sweep minimum as constant, sweep can still be used for timing)
%  11 frequency double the reference wave (frequency setting will be that of the modulation output)
%  e.g. m 100 will give amplitude and phase outputs for channel a (running as a master unit) - can leave off higher bits (equivalent to setting them to 0), but all lower bits are required.
%  12 use digital IO for getting sweep counter (not internal generated) - slave only
% s - sweep parameters, needs 3 X - start volt, end volt, period.
% a - amplitude of reference wave on top of sweep - pk-pk
% d - dac multipliers. 2 Xs, for output a and b respectively. Digital multiplication before DAC. Max 2^16-1 and digitisation will be seen at 2^10.
% p - phase lead of modulation output (degrees)
% r - sampling rate of memory saving (Hz, floating point, can be given as 10e3)
% x - send sync command (same as using mode to do it, but does not require the correct other parameters, no X needed)
% h - display manual (no X)
% 
% e.g.
% ./settings f 10e3 t 0.2e-3
% Will set the modulation frequency to 10 kHz and the averaging period to 0.2 ms.

% 50k 100mV vpp
%/root/tmp/channels/settings f 50000 t 0.001 m 000000110100 s 0 0 0 a 0.1 d 100 1 p 0 r 2e6

%STARTALL
%COMMAND_STARTALL = 'cd tmp/channels;./startall.sh';
%SETTING
%COMMAND_SETTING = 'cd tmp/channels;./settings f 5000000 t 1 m 000000110100 s 0 0 0 a 0.1 d 100 1 p 0 r 2e6';
%SAVEDATA
COMMAND_EXP_WRITE = 'cd tmp/channels;python expwritev2.py';
%GETDATA
COMMAND_DATA_FILE = '/media/ramdisk/out11.lid';
%Output filename
%OUT_FILENAME = '5m1s10k.lid';

%ssh connection 01
% ssh2_conn01 = ssh2_config(HOSTNAME,USERNAME,PASSWORD);
% disp('connection is ok');
% %STARTALL
% [ssh2_conn01,command_output] = ssh2_command(ssh2_conn01, COMMAND_STARTALL,1);%
% disp('startall');

%ssh connection 02
ssh2_conn02 = ssh2_config(HOSTNAME,USERNAME,PASSWORD);
disp('setting connection is ok');

%apply setting
[ssh2_conn02,command_output] = ssh2_command(ssh2_conn02, COMMAND_SETTING,1);%
disp('setting applied');
pause(5);
%pause(100);
%tic
%write exp data

disp('python expwritev2.py');
[ssh2_conn02,command_output] = ssh2_command(ssh2_conn02, COMMAND_EXP_WRITE,1);%
%pause(5);    
% 
% 
%transfor data file
ssh2_conn02 = scp_get(ssh2_conn02, COMMAND_DATA_FILE); %scp file from remote host
%toc
% 
%rename
if isfile(OUT_FILENAME)
     % File exists.
     timestr = datestr(datetime('now'),'HHMMSS');
     OUT_FILENAME = [OUT_FILENAME timestr '.lid'];
     movefile('out11.lid',OUT_FILENAME);
else
     % File does not exist.
     movefile('out11.lid',OUT_FILENAME);
end

% generate a Lid measurement file of custom length
% efficiently transfer it between the upper and lower computers through memory mapping

%close
ssh2_conn02 = ssh2_close(ssh2_conn02); %close connection when done

%disp('Finish!');

end
