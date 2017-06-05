// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.1
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ==============================================================


`timescale 1 ns / 1 ps

module ip_handler_length_check_wordBuffer_Array_keep_V_core (
    clk,
    ce,
    din,
    addr,
    dout);

parameter DATA_WIDTH = 32'd8;
parameter ADDR_WIDTH = 32'd1;
parameter DEPTH = 32'd2;

input clk;
input ce;
input [DATA_WIDTH-1:0] din;
input [ADDR_WIDTH-1:0] addr;
output [DATA_WIDTH-1:0] dout;


reg[DATA_WIDTH-1:0] ShiftRegMem[0:DEPTH-1];
integer i;

initial
begin
    for(i=0;i<DEPTH;i=i+1)
        ShiftRegMem[i] <= {DATA_WIDTH{1'b0}};
end

always @ (posedge clk)
begin
    if (ce)
    begin
        for(i=0;i<DEPTH-1;i=i+1)
            ShiftRegMem[i+1] <= ShiftRegMem[i];
        ShiftRegMem[0] <= din;
    end
end

assign dout = ShiftRegMem[addr];

endmodule

module ip_handler_length_check_wordBuffer_Array_keep_V (
    clk,
    reset,
    address0,
    ce0,
    we0,
    d0,
    q0);

parameter DataWidth = 32'd8;
parameter AddressRange = 32'd2;
parameter AddressWidth = 32'd1;

input clk;
input reset;
input [AddressWidth-1:0] address0;
input ce0;
input we0;
input [DataWidth-1:0] d0;
output [DataWidth-1:0] q0;

ip_handler_length_check_wordBuffer_Array_keep_V_core #(
    .DATA_WIDTH( DataWidth ),
    .ADDR_WIDTH( AddressWidth ),
    .DEPTH( AddressRange ))
ip_handler_length_check_wordBuffer_Array_keep_V_core_U(
    .clk(clk),
    .ce(we0),
    .din(d0),
    .addr(address0),
    .dout(q0)
);

endmodule