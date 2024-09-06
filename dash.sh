pinctrl 27 dl
sleep 2s
pinctrl 27 dh

openocd                                         \
    -f interface/cmsis-dap.cfg	                \
	-f nxp_s32g274-evk-core8.cfg				\
	-c "gdb_port 3335"          				\
	-c "gdb_flash_program enable"				\
	-c "gdb_breakpoint_override hard" $*