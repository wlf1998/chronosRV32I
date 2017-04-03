

# # Terminal colors and modifiers
# n := $(shell tput sgr0)
# # Red color
# r := $(shell tput setaf 1)
# # Green color
# g := $(shell tput setaf 2)
# # Bold text
# b := $(shell tput bold)
# # Underlined text
# u := $(shell tput smul)

default all: help

# HELP Target

.PHONY: help

# Display a help message about how to use the Makefile to the user
help:
	@printf "Atticus Makefile: Help\n"
	@printf "\n"
	@printf "$bUsage:$n\n"
	@printf "\tmake [$uvariable$n ...] $utarget$n\n"
	@printf "\n"
	@printf ""
	@printf "$bTargets:$n\n"
	@printf "\t$bsim$n\n"
	@printf "\t    Compiles the Verilog files in the $u$(SRC_DIR)$n directory\n"
	@printf "\t    into a simulator, and then runs the simulator with the\n"
	@printf "\t    specified $bTEST$n program. Generates a simulation\n"
	@printf "\t    executable at $u$bOUTPUT$n$u/$(SIM_EXECUTABLE)$n.\n"
	@printf "\n"
	@printf "\t$bsim-gui$n\n"
	@printf "\t    Performs the same actions as sim, but runs the specified\n"
	@printf "\t    $bTEST$n with the waveform viewer.\n"
	@printf "\n"
	@printf "\t$bverify$n\n"
	@printf "\t    Runs and verifies all of the tests specified by $bTESTS$n.\n"
	@printf "\t    Takes the same steps as the $bsim$n target and then\n"
	@printf "\t    compares simulation's register dump against the reference.\n"
	@printf "\n"
	@printf "\t$bsynth$n\n"
	@printf "\t    Compiles the Verilog files in the $u$(SRC_DIR)$n into a\n"
	@printf "\t    physical design using the specified $bSYNTH_SCRIPT$n. All\n"
	@printf "\t    outputs are placed in in $bOUTPUT$n.\n"
	@printf "\n"
	@printf "\t$bview-timing, view-power, view-area$n\n"
	@printf "\t    Displays the timing, power, or area report from the last\n"
	@printf "\t    synthesis run. Re-runs 'synth' if the report doesn't exist.\n"
	@printf "\n"
	@printf "\t$bassemble$n\n"
	@printf "\t    Assembles the specified $bTEST$n program into hex files\n"
	@printf "\t    for each code section. The hex files are placed in the\n"
	@printf "\t    test's directory under $u<test_name>.<section>.hex$n.\n"
	@printf "\n"
	@printf "\t$bclean$n\n"
	@printf "\t    Cleans up all of the files generated by compilation in the\n"
	@printf "\t    $bOUTPUT$n directory.\n"
	@printf "\n"
	@printf "\t$bveryclean$n\n"
	@printf "\t    Takes the same steps as the $bclean$n target and also\n"
	@printf "\t    cleans up all hex files in the inputs directories\n"
	@printf "\t    generated from assembling in the tests.\n"
	@printf "\n"
	@printf "$bVariables:$n\n"
	@printf "\t$bTEST$n\n"
	@printf "\t    The program to assemble or run with processor simulation.\n"
	@printf "\t    This is a single RISC-V assembly file or C file.\n"
	@printf "\n"
	@printf "\t$bTESTS$n\n"
	@printf "\t    A list of programs to verify processor simulation with.\n"
	@printf "\t    This is only used for the 'verify' target. The variable\n"
	@printf "\t    supports glob patterns, a list when quoted, or a single\n"
	@printf "\t    program.\n"
	@printf "\n"
	@printf "\t$bSYNTH_SCRIPT$n\n"
	@printf "\t    The TCL script to use for synthesizing the processor into\n"
	@printf "\t    a design. This is only used for the 'synth' target.\n"
	@printf "\t    Defaults to $u$(SYNTH_SCRIPT)$n.\n"
	@printf "\n"
	@printf "\t$bOUTPUT$n\n"
	@printf "\t    Specifies the output directory where generated files are\n"
	@printf "\t    are placed. For simulation targets, defaults to\n"
	@printf "\t    $u$(SIM_OUTPUT)$n. For the synthesis target, defaults to\n"
	@printf "\t    $u$(SYNTH_OUTPUT)$n.\n"
	@printf "\n"
	@printf "$bExamples:$n\n"
	@printf "\tmake sim TEST=inputs/mytest.S\n"
	@printf "\tmake sim TEST=inputs/mytest.S OUTPUT=myoutput\n"
	@printf "\tmake sim-gui TEST=inputs/mytest.S\n"
	@printf "\tmake verify TESTS=inputs/mytest.S\n"
	@printf "\tmake verify TESTS=\"inputs/mytest1.S inputs/mytest2.S\"\n"
	@printf "\tmake verify TESTS=447inputs/*.S\n"
	@printf "\tmake synth\n"
	@printf "\tmake synth SYNTH_SCRIPT=myscript.dc OUTPUT=myoutput\n"
	@printf "\tmake view-timing\n"
