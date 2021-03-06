/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module regfile_12 (
    input clk,
    input rst,
    input [4:0] read_address_1,
    input [4:0] read_address_2,
    output reg [15:0] read_data_1,
    output reg [15:0] read_data_2,
    input [4:0] write_address,
    input [15:0] write_data,
    input write_enable,
    input [3:0] button
  );
  
  
  
  reg [511:0] M_registers_d, M_registers_q = 1'h0;
  
  always @* begin
    M_registers_d = M_registers_q;
    
    read_data_1 = M_registers_q[(read_address_1)*16+15-:16];
    read_data_2 = M_registers_q[(read_address_2)*16+15-:16];
    if (write_address != 5'h1f && write_enable) begin
      M_registers_d[(write_address)*16+15-:16] = write_data;
    end
    if (read_address_1 == 5'h1f) begin
      read_data_1 = 16'h0000;
    end
    if (read_address_2 == 5'h1f) begin
      read_data_2 = 16'h0000;
    end
    if (button[0+0-:1]) begin
      M_registers_d[368+15-:16] = 16'hffff;
      M_registers_d[384+15-:16] = 1'h0;
    end
    if (button[1+0-:1]) begin
      M_registers_d[368+15-:16] = 1'h1;
      M_registers_d[384+15-:16] = 1'h0;
    end
    if (button[2+0-:1]) begin
      M_registers_d[368+15-:16] = 1'h0;
      M_registers_d[384+15-:16] = 16'hffff;
    end
    if (button[3+0-:1]) begin
      M_registers_d[368+15-:16] = 1'h0;
      M_registers_d[384+15-:16] = 1'h1;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_registers_q <= 1'h0;
    end else begin
      M_registers_q <= M_registers_d;
    end
  end
  
endmodule
