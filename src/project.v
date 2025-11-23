`default_nettype none

module tt_um_vga_example(
   input clk,
   input ena,
   input rst_n,
  input reset,
  output reg clk_div2,
  output reg clk_div4,
  output reg clk_div8,
  output reg clk_div16,
  output reg [3:0] cnt,
  output reg clk_invert
);


  assign clk_invert = ~clk;
  // simple ripple clock divider
  
  always @(posedge clk)
    clk_div2 <= reset ? 0 : ~clk_div2;

  always @(posedge clk_div2)
    clk_div4 <= ~clk_div4;

  always @(posedge clk_div4)
    clk_div8 <= ~clk_div8;

  always @(posedge clk_div8)
    clk_div16 <= ~clk_div16;
  
  always @(posedge clk_div2)
    if (reset)
      cnt <= 0;
  else
    cnt <= cnt +1;

endmodule
