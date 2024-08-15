# Adding support for **NXPS32G** in OpenOCD with JTAG cenosred 


Unlike standard ARM micro-controllers,this  NXP  microcontroller uses **2** JTAG controllers sharing the common JTAG port of the device, Arm DAP’s JTAG-DP and System JTAG Controller JTAGC. Both JTAG-DP and JTAGC have an IR length of eight and are connected to the JTAG port in an overlay scheme. The System JTAG Controller, JTAGC, also supports the device’s test interface


This means instead of standard for 4 bits for JTAG registers, we have 8 bits which is just normal 4 bits preceeded by zeros.So, we just  4 zeros infornt of standard arm bits, thus maing JTAG coommands as follows.


| DAP_IR     | code      |
| --------   | -------   |
| SJC_DPACC  | 0xfa      |
| SJC_APACC  | 0xfb      |
| IDCODE     | 0xfe      |
| BYPASS     | 0xff      |


## This NXP has an unlock sequence  as observerd in Logic analyser as follows :

1. Run-Test/Idle
2. Select-DR-Scan
3. Capture-DR
4. Shift-DR  PASSWORD
5. Exit1-DR
6. Update-DR
7. Run-Test/Idle
