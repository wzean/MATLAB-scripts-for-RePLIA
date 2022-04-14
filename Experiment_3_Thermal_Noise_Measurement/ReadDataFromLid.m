% clear
% filename = dir('*.lid');
% 
% [~, ind] = sort([filename(:).datenum], 'ascend');
% filename = filename(ind);

% for i = 1:length(filename)


function [ch1x ch1y ch1r ch1theta ch2x ch2y ch2r ch2theta] = ReadDataFromLid(filename)
    
fileID2=fopen(filename,'r','ieee-le');
B10=fread(fileID2,'int32','ieee-le');

%num = 2097152;
num = length(B10)/8;

ch1x = mean(B10(num*0+1:num*1));
ch1y = mean(B10(num*1+1:num*2));
ch1r = mean(B10(num*2+1:num*3));
ch1theta = mean(B10(num*3+1:num*4));

ch2x = mean(B10(num*4+1:num*5));
ch2y = mean(B10(num*5+1:num*6));
ch2r = mean(B10(num*6+1:num*7));
ch2theta = mean(B10(num*7+1:num*8));

cof = 2.1e6;

ch1x = ch1x/cof;
ch1y = ch1y/cof;
ch1r = ch1r/cof;
ch1theta = ch1theta/cof;

ch2x = ch2x/cof;
ch2y = ch2y/cof;
ch2r = ch2r/cof;
ch2theta = ch2theta/cof;

% totally 8 channels of data
% 共计8个数据通道

fclose(fileID2);

% the data can be read from the stored Lid,
% preliminary calibration can be achieved
end