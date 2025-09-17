module picorv32_wrapper (
    input clk,
    input resetn,

    // Trap output: goes high if CPU halts on error
    output trap,

    // Simple memory bus
    output mem_valid,
    output mem_instr,
    input  mem_ready,
    output [31:0] mem_addr,
    output [31:0] mem_wdata,
    output [3:0]  mem_wstrb,
    input  [31:0] mem_rdata
);

    // Tie-off signals not used
    wire [31:0] irq = 32'b0;  // no external IRQs
    wire [31:0] eoi;

    // Instantiate the actual PicoRV32 core
    picorv32 #(
        .ENABLE_IRQ(0),
        .ENABLE_PCPI(0),
        .ENABLE_TRACE(0)
    ) core (
        .clk(clk),
        .resetn(resetn),
        .trap(trap),

        // Memory interface
        .mem_valid(mem_valid),
        .mem_instr(mem_instr),
        .mem_ready(mem_ready),
        .mem_addr(mem_addr),
        .mem_wdata(mem_wdata),
        .mem_wstrb(mem_wstrb),
        .mem_rdata(mem_rdata),

        // Look-ahead interface (not used)
        .mem_la_read(),
        .mem_la_write(),
        .mem_la_addr(),
        .mem_la_wdata(),
        .mem_la_wstrb(),

        // PCPI co-processor interface (disabled)
        .pcpi_valid(),
        .pcpi_insn(),
        .pcpi_rs1(),
        .pcpi_rs2(),
        .pcpi_wr(1'b0),
        .pcpi_rd(32'b0),
        .pcpi_wait(1'b0),
        .pcpi_ready(1'b0),

        // IRQ interface
        .irq(irq),
        .eoi(eoi),

        // Trace (disabled)
        .trace_valid(),
        .trace_data()
    );

endmodule

