root_dir = pwd
VC=iverilog
FLAGS=-I

IFIDSOURCES= src/register_pc.v \
src/inst_mem.v \
src/register_IFID.v \
src/add_const.v \
src/mux_4_1.v


IDEXSOURCES= src/register_file.v \
	src/decode_alu.v \
	src/decode_control.v \
	src/hazard_detect.v \
	src/decode_mux.v \
	src/mux_2_1.v \
	src/register_IDEX.v 

EXMEMSOURCES= src/alu.v \
	src/branch_gen.v \
	src/branch_predictor.v \
	src/add_const.v \
	src/mux_2_1.v \
	src/register_EXMEM.v

MEMWBSOURCES = src/writeback.v \
	src/data_memory.v \
	src/simulated_mem.v\
	src/register_file.v \
	src/register_MEMWB.v


all: 

core: 
	$(VC) $(FLAGS)inc -o output/coreTest.out src/*.v test/core_tb.v
	vvp output/coreTest.out

chronos_core:
	$(VC) $(FLAGS)inc -o output/chronos_core.out src/*.v
	vvp output/chronos_core.out

stageIFID:
	$(VC) $(FLAGS)inc -o output/stage_IFID_tb.out $(IFIDSOURCES) test/stage_IFID_tb.v
	vvp output/stage_IFID_tb.out

stageIDEX:
	$(VC) $(FLAGS)inc -o output/stage_IDEX_tb.out $(IDEXSOURCES) test/stage_IDEX_tb.v
	vvp output/stage_IDEX_tb.out

stageEXMEM:
	$(VC) $(FLAGS)inc -o output/stage_EXMEM_tb.out $(EXMEMSOURCES) test/stage_EXMEM_tb.v
	vvp output/stage_EXMEM_tb.out

stageMEMWB:
	$(VC) $(FLAGS)inc -o output/stage_MEMWB_tb.out $(MEMWBSOURCES) test/stage_MEMWB_tb.v
	vvp output/stage_MEMWB_tb.out

hazard_detect:
	$(VC) $(FLAGS)inc -o output/hazard_detect_tb.out src/hazard_detect.v test/hazard_detect_tb.v
	vvp output/hazard_detect_tb.out

clean:
	rm output/*.out
	rm *.vcd
