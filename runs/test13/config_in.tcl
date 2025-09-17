set ::env(DESIGN_NAME) picorv32_wrapper

# Point to both source files explicitly (not just glob, to avoid surprises)
set ::env(VERILOG_FILES) "\
    $::env(DESIGN_DIR)/src/picorv32.v \
    $::env(DESIGN_DIR)/src/picorv32_wrapper.v"

