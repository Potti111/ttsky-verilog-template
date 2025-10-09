
  module tt_um_vga_example(
  input clk,
  input reset,
  output reg clk_div2,
  output reg clk_div4,
  output reg clk_div8,
  output reg clk_div16,
     input  wire       ena,     // always 1 when the design is powered, so you can ignore it
    
  input  wire       rst_n     // reset_n - low to reset
);

  // simple ripple clock divider
  
  always @(posedge clk)
    clk_div2 <= reset ? 0 : ~clk_div2;

  always @(posedge clk_div2)
    clk_div4 <= ~clk_div4;

  always @(posedge clk_div4)
    clk_div8 <= ~clk_div8;

  always @(posedge clk_div8)
    clk_div16 <= ~clk_div16;

endmodule
