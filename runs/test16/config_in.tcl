# ================================
# Design and Sources
# ================================
set ::env(DESIGN_NAME) picorv32_wrapper

# Point to your RTL files (wrapper + core)
set ::env(VERILOG_FILES) "\
    $::env(DESIGN_DIR)/src/picorv32.v \
    $::env(DESIGN_DIR)/src/picorv32_wrapper.v"

# ================================
# Clock Constraints
# ================================
# The clock input port in your wrapper (change if different)
set ::env(CLOCK_PORT) "clk"

# Clock period in ns (20ns = 50 MHz target)
set ::env(CLOCK_PERIOD) "20.0"

# ================================
# Floorplan / Area Settings
# ================================
# Target utilization (lower → bigger area, easier placement)
set ::env(FP_CORE_UTIL) 30

# Large die/core area (adjust later when working)
set ::env(DIE_AREA)  "0 0 2000 2000"
set ::env(CORE_AREA) "10 10 1990 1990"

# ================================
# Synthesis Options
# ================================
# Relax synthesis to make it easier to place
set ::env(SYNTH_STRATEGY) "AREA 3"
set ::env(SYNTH_READ_BLACKBOX_LIB) 1

# Reduce max fanout to limit buffer explosion
set ::env(SYNTH_MAX_FANOUT) 6

# ================================
# Routing / DRC (safe defaults)
# ================================
set ::env(PL_BASIC_PLACEMENT) 1
set ::env(RUN_CVC) 0

# Allow router to use more layers (Sky130 default is 5 metal layers, keep it)
set ::env(GLB_RT_ALLOW_CONGESTION) 1

# Make resizer less aggressive
set ::env(PL_RESIZER_MAX_SLEW_MARGIN) 30
set ::env(PL_RESIZER_MAX_CAP_MARGIN) 30
set ::env(PL_RESIZER_MAX_WIRE_MARGIN) 30

