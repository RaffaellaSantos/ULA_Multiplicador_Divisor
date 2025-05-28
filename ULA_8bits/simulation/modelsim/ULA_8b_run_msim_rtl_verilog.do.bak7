transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/raffaellasf/Documentos/Quartus/ULA_8bits {/home/raffaellasf/Documentos/Quartus/ULA_8bits/ULA_8b.v}
vlog -vlog01compat -work work +incdir+/home/raffaellasf/Documentos/Quartus/ULA_8bits {/home/raffaellasf/Documentos/Quartus/ULA_8bits/mux_4x1.v}

vlog -vlog01compat -work work +incdir+/home/raffaellasf/Documentos/Quartus/ULA_8bits {/home/raffaellasf/Documentos/Quartus/ULA_8bits/tb_ULA_8b.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_ULA_8b

add wave *
view structure
view signals
run -all
