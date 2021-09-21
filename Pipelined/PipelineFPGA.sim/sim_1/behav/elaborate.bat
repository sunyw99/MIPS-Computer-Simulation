@echo off
set xv_path=D:\\Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 0d7b79556ad047e69a8837650401e45b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot sim_behav xil_defaultlib.sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
