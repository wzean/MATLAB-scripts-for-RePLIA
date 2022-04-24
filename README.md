## ReadMe

---

RePLIA - FPGA Based Lock-in Amplifier

### 0 Preparation before use

Please refer to the official websites of [RePLIA](https://github.com/WarwickEPR/RePLIA),[LabOne](https://github.com/zhinst/labone-api-examples)and [Red Pitaya](https://redpitaya.com/documentation/) to complete the environment configuration and the steps for installing the lower computer program.



### 1 Instructions for use

#### 1.1 Confirm ip

#### 1.2 putty starts phase lock

Run Example

#Enter information

```
Your ip address:    (eg 192.168.1.40)
Username:    (default is root)
Password:    (default is nvmag)
```

```
cd tmp/channels
./startall.sh
```

%putty command line two connections one to turn on the instrument and one to set the default start state

#### 1.3 Experimental Measurements

STEP02RePLIAEXP.m

#### 1.4 Data reading

ReadDataFromLid.m

#### 1.5 Frequency sweep

runrepeatedtest_sweep_freq.m



### 2 Code Description

#### 2.1 buildexp

By setting frequency parameter **f** (maximum 50M Hz), amplitude parameter **a** (maximum 1 V), time constant **t** (maximum 1 s), initial phase p(-180°- 180°), sampling rate **r** (up to 2e6 Sa), the following command line can be generated and sent to the lower computer to run.

```
'cd tmp/channels;./settings f 1000000 t 1 m 000000110100 s 0 0 0 a 1 d 1 1 p 0 r 2000000'
```

#### 2.2 demarcatie

​	HF2LI is used to evaluate the reference signal of RepLIA. The measurement method is to generate the reference signal from the CH2 OUPUT and serve as the external reference and measurement signal of HF2LI simultaneously. The system connection is shown in figure S2(a). The reference signal amplitudes are set to 0.1-0.3 V, respectively. The demodulation results are shown in figure S2 (b). It can be seen from the figure that the spectrum of the reference signal is relatively flat near the low-frequency band <1 MHz and the mid-frequency band around 35 MHz, and the measured R results are also comparable to the expected output. 

​	But near the 17 MHz and 46 MHz frequencies, the signal shows a large distortion. For example: when the reference signal amplitude is set at 300 mV, the expected demodulation value R is 106 mV at the peak position of 17.55 MHz. But the measured amplitude reaches 1.422 V, resulting in a very large deviation. This signal has even exceeded the default signal acquisition range of Redpitaya ±1 V. At the position of 46.6 MHz, the amplitude also reaches[[1\]](#_msocom_1) 488 mV which is about 4.6 times the expected value. Considering that the demodulation frequency range of HF2LI has 3dB attenuation when it reaches 50 MHz, the reference signal can be further corrected.[4] As a result of the correction, the trend of the signal remains unchanged, but the amplitude will be slightly elevated in the high frequency part.

​	Due to this feature of RePLIA, in order to avoid setting the same voltage value (such as a=0.3V) in a wide-range frequency sweep to damage other structural elements of the experiment, the output voltage value can be changed by compensating the value of Amp in the setting.

#### 2.3 ReadDataFromLid

The generated file includes ch1x ch1y ch1r ch1theta ch2x ch2y ch2r ch2theta a total of 8 channels of data, the storage format is int32, and the default calibration coefficient is 2.1e6. By looping this script, the data can be read from the stored Lid and preliminary calibration can be achieved.

#### 2.4 reliaexp

Generate a Lid measurement file of custom length, and efficiently transfer it between the upper and lower computers through memory mapping.

##### 2.4.1 reliaexp_without_save

Change parameter measurement without saving Lid files.

#### 2.5 runrepeatedtest_sweep_freq

Sweep measurement by changing frequency parameters

#### 2.6 RunRePLIAEXP

Summary of the whole process of the experiment, including

% Generate the Setting command

% run the experiment process

% parsing result

% Change the experimental condition loop

### 3 

#### 3.1 STEP01RePLIASTARTALL

Enter the ip address, user name, password, establish the connection between the upper computer and the lower computer, allow the shell script of 'startall.sh', and execute the default settings

#### 3.2 STEP02RePLIAEXP

Set measurement parameters, generate Setting commands, run the experimental process, and analyze the results (single)

#### 3.3 STEP03RePLIAloop

On the basis of 3.2 STEP02RePLIAEXP, by setting multiple frequency parameters **f** (maximum 50M Hz), amplitude parameter **a** (maximum 1 V), time constant **t** (maximum 1 s), The initial phase p(-180°- 180°), the sampling rate **r** (up to 2e6 Sa), etc., can generate command lines cyclically, and run cyclically on the lower computer to realize a measurement system that can customize the measurement process.

#### 3.4 STEP04RePLIAcalibration

#### 



### ELSE

---

#### 3.5 STEP05freqsweep_check

Using HF<sub>2</sub>Li to calibrate the signal source of RePLIA

#### 3.6 STEP06RePLIAfreqsweep_amp

Repeated reading of commercially available phase-locked measurements
