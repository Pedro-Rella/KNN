`timescale 1ns/1ps
`include "iob_lib.vh"

module knn_core
  #(
    parameter DATA_W = 32
    )
   (
    `INPUT(KNN_ENABLE, 1),    
    `INPUT(clk, 1),
    `INPUT(rst, 1),
    `INPUT(x1, DATA_W),
    `INPUT(y1,DATA_W),
    `INPUT(x2, DATA_W),
    `INPUT(y2,DATA_W),
    `OUTPUT(d2, 2*DATA_W)
    );
   
   `SIGNAL(d_aux, 2*DATA_W)
   `COMB d_aux = (x1-x2)*(x1-x2)+(y1-y2)*(y1-y2);
   `SIGNAL2OUT(d2, d_aux)
      
endmodule

