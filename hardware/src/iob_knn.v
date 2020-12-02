`timescale 1ns/1ps
`include "iob_lib.vh"
`include "interconnect.vh"
`include "iob_knn.vh"

module iob_knn 
  #(
    parameter ADDR_W = `KNN_ADDR_W, //NODOC Address width
    parameter DATA_W = `DATA_W, //NODOC Data word width
    parameter WDATA_W = `KNN_WDATA_W //NODOC Data word width on writes
    )
   (
`include "cpu_nat_s_if.v"
`include "gen_if.v"
    );

//BLOCK Register File & Configuration, control and status registers accessible by the sofware
`include "KNNsw_reg.v"
`include "KNNsw_reg_gen.v"

    //combined hard/soft reset 
   `SIGNAL(rst_int, 1)
   `COMB rst_int = rst | KNN_RESET;

   //write signal
   `SIGNAL(write, 1) 
   `COMB write = | wstrb;


  // `SIGNAL_OUT(D2, 2*WDATA_W)
   //
   //BLOCK KNN
   //
   knn_core knn0
     (
      .KNN_ENABLE(KNN_ENABLE),
      .clk(clk),
      .rst(KNN_RESET),
      .x1(X1),
      .y1(Y1),
      .x2(X2),
      .y2(Y2),
      .d2(D2)
      );   
   
   
   //ready signal   
   `SIGNAL(ready_int, 1)
   `REG_AR(clk, rst, 0, ready_int, valid)

   `SIGNAL2OUT(ready, ready_int)

   //rdata signal
  // `COMB begin
  //    D2_LOW = D2[WDATA_W-1:0];
  //    D2_HIGH = D2[2*WDATA_W-1:WDATA_W];   
  // end
      
endmodule

