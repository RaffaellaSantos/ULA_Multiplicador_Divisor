transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/raffaellasf/Documentos/Quartus/Multiplicador {/home/raffaellasf/Documentos/Quartus/Multiplicador/multi_8b.v}

vlog -vlog01compat -work work +incdir+/home/raffaellasf/Documentos/Quartus/Multiplicador {/home/raffaellasf/Documentos/Quartus/Multiplicador/tb_multi_8b.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_multi_8b

add wave *
view structure
view signals
run -all
