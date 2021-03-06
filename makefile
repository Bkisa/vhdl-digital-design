# description:
#   add ghdl to your PATH for simulation
#   add gtkwave to your PATH for displaying waveform
#   run with make simulate ARCHNAME=tb_xxx STOPTIME=1us

CC = ghdl
SIM = gtkwave
WORKDIR = debug
QUIET = @

ARCHNAME?= tb_addsub4
STOPTIME?= 100us

# analyze these two first since some other circuits depend on these
VHDL_SOURCES += rtl/half_adder.vhd
VHDL_SOURCES += rtl/full_adder.vhd
VHDL_SOURCES += rtl/adder4.vhd
VHDL_SOURCES += rtl/addsub4.vhd
# add rest of the files in rtl directory for analyzing
#VHDL_SOURCES += $(wildcard rtl/*.vhd)
#SRCS += $(wildcard impl/*.vhd)

TBS = $(wildcard tb/tb_*.vhd)
TB = tb/$(ARCHNAME).vhd

CFLAGS += --std=08 # enable ieee 2008 standard
CFLAGS += --warn-binding
CFLAGS += --warn-no-library # turn off warning on design replace with same name

.PHONY: all
all: check analyze
	@echo ">>> completed..."

.PHONY: check
check:
	@echo ">>> check syntax on all designs..."
	$(QUIET)$(CC) -s $(CFLAGS) $(VHDL_SOURCES) $(TBS)

.PHONY: analyze
analyze:
	@echo ">>> analyzing designs..."
	$(QUIET)mkdir -p $(WORKDIR)
	$(QUIET)$(CC) -a $(CFLAGS) --workdir=$(WORKDIR) $(VHDL_SOURCES) $(TBS)

.PHONY: simulate
simulate: clean analyze
	@echo ">>> simulating design:" $(TB)
	$(QUIET)$(CC) --elab-run $(CFLAGS) --workdir=$(WORKDIR) \
		$(ARCHNAME) \
		--vcd=$(WORKDIR)/$(ARCHNAME).vcd --stop-time=$(STOPTIME)
	@echo ">>> showing waveform for:" $(TB)
	$(QUIET)$(SIM) $(WORKDIR)/$(ARCHNAME).vcd

.PHONY: clean
clean:
	@echo ">>> cleaning design..."
	$(QUIET)ghdl --remove --workdir=$(WORKDIR)
	$(QUIET)rm -f $(WORKDIR)/*
	$(QUIET)rm -rf $(WORKDIR)
	@echo ">>> done..."