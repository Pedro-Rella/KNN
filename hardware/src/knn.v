`timescale 1ns/1ps
`include "iob_lib.vh"

module knn_core
  #(
    parameter KNN_WDATA_W = 32
    )
   (
    `INPUT(KNN_ENABLE, 1),
    `INPUT(clk, 1),
    `INPUT(rst, 1),
    `INPUT(x1, KNN_WDATA_W),
    `INPUT(y1,KNN_WDATA_W),
    `INPUT(x2, KNN_WDATA_W),
    `INPUT(y2,KNN_WDATA_W),
    `OUTPUT(d2, 2*KNN_WDATA_W)
    );
   
   
   `SIGNAL_SIGNED(d_aux, 2*KNN_WDATA_W)
   `SIGNAL_SIGNED(dx, KNN_WDATA_W)
   `SIGNAL_SIGNED(dy, KNN_WDATA_W)
   `COMB begin
      dx=(x1-x2);
      dy=(y1-y2);
      d_aux = dx*dx+dy*dy;
      end
   `SIGNAL2OUT(d2, d_aux)
      
endmodule

