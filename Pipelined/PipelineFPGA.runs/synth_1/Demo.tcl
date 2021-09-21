# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/Junior/PipelineFPGA/PipelineFPGA.cache/wt [current_project]
set_property parent.project_path D:/Junior/PipelineFPGA/PipelineFPGA.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/Junior/PipelineFPGA/PipelineFPGA.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/hazard detection.v}
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/EX.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/IFID.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/PC.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/MEM_WB.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/shift2.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/control.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/DataMem.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/lwsw.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/idwb.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/top.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/signextension.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/register.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/mux_2_18bit.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/equal.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/InstructionMem.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/sim.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/forward.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/and.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/mux.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/mem.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/IF.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/adder.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/EX_MEM.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/if_flush.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/assign_zero_1bit.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/ID_EX.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/or.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Junior/pipeline/Mux_PC.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Freshman/VE270/lab_4/lab_4.srcs/sources_1/new/SSD.v
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/new/Demo.v
  {D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/imports/Freshman/VE270/lab 6/lab 6.srcs/sources_1/new/clock_divider_1Hz.v}
  D:/Junior/PipelineFPGA/PipelineFPGA.srcs/sources_1/new/RingCounter.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Junior/PipelineFPGA/PipelineFPGA.srcs/constrs_1/new/FPGAtest1.xdc
set_property used_in_implementation false [get_files D:/Junior/PipelineFPGA/PipelineFPGA.srcs/constrs_1/new/FPGAtest1.xdc]


synth_design -top Demo -part xc7a35tcpg236-1


write_checkpoint -force -noxdef Demo.dcp

catch { report_utilization -file Demo_utilization_synth.rpt -pb Demo_utilization_synth.pb }
