/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_11 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [16-1:0] M_adder__out;
  wire [1-1:0] M_adder__z;
  wire [1-1:0] M_adder__v;
  wire [1-1:0] M_adder__n;
  reg [6-1:0] M_adder__alufn;
  reg [16-1:0] M_adder__a;
  reg [16-1:0] M_adder__b;
  adder_14 adder_ (
    .alufn(M_adder__alufn),
    .a(M_adder__a),
    .b(M_adder__b),
    .out(M_adder__out),
    .z(M_adder__z),
    .v(M_adder__v),
    .n(M_adder__n)
  );
  
  wire [16-1:0] M_boolean__s;
  reg [16-1:0] M_boolean__a;
  reg [16-1:0] M_boolean__b;
  reg [6-1:0] M_boolean__alufn;
  boolean_15 boolean_ (
    .a(M_boolean__a),
    .b(M_boolean__b),
    .alufn(M_boolean__alufn),
    .s(M_boolean__s)
  );
  
  wire [16-1:0] M_shifter__s;
  reg [6-1:0] M_shifter__alufn;
  reg [16-1:0] M_shifter__a;
  reg [16-1:0] M_shifter__b;
  shifter_16 shifter_ (
    .alufn(M_shifter__alufn),
    .a(M_shifter__a),
    .b(M_shifter__b),
    .s(M_shifter__s)
  );
  
  wire [16-1:0] M_compare__s;
  reg [1-1:0] M_compare__z;
  reg [1-1:0] M_compare__v;
  reg [1-1:0] M_compare__n;
  reg [6-1:0] M_compare__alufn;
  compare_17 compare_ (
    .z(M_compare__z),
    .v(M_compare__v),
    .n(M_compare__n),
    .alufn(M_compare__alufn),
    .s(M_compare__s)
  );
  
  reg xz;
  reg xv;
  reg xn;
  
  always @* begin
    M_adder__alufn = alufn;
    M_adder__a = a;
    M_adder__b = b;
    xz = M_adder__z;
    xv = M_adder__v;
    xn = M_adder__n;
    z = xz;
    v = xv;
    n = xn;
    M_compare__alufn = alufn;
    M_compare__z = xz;
    M_compare__v = xv;
    M_compare__n = xn;
    M_boolean__alufn = alufn;
    M_boolean__a = a;
    M_boolean__b = b;
    M_shifter__alufn = alufn;
    M_shifter__a = a;
    M_shifter__b = b;
    
    case (alufn[4+1-:2])
      2'h0: begin
        out = M_adder__out;
      end
      2'h1: begin
        out = M_boolean__s;
      end
      2'h2: begin
        out = M_shifter__s;
      end
      2'h3: begin
        out = M_compare__s;
      end
      default: begin
        out = 16'h0000;
      end
    endcase
  end
endmodule
