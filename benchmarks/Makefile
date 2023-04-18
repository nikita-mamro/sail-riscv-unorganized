#=======================================================================
# UCB VLSI FLOW: Makefile for riscv-bmarks
#-----------------------------------------------------------------------
# Yunsup Lee (yunsup@cs.berkeley.edu)
#

XLEN ?= 64

default: all

src_dir = .
out_dir = $(src_dir)/_out
sail_sim_dir = $(src_dir)./c_emulator

bmarks = \
	sum \

#--------------------------------------------------------------------
RISCV_PREFIX = riscv$(XLEN)-unknown-elf-
#RISCV_PREFIX ?= riscv$(XLEN)-linux-gnu-
RISCV_GCC = $(RISCV_PREFIX)gcc
#RISCV_GCC ?= $(RISCV_PREFIX)gcc-12
RISCV_GCC_OPTS ?= -DPREALLOCATE=1 -mcmodel=medany \
-g \
-static -std=gnu99 -O2 -ffast-math -fno-common \
-fno-builtin-printf -fno-tree-loop-distribute-patterns\
-mabi=lp64d -march=rv64imd \
-save-temps\
-Xlinker -Map=output.map 

RISCV_LINK_OPTS ?= -static -nostdlib -nostartfiles -Wl,-T,$(src_dir)/common/test.ld -lm -lgcc

SPIKE_RISCV_SIM ?= spike
SPIKE_RISCV_SIM_OPTS ?=

QEMU_RISCV_SIM ?= qemu-riscv64
QEMU_RISCV_SIM_OPTS ?=

# TODO: fix paths
SAIL_RISCV_SIM ?= $(sail_sim_dir)/riscv_sim_RV$(XLEN)
SAIL_RISCV_SIM_OPTS ?=

#incs  += -I$(src_dir)/../env -I$(src_dir)/common $(addprefix -I$(src_dir)/, $(bmarks))
#(wildcard $(src_dir)/common/*.c) ./_out/syscalls.S  $(wildcard $(src_dir)/$(1)/*.c)
#define compile_template
#$(1).elf: $(wildcard $(src_dir)/$(1)/*) $(wildcard $(src_dir)/common/*)
#	$$(RISCV_GCC) $$(incs) $$(RISCV_GCC_OPTS) -fno-stack-protector -o $(out_dir)/$$@ $(wildcard $(src_dir)/common/*.S) $$(RISCV_LINK_OPTS)  ./_out/syscalls.S
#endef

incs  += -I$(src_dir)/../env -I$(src_dir)/common $(addprefix -I$(src_dir)/, $(bmarks))
objs  :=


# -save-temps=obj
define compile_template
$(1).elf: $(wildcard $(src_dir)/$(1)/*) $(wildcard $(src_dir)/common/*)
	$$(RISCV_GCC) $$(incs) $$(RISCV_GCC_OPTS) -fno-stack-protector  -o $(out_dir)/$$@ $(wildcard $(src_dir)/$(1)/*.c) $(wildcard $(src_dir)/common/*.c) $(wildcard $(src_dir)/common/*.S) $$(RISCV_LINK_OPTS)
endef


$(foreach bmark,$(bmarks),$(eval $(call compile_template,$(bmark))))

bmarks_riscv_elf  = $(addsuffix .elf,  $(bmarks))

elf: $(bmarks_riscv_elf)

sail: elf
	$(foreach elf, $(out_dir)/$(bmarks_riscv_elf), $(SAIL_RISCV_SIM) $(SAIL_RISCV_SIM_OPTS) -V $(elf);)

sail_v: elf
	$(foreach elf, $(out_dir)/$(bmarks_riscv_elf), $(SAIL_RISCV_SIM) $(SAIL_RISCV_SIM_OPTS) $(elf);)

spike: elf
	$(foreach file, $(out_dir)/$(bmarks_riscv_elf), $(SPIKE_RISCV_SIM) $(SPIKE_RISCV_SIM_OPTS) $(file);)

qemu: elf
	$(foreach file, $(out_dir)/$(bmarks_riscv_elf), $(QEMU_RISCV_SIM) $(QEMU_RISCV_SIM_OPTS) $(file);)

host: elf
	$(foreach file, $(out_dir)/$(bmarks_riscv_elf), $(file);)

all: elf

junk += $(out_dir)/$(bmarks_riscv_elf)

clean:
	rm -rf $(junk)
