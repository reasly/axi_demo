# This is the simulation for vcs

SIM_DIR = vcs_sim

vcs:
	-@mkdir $(SIM_DIR)
	cd $(SIM_DIR) && rm -rf simv simv.daidir csrc && \
	vcs -full64 -kdb -lca +lint=TFIPC-L +define+DUMP_FSDB  -v2k_generate  \
		$(FSDBDUMP) +define+SIM_ENV +lint=PCWM \
		-sverilog \
		-f ../rtl.f \
		-f ../tb.f \
		-l comp.log && \
	./simv | tee vcs.log

verdi:
	cd $(SIM_DIR) && verdi -f ../rtl.f -f ../tb.f -sv -ssf *.fsdb 


#		../../tb/sim_env_base.c \
#		../../tb/common_rcp.c \
#		../../tb/common_tpm.c \
#		../../tb/sim_env_case/*.c \
#		-CFLAGS '-I../../../tb -I../../../tb/sim_env_case' \
