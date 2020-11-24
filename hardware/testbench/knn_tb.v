`timescale 1ns/1ps
`include "iob_lib.vh"
`include "interconnect.vh"

module knn_tb;

   localparam PER=10;
   
   `CLOCK(clk, PER)
   `RESET(rst, 7, 10)

   `SIGNAL(KNN_ENABLE, 1)
   `SIGNAL(X1, `DATA_W)
   `SIGNAL(X2, `DATA_W)
   `SIGNAL(Y1, `DATA_W)
   `SIGNAL(Y2, `DATA_W)
   `SIGNAL_OUT(D2, 2*`DATA_W)
   
   initial begin
`ifdef VCD
      $dumpfile("knn.vcd");
      $dumpvars();
`endif
      KNN_ENABLE = 0;
      X1 = 4'b0010;
      X2 = 4'b0100;
      Y1 = 1'b0;
      Y2 = 1'b0;

      @(posedge rst);
      @(negedge rst);
      @(posedge clk) #1 KNN_ENABLE = 1;
      @(posedge clk) #1 KNN_ENABLE = 0;

      //uncomment to fail the test 
      //@(posedge clk) #1;
      
      $write("square distance between (%d,%d) and (%d,%d) = %d\n", X1, Y1, X2, Y2, D2);

      $finish;
   end
   
   //instantiate knn core
   knn_core knn0
     (
      .KNN_ENABLE(KNN_ENABLE),
      .clk(clk),
      .rst(rst),
      .x1(X1),
      .y1(Y1),
      .x2(X2),
      .y2(Y2),
      .d2(D2)
      );   

endmodule
