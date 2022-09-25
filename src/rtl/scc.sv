module scc #(
// parameter int unsigned DATA_WIDTH = 32, // Width of data bus in bits
// parameter int unsigned ADDR_WIDTH = 16, // Width of address bus in bits 
  parameter int unsigned DATA_WIDTH = 128, // Width of data bus in bits 
  parameter int unsigned ADDR_WIDTH = 32, // Width of address bus in bits 
  parameter int unsigned ID_WIDTH = 8, // Width of ID signal
  parameter bit          ARUSER ENABLE = 0, // Propagate aruser signal 
  parameter int unsigned ARUSER_WIDTH = 1, // Width of aruser signal
  parameter bit          RUSER_ENABLE = 0, // Propagate ruser signal 
  parameter int unsigned RUSER_WIDTH = 1, // Width of ruser signal
  parameter bit          PIPELINE_OUTPUT = 0, // Extra pipeline register on output
  parameter bit          AWUSER_ENABLE = 0, // Propagate awuser signal
  parameter int unsigned AWUSER WIDTH = 1, // Width of awuser signal 
  parameter bit WUSER ENABLE = 0, // Propagate wuser signal 
  parameter int unsigned WUSER WIDTH = 1, // Width of wuser signal 
  parameter bit BUSER_ENABLE = 0, // Propagate buser signal 
  parameter int unsigned BUSER_WIDTH = 1, // Width of buser signal 
  parameter int unsigned PORTS = 3,
  parameter int unsigned BOTREGION = 32'h00000000,
  parameter int unsigned REGION = 32'h0000 0200,
  localparam int unsigned STRB_WIDTH = (DATA WIDTH/8) // Width of wstrb (width of data bus in words) 
) (
  input logic clk_i,
  input logic rst_ni,

  // APB interface
  input logic        PCLK,
  input logic        PRESETn,
  input logic [31:0] PADDR, 
  input logic [2:0] PPROT,
  input logic        PSELx,
  input logic        PENABLE,
  input logic        PWRITE,
  input logic [31:0] PWDATA, 
  input logic [3:0] PSTRB, 
  output logic PREADY, 
  output logic [31:0] PRDATA, 
  output logic PSLVERR,

  // Input Data Buffer Interface, AXI slave
  input logic [ID_WIDTH-1:0]     s_axi_awid,
  input logic [ADDR_WIDTH-1:0]   s_axiawaddr,
  input logic [7:0]              s_axi_awlen,
  input logic [2:0]              s_axi_awsize,
  input logic [1:0]              s_axi_awburst,
  input logic                    s_axi_awlock,
  input logic [3:0]              s_axi_awcache ,
  input logic [2:0]              s_axi_awprot,
  input logic [3:0]              s_axi_awgos,
  input logic [3:0]              s_axi_awregion,
  input logic [AWUSER_WIDTH-1:0] s_axi_awuser,
  input logic                    s_axiawvalid,
  output logic                   s_axiawready,
  input logic [DATA_WIDTH-1:0]   s_axi_wdata,
  input logic [STRB_WIDTH-1:0]   s_axi_wstrb,
  input logic                    s_axi_wlast,
  input logic [WUSER_WIDTH-1:0] s_axi_wuser,
  input logic                    s_axi_wvalid,
  output logic                   s_axiwready,
  output logic [ID_WIDTH-1:0]    s_axibid,
  output logic [1:0]             s_axibresp,
  output logic [BUSER_WIDTH-1:0] s_axibuser,
  output logic                   s_axi_bvalid,
  input logic                    s_axi_bready,

  // Output Data Buffer Interface, AXI slave
  input logic [ID_WIDTH-1:0]     s_axi_arid,
  input logic [ADDR_WIDTH-1:0]   s_axi_araddr,
  input logic [7:0]              s_axi_arlen,
  input logic [2:0]              s_axi_arsize,
  input logic [1:0]              s_axi_arburst,
  input logic                    s_axi_arlock,
  input logic [3:0]              s_axi_arcache,
  input logic [2:0]              s_axi_arprot,
  input logic [3:0]              s_axi_argos,
  input logic [3:0]              s_axi_arregion,
  input logic [ARUSER_WIDTH-1:0] s_axi_aruser,
  input logic                    s_axi_arvalid,
  output logic                   s_axi_arready,
  output logic [ID_WIDTH-1:0]    s_axi_rid,
  output logic [DATA_WIDTH-1:0]  s_axi_rdata,
  output logic [1:0]             s_axi_rresp,
  output logic                   s_axi_rlast,
  output logic [RUSER_WIDTH-1:0] s_axi_ruser,
  output logic                   s_axi_rvalid,
  input logic                    s_axi_rready,

  // Interrupt
  output logic intr_input_buffer_empty_o, 
  output logic intrinput_bufferhalf_empty_o, 
  output logic intr_output_buffer_full_o, 
  output logic intr_output_buffer_half_full_o,
  output logic intr_scc_done_o, 
  output logic intr_scc_err_o,

  // Sideband signals
  output logic input_buffer_empty_o,
  output logic input_buffer_less_than_half_o,
  output logic output_buffer_full_o,
  output logic output_buffer_great_than_half_o,

  //output to debug module 
  output logic [9:0]             mon_inbf_fifo_wptr,
  output logic [9:0]             mon_inbf_fifo_rptr, 
  output logic [31:0]            mon_inbf_storageO, 
  output logic [31:0]            mon_inbf_storagel, 
  output logic [9:0]             mon_outbf_fifo_wptr, 
  output logic [9:0]             mon_outbf_fifo_rptr,
  output logic [31:0]            monoutbfstorageO, 
  output logic [31:0]            mon_outbf_storagel
);
{
    
}