set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk2_IBUF]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ca[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ca[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ca[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ca[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ca[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ca[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ca[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {register_sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {register_sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {register_sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {register_sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {register_sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports clk2]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN W5 [get_ports clk]
set_property PACKAGE_PIN R2 [get_ports clk2]
set_property PACKAGE_PIN V17 [get_ports {register_sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {register_sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {register_sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {register_sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {register_sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports pc_switch]
set_property PACKAGE_PIN T1 [get_ports pc_switch]
set_property PACKAGE_PIN W7 [get_ports {ca[0]}]
set_property PACKAGE_PIN W6 [get_ports {ca[1]}]
set_property PACKAGE_PIN U8 [get_ports {ca[2]}]
set_property PACKAGE_PIN V8 [get_ports {ca[3]}]
set_property PACKAGE_PIN U5 [get_ports {ca[4]}]
set_property PACKAGE_PIN V5 [get_ports {ca[5]}]
set_property PACKAGE_PIN U7 [get_ports {ca[6]}]
set_property PACKAGE_PIN U2 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells pipeline/ie/MEM_out[0]_i_3]]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells pipeline/ii/MEM_out[0]_i_5]]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells pipeline/ii/pc[15]_i_3]]
set_property SEVERITY {Warning} [get_drc_checks LUTLP-1]
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]


