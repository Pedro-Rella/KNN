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

   `SIGNAL(CONTROL_BITS, 3)
   `SIGNAL(KNN_RESET, 1)

   //
   //BLOCK KNN
   //
   
   knn_core knn0
     (
      .nk(NK),
      .clk(clk),
      .rst(KNN_RESET),
      .x(XX),
      .y(YY),
      .data_x(DATA_X),
      .data_y(DATA_Y),
      .data_label(DATA_LABEL),
      .control(CONTROL_BITS),
      .Xlabel(XLABEL)
      );   
   
   //ready signal   
   `SIGNAL(ready_int, 1)
   `REG_AR(clk, rst, 0, ready_int, valid)

   `SIGNAL2OUT(ready, ready_int)

   `COMB begin
      CONTROL_BITS = CONTROL[3:1];
      KNN_RESET = CONTROL[0:0];  
   end
      
endmodule

