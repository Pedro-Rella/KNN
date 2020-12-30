`timescale 1ns/1ps
`include "iob_lib.vh"

module knn_core
  #(
    parameter KNN_WDATA_W = 16
    )
   (
    `INPUT(nk, 8),
    `INPUT(clk, 1),
    `INPUT(rst, 1),
    `INPUT(x, KNN_WDATA_W),
    `INPUT(y,KNN_WDATA_W),
    `INPUT(data_x, KNN_WDATA_W),
    `INPUT(data_y,KNN_WDATA_W),
    `INPUT(data_label, 8),
    `INPUT(control,3),
    `OUTPUT(Xlabel, 8)
    );
    
   
   //distance
   `SIGNAL_SIGNED(d_aux, 2*KNN_WDATA_W)
   `SIGNAL_SIGNED(dx, KNN_WDATA_W)
   `SIGNAL_SIGNED(dy, KNN_WDATA_W)
   `COMB begin
      dx=(x-data_x);
      dy=(y-data_y);
      if(control == 1) begin
      	d_aux = dx*dx+dy*dy;
      end
      else begin
        d_aux = 32'b01111111111111111111111111111111;
      end
    end  
      
    //minimum distance and label 
    
    `SIGNAL_SIGNED(min1, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min2, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min3, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min4, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min5, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min6, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min7, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min8, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min9, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min10, 2*KNN_WDATA_W)
    
    `SIGNAL_SIGNED(min2_aux, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min3_aux, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min4_aux, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min5_aux, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min6_aux, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min7_aux, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min8_aux, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min9_aux, 2*KNN_WDATA_W)
    `SIGNAL_SIGNED(min10_aux, 2*KNN_WDATA_W)
    
    `SIGNAL_SIGNED(label1, 8)
    `SIGNAL_SIGNED(label2, 8)
    `SIGNAL_SIGNED(label3, 8)
    `SIGNAL_SIGNED(label4, 8)
    `SIGNAL_SIGNED(label5, 8)
    `SIGNAL_SIGNED(label6, 8)
    `SIGNAL_SIGNED(label7, 8)
    `SIGNAL_SIGNED(label8, 8)
    `SIGNAL_SIGNED(label9, 8)
    `SIGNAL_SIGNED(label10, 8)
    
    `SIGNAL_SIGNED(min2_label, 8)
    `SIGNAL_SIGNED(min3_label, 8)
    `SIGNAL_SIGNED(min4_label, 8)
    `SIGNAL_SIGNED(min5_label, 8)
    `SIGNAL_SIGNED(min6_label, 8)
    `SIGNAL_SIGNED(min7_label, 8)
    `SIGNAL_SIGNED(min8_label, 8)
    `SIGNAL_SIGNED(min9_label, 8)
    `SIGNAL_SIGNED(min10_label, 8)
    
    `SIGNAL_SIGNED(Plabel0, 8)
    `SIGNAL_SIGNED(Plabel1, 8)
    `SIGNAL_SIGNED(Plabel2, 8)
    `SIGNAL_SIGNED(Plabel3, 8)
    `SIGNAL_SIGNED(Plabel4, 8)
    `SIGNAL_SIGNED(Plabel5, 8)
    `SIGNAL_SIGNED(Plabel6, 8)
    `SIGNAL_SIGNED(Plabel7, 8)
    `SIGNAL_SIGNED(Plabel8, 8)
    `SIGNAL_SIGNED(Plabel9, 8)
    
    `SIGNAL(en1, 1)
    `SIGNAL(en2, 1)
    `SIGNAL(en3, 1)
    `SIGNAL(en4, 1)
    `SIGNAL(en5, 1)
    `SIGNAL(en6, 1)
    `SIGNAL(en7, 1)
    `SIGNAL(en8, 1)
    `SIGNAL(en9, 1)
    `SIGNAL(en10, 1)
    
    `SIGNAL_SIGNED(labelOUTaux, 8)
    
    
    always @ (rst)
    begin
    	if(rst) begin
          en1=0;
          en2=0;
          en3=0;
          en4=0;
          en5=0;
          en6=0;
          en7=0;
          en8=0;
          en9=0;
          en10=0;
          N_label0<=0;
          N_label1<=0;
          N_label2<=0;
          N_label3<=0;
          N_label4<=0;
          N_label5<=0;
          N_label6<=0;
          N_label7<=0;
          N_label8<=0;
          N_label9<=0;
          Plabel0=0;
          Plabel1=1;
          Plabel2=2;
          Plabel3=3;
          Plabel4=4;
          Plabel5=5;
          Plabel6=6;
          Plabel7=7;
          Plabel8=8;
          Plabel9=9;
          labelOUTaux<=-1;
    	end
    	else begin
    	  N_label0<=N_label0;
          N_label1<=N_label1;
          N_label2<=N_label2;
          N_label3<=N_label3;
          N_label4<=N_label4;
          N_label5<=N_label5;
          N_label6<=N_label6;
          N_label7<=N_label7;
          N_label8<=N_label8;
          N_label9<=N_label9;
          labelOUTaux<=labelOUTaux;
    	end
    end
    
    
    //1
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en1, min1, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en1, label1, data_label)
    
    //2
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en2, min2, min2_aux)
    `REG_ARE(clk,rst, 8'b11111111, en2, label2, min2_label)
          
    //3
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en3, min3, min3_aux)
    `REG_ARE(clk,rst, 8'b11111111, en3, label3, min3_label)
  
    //4
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en4, min4, min4_aux)
    `REG_ARE(clk,rst, 8'b11111111, en4, label4, min4_label)

    //5
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en5, min5, min5_aux)
    `REG_ARE(clk,rst, 8'b11111111, en5, label5, min5_label)
    
    //6
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en6, min6, min6_aux)
    `REG_ARE(clk,rst, 8'b11111111, en6, label6, min6_label)
    
    //7
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en7, min7, min7_aux)
    `REG_ARE(clk,rst, 8'b11111111, en7, label7, min7_label)
    
    //8
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en8, min8, min8_aux)
    `REG_ARE(clk,rst, 8'b11111111, en8, label8, min8_label)
    
    //9
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en9, min9, min9_aux)
    `REG_ARE(clk,rst, 8'b11111111, en9, label9, min9_label)
    
    //10
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en10, min10, min10_aux)
    `REG_ARE(clk,rst, 8'b11111111, en10, label10, min10_label)
    
    always @* begin
    	if(d_aux<min1) begin
    	   min2_aux <= min1;
    	   min3_aux <= min2;
    	   min4_aux <= min3;
    	   min5_aux <= min4;
    	   min6_aux <= min5;
    	   min7_aux <= min6;
    	   min8_aux <= min7;
    	   min9_aux <= min8;
    	   min10_aux <= min9;
    	   min2_label <= label1;
    	   min3_label <= label2;
    	   min4_label <= label3;
    	   min5_label <= label4;
    	   min6_label <= label5;
    	   min7_label <= label6;
    	   min8_label <= label7;
    	   min9_label <= label8;
    	   min10_label <= label9;
    	   en1 = 1;
    	   en2 = 1;
    	   en3 = 1;
    	   en4 = 1;
    	   en5 = 1;
    	   en6 = 1;
    	   en7 = 1;
    	   en8 = 1;
    	   en9 = 1;
    	   en10 = 1;
    	end
    	else if(d_aux==min1) begin
    	   en1=0;
    	   en2=0;
    	   en3=0;
    	   en4=0;
    	   en5=0;
    	   en6=0;
    	   en7=0;
    	   en8=0;
    	   en9=0;
    	   en10=0;
    	end
    	else if(d_aux<min2) begin
    	   min2_aux <= d_aux;
    	   min3_aux <= min2;
    	   min4_aux <= min3;
    	   min5_aux <= min4;
    	   min6_aux <= min5;
    	   min7_aux <= min6;
    	   min8_aux <= min7;
    	   min9_aux <= min8;
    	   min10_aux <= min9;
    	   min2_label <= data_label;
    	   min3_label <= label2;
    	   min4_label <= label3;
    	   min5_label <= label4;
    	   min6_label <= label5;
    	   min7_label <= label6;
    	   min8_label <= label7;
    	   min9_label <= label8;
    	   min10_label <= label9;
    	   en1 = 0;
    	   en2 = 1;
    	   en3 = 1;
    	   en4 = 1;
    	   en5 = 1;
    	   en6 = 1;
    	   en7 = 1;
    	   en8 = 1;
    	   en9 = 1;
    	   en10 = 1;
    	end
    	else if (d_aux==min2) begin
    	   en1=0;
    	   en2=0;
    	   en3=0;
    	   en4=0;
    	   en5=0;
    	   en6=0;
    	   en7=0;
    	   en8=0;
    	   en9=0;
    	   en10=0;
    	end
    	else if (d_aux<min3) begin
    	   min2_aux <= d_aux;
    	   min3_aux <= d_aux;
    	   min4_aux <= min3;
    	   min5_aux <= min4;
    	   min6_aux <= min5;
    	   min7_aux <= min6;
    	   min8_aux <= min7;
    	   min9_aux <= min8;
    	   min10_aux <= min9;
    	   min2_label <= data_label;
    	   min3_label <= data_label;
    	   min4_label <= label3;
    	   min5_label <= label4;
    	   min6_label <= label5;
    	   min7_label <= label6;
    	   min8_label <= label7;
    	   min9_label <= label8;
    	   min10_label <= label9;
    	   en1 = 0;
    	   en2 = 0;
    	   en3 = 1;
    	   en4 = 1;
    	   en5 = 1;
    	   en6 = 1;
    	   en7 = 1;
    	   en8 = 1;
    	   en9 = 1;
    	   en10 = 1;
    	end
    	else if (d_aux==min3) begin
    	   en1=0;
    	   en2=0;
    	   en3=0;
    	   en4=0;
    	   en5=0;
    	   en6=0;
    	   en7=0;
    	   en8=0;
    	   en9=0;
    	   en10=0;
    	end
    	else if (d_aux<min4) begin
    	   min2_aux <= d_aux;
    	   min3_aux <= d_aux;
    	   min4_aux <= d_aux;
    	   min5_aux <= min4;
    	   min6_aux <= min5;
    	   min7_aux <= min6;
    	   min8_aux <= min7;
    	   min9_aux <= min8;
    	   min10_aux <= min9;
    	   min2_label <= data_label;
    	   min3_label <= data_label;
    	   min4_label <= data_label;
    	   min5_label <= label4;
    	   min6_label <= label5;
    	   min7_label <= label6;
    	   min8_label <= label7;
    	   min9_label <= label8;
    	   min10_label <= label9;
    	   en1 = 0;
    	   en2 = 0;
    	   en3 = 0;
    	   en4 = 1;
    	   en5 = 1;
    	   en6 = 1;
    	   en7 = 1;
    	   en8 = 1;
    	   en9 = 1;
    	   en10 = 1;
    	end
    	else if (d_aux==min4) begin
    	   en1=0;
    	   en2=0;
    	   en3=0;
    	   en4=0;
    	   en5=0;
    	   en6=0;
    	   en7=0;
    	   en8=0;
    	   en9=0;
    	   en10=0;
    	end
    	else if (d_aux<min5) begin
    	   min2_aux <= d_aux;
    	   min3_aux <= d_aux;
    	   min4_aux <= d_aux;
    	   min5_aux <= d_aux;
    	   min6_aux <= min5;
    	   min7_aux <= min6;
    	   min8_aux <= min7;
    	   min9_aux <= min8;
    	   min10_aux <= min9;
    	   min2_label <= data_label;
    	   min3_label <= data_label;
    	   min4_label <= data_label;
    	   min5_label <= data_label;
    	   min6_label <= label5;
    	   min7_label <= label6;
    	   min8_label <= label7;
    	   min9_label <= label8;
    	   min10_label <= label9;
    	   en1 = 0;
    	   en2 = 0;
    	   en3 = 0;
    	   en4 = 0;
    	   en5 = 1;
    	   en6 = 1;
    	   en7 = 1;
    	   en8 = 1;
    	   en9 = 1;
    	   en10 = 1;
    	end
    	else if (d_aux==min5) begin
    	   en1=0;
    	   en2=0;
    	   en3=0;
    	   en4=0;
    	   en5=0;
    	   en6=0;
    	   en7=0;
    	   en8=0;
    	   en9=0;
    	   en10=0;
    	end
    	else if (d_aux<min6) begin
    	   min2_aux <= d_aux;
    	   min3_aux <= d_aux;
    	   min4_aux <= d_aux;
    	   min5_aux <= d_aux;
    	   min6_aux <= d_aux;
    	   min7_aux <= min6;
    	   min8_aux <= min7;
    	   min9_aux <= min8;
    	   min10_aux <= min9;
    	   min2_label <= data_label;
    	   min3_label <= data_label;
    	   min4_label <= data_label;
    	   min5_label <= data_label;
    	   min6_label <= data_label;
    	   min7_label <= label6;
    	   min8_label <= label7;
    	   min9_label <= label8;
    	   min10_label <= label9;
    	   en1 = 0;
    	   en2 = 0;
    	   en3 = 0;
    	   en4 = 0;
    	   en5 = 0;
    	   en6 = 1;
    	   en7 = 1;
    	   en8 = 1;
    	   en9 = 1;
    	   en10 = 1;
    	end
    	else if (d_aux==min6) begin
    	   en1=0;
    	   en2=0;
    	   en3=0;
    	   en4=0;
    	   en5=0;
    	   en6=0;
    	   en7=0;
    	   en8=0;
    	   en9=0;
    	   en10=0;
    	end
    	else if (d_aux<min7)begin
    	   min2_aux <= d_aux;
    	   min3_aux <= d_aux;
    	   min4_aux <= d_aux;
    	   min5_aux <= d_aux;
    	   min6_aux <= d_aux;
    	   min7_aux <= d_aux;
    	   min8_aux <= min7;
    	   min9_aux <= min8;
    	   min10_aux <= min9;
    	   min2_label <= data_label;
    	   min3_label <= data_label;
    	   min4_label <= data_label;
    	   min5_label <= data_label;
    	   min6_label <= data_label;
    	   min7_label <= data_label;
    	   min8_label <= label7;
    	   min9_label <= label8;
    	   min10_label <= label9;
    	   en1 = 0;
    	   en2 = 0;
    	   en3 = 0;
    	   en4 = 0;
    	   en5 = 0;
    	   en6 = 0;
    	   en7 = 1;
    	   en8 = 1;
    	   en9 = 1;
    	   en10 = 1;
    	end
    	else if (d_aux==min7) begin
    	   en1=0;
    	   en2=0;
    	   en3=0;
    	   en4=0;
    	   en5=0; 	   
    	   en6=0;
    	   en7=0;
    	   en8=0;
    	   en9=0;
    	   en10=0;
    	end
    	else if (d_aux<min8)begin
    	   min2_aux <= d_aux;
    	   min3_aux <= d_aux;
    	   min4_aux <= d_aux;
    	   min5_aux <= d_aux;
    	   min6_aux <= d_aux;
    	   min7_aux <= d_aux;
    	   min8_aux <= d_aux;
    	   min9_aux <= min8;
    	   min10_aux <= min9;
    	   min2_label <= data_label;
    	   min3_label <= data_label;
    	   min4_label <= data_label;
    	   min5_label <= data_label;
    	   min6_label <= data_label;
    	   min7_label <= data_label;
    	   min8_label <= data_label;
    	   min9_label <= label8;
    	   min10_label <= label9;
    	   en1 = 0;
    	   en2 = 0;
    	   en3 = 0;
    	   en4 = 0;
    	   en5 = 0;
    	   en6 = 0;
    	   en7 = 0;
    	   en8 = 1;
    	   en9 = 1;
    	   en10 = 1;
    	end
    	else if (d_aux==min8) begin
    	   en1=0;
    	   en2=0;
    	   en3=0;
    	   en4=0;
    	   en5=0;
    	   en6=0;
    	   en7=0;
    	   en8=0;
    	   en9=0;
    	   en10=0;
    	end
    	else if (d_aux<min9)begin
    	   min2_aux <= d_aux;
    	   min3_aux <= d_aux;
    	   min4_aux <= d_aux;
    	   min5_aux <= d_aux;
    	   min6_aux <= d_aux;
    	   min7_aux <= d_aux;
    	   min8_aux <= d_aux;
    	   min9_aux <= d_aux;
    	   min10_aux <= min9;
    	   min2_label <= data_label;
    	   min3_label <= data_label;
    	   min4_label <= data_label;
    	   min5_label <= data_label;
    	   min6_label <= data_label;
    	   min7_label <= data_label;
    	   min8_label <= data_label;
    	   min9_label <= data_label;
    	   min10_label <= label9;
    	   en1 = 0;
    	   en2 = 0;
    	   en3 = 0;
    	   en4 = 0;
    	   en5 = 0;
    	   en6 = 0;
    	   en7 = 0;
    	   en8 = 0;
    	   en9 = 1;
    	   en10 = 1;
    	end
    	else if (d_aux==min9) begin
    	   en1=0;
    	   en2=0;
    	   en3=0;
    	   en4=0;
    	   en5=0;
    	   en6=0;
    	   en7=0;
    	   en8=0;
    	   en9=0;
    	   en10=0;
    	end
    	else if (d_aux<min10)begin
    	   min2_aux <= d_aux;
    	   min3_aux <= d_aux;
    	   min4_aux <= d_aux;
    	   min5_aux <= d_aux;
    	   min6_aux <= d_aux;
    	   min7_aux <= d_aux;
    	   min8_aux <= d_aux;
    	   min9_aux <= d_aux;
    	   min10_aux <= d_aux;
    	   min2_label <= data_label;
    	   min3_label <= data_label;
    	   min4_label <= data_label;
    	   min5_label <= data_label;
    	   min6_label <= data_label;
    	   min7_label <= data_label;
    	   min8_label <= data_label;
    	   min9_label <= data_label;
    	   min10_label <= data_label;
    	   en1 = 0;
    	   en2 = 0;
    	   en3 = 0;
    	   en4 = 0;
    	   en5 = 0;
    	   en6 = 0;
    	   en7 = 0;
    	   en8 = 0;
    	   en9 = 0;
    	   en10 = 1;
    	end
    	else if (d_aux==min10) begin
    	   en1=0;
    	   en2=0;
    	   en3=0;
    	   en4=0;
    	   en5=0;
    	   en6=0;
    	   en7=0;
    	   en8=0;
    	   en9=0;
    	   en10=0;
    	end
    end
    
    //classify
    `SIGNAL(N_label0,32)
    `SIGNAL(N_label1,32)
    `SIGNAL(N_label2,32)
    `SIGNAL(N_label3,32)
    `SIGNAL(N_label4,32)
    `SIGNAL(N_label5,32)
    `SIGNAL(N_label6,32)
    `SIGNAL(N_label7,32)
    `SIGNAL(N_label8,32)
    `SIGNAL(N_label9,32)
    
    always @* begin
    	if(control == 2) begin
    	   //increments the label of 1min without loops
    	   if(label1 == 0 & nk > 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label1 = 8'b11111111;
    	   end
    	   else if(label1 == 1 & nk > 0) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label1 = 8'b11111111;   	   
    	   end
    	   else if(label1 == 2 & nk > 0) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label1 = 8'b11111111;  	   
    	   end
    	   else if(label1 == 3 & nk > 0) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label1 = 8'b11111111;	   
    	   end
    	   else if(label1 == 4 & nk > 0) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label1 = 8'b11111111; 	   
    	   end
    	   else if(label1 == 5 & nk > 0) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label1 = 8'b11111111;   
    	   end
    	   else if(label1 == 6 & nk > 0) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label1 = 8'b11111111; 	   
    	   end
    	   else if(label1 == 7 & nk > 0) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label1 = 8'b11111111;  	   
    	   end
    	   else if(label1 == 8 & nk > 0) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label1 = 8'b11111111;  	   
    	   end
    	   else if(label1 == 9 & nk > 0) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label1 = 8'b11111111;   	   
    	   end
    	   //increments the label of 2min without loops
     	   if(label2 == 0 & nk > 1) begin
    	   	N_label0 = N_label0 + 1;
    	   	label2 = 8'b11111111;
    	   end
    	   else if(label2 == 1 & nk > 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label2 = 8'b11111111;   	   
    	   end
    	   else if(label2 == 2 & nk > 1) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label2 = 8'b11111111;  	   
    	   end
    	   else if(label2 == 3 & nk > 1) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label2 = 8'b11111111;	   
    	   end
    	   else if(label2 == 4 & nk > 1) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label2 = 8'b11111111; 	   
    	   end
    	   else if(label2 == 5 & nk > 1) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label2 = 8'b11111111;   
    	   end
    	   else if(label2 == 6 & nk > 1) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label2 = 8'b11111111; 	   
    	   end
    	   else if(label2 == 7 & nk > 1) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label2 = 8'b11111111;  	   
    	   end
    	   else if(label2 == 8 & nk > 1) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label2 = 8'b11111111;  	   
    	   end
    	   else if(label2 == 9 & nk > 1) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label2 = 8'b11111111;   	   
    	   end
    	   //increments the label of 3min without loops
     	   if(label3 == 0 & nk > 2) begin
    	   	N_label0 = N_label0 + 1;
    	   	label3 = 8'b11111111;
    	   end
    	   else if(label3 == 1 & nk > 2) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label3 = 8'b11111111;   	   
    	   end
    	   else if(label3 == 2 & nk > 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label3 = 8'b11111111;  	   
    	   end
    	   else if(label3 == 3 & nk > 2) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label3 = 8'b11111111;	   
    	   end
    	   else if(label3 == 4 & nk > 2) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label3 = 8'b11111111; 	   
    	   end
    	   else if(label3 == 5 & nk > 2) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label3 = 8'b11111111;   
    	   end
    	   else if(label3 == 6 & nk > 2) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label3 = 8'b11111111; 	   
    	   end
    	   else if(label3 == 7 & nk > 2) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label3 = 8'b11111111;  	   
    	   end
    	   else if(label3 == 8 & nk > 2) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label3 = 8'b11111111;  	   
    	   end
    	   else if(label3 == 9 & nk > 2) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label3 = 8'b11111111;   	   
    	   end
    	   //increments the label of 4min without loops
     	   if(label4 == 0 & nk > 3) begin
    	   	N_label0 = N_label0 + 1;
    	   	label4 = 8'b11111111;
    	   end
    	   else if(label4 == 1 & nk > 3) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label4 = 8'b11111111;   	   
    	   end
    	   else if(label4 == 2 & nk > 3) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label4 = 8'b11111111;  	   
    	   end
    	   else if(label4 == 3 & nk > 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label4 = 8'b11111111;	   
    	   end
    	   else if(label4 == 4 & nk > 3) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label4 = 8'b11111111; 	   
    	   end
    	   else if(label4 == 5 & nk > 3) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label4 = 8'b11111111;   
    	   end
    	   else if(label4 == 6 & nk > 3) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label4 = 8'b11111111; 	   
    	   end
    	   else if(label4 == 7 & nk > 3) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label4 = 8'b11111111;  	   
    	   end
    	   else if(label4 == 8 & nk > 3) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label4 = 8'b11111111;  	   
    	   end
    	   else if(label4 == 9 & nk > 3) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label4 = 8'b11111111;   	   
    	   end
    	   //increments the label of 5min without loops
     	   if(label5 == 0 & nk > 4) begin
    	   	N_label0 = N_label0 + 1;
    	   	label5 = 8'b11111111;
    	   end
    	   else if(label5 == 1 & nk > 4) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label5 = 8'b11111111;   	   
    	   end
    	   else if(label5 == 2 & nk > 4) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label5 = 8'b11111111;  	   
    	   end
    	   else if(label5 == 3 & nk > 4) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label5 = 8'b11111111;	   
    	   end
    	   else if(label5 == 4 & nk > 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label5 = 8'b11111111; 	   
    	   end
    	   else if(label5 == 5 & nk > 4) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label5 = 8'b11111111;   
    	   end
    	   else if(label5 == 6 & nk > 4) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label5 = 8'b11111111; 	   
    	   end
    	   else if(label5 == 7 & nk > 4) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label5 = 8'b11111111;  	   
    	   end
    	   else if(label5 == 8 & nk > 4) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label5 = 8'b11111111;  	   
    	   end
    	   else if(label5 == 9 & nk > 4) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label5 = 8'b11111111;   	   
    	   end
    	   //increments the label of 6min without loops
     	   if(label6 == 0 & nk > 5) begin
    	   	N_label0 = N_label0 + 1;
    	   	label6 = 8'b11111111;
    	   end
    	   else if(label6 == 1 & nk > 5) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label6 = 8'b11111111;   	   
    	   end
    	   else if(label6 == 2 & nk > 5) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label6 = 8'b11111111;  	   
    	   end
    	   else if(label6 == 3 & nk > 5) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label6 = 8'b11111111;	   
    	   end
    	   else if(label6 == 4 & nk > 5) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label6 = 8'b11111111; 	   
    	   end
    	   else if(label6 == 5 & nk > 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label6 = 8'b11111111;   
    	   end
    	   else if(label6 == 6 & nk > 5) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label6 = 8'b11111111; 	   
    	   end
    	   else if(label6 == 7 & nk > 5) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label6 = 8'b11111111;  	   
    	   end
    	   else if(label6 == 8 & nk > 5) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label6 = 8'b11111111;  	   
    	   end
    	   else if(label6 == 9 & nk > 5) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label6 = 8'b11111111;   	   
    	   end
    	   //increments the label of 7min without loops
     	   if(label7 == 0 & nk > 6) begin
    	   	N_label0 = N_label0 + 1;
    	   	label7 = 8'b11111111;
    	   end
    	   else if(label7 == 1 & nk > 6) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label7 = 8'b11111111;   	   
    	   end
    	   else if(label7 == 2 & nk > 6) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label7 = 8'b11111111;  	   
    	   end
    	   else if(label7 == 3 & nk > 6) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label7 = 8'b11111111;	   
    	   end
    	   else if(label7 == 4 & nk > 6) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label7 = 8'b11111111; 	   
    	   end
    	   else if(label7 == 5 & nk > 6) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label7 = 8'b11111111;   
    	   end
    	   else if(label7 == 6 & nk > 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label7 = 8'b11111111; 	   
    	   end
    	   else if(label7 == 7 & nk > 6) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label7 = 8'b11111111;  	   
    	   end
    	   else if(label7 == 8 & nk < Plabel8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label7 = 8'b11111111;  	   
    	   end
    	   else if(label7 == 9 & nk > 6) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label7 = 8'b11111111;   	   
    	   end
    	   //increments the label of 8min without loops
     	   if(label8 == 0 & nk > 7) begin
    	   	N_label0 = N_label0 + 1;
    	   	label8 = 8'b11111111;
    	   end
    	   else if(label8 == 1 & nk > 7) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label8 = 8'b11111111;   	   
    	   end
    	   else if(label8 == 2 & nk > 7) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label8 = 8'b11111111;  	   
    	   end
    	   else if(label8 == 3 & nk > 7) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label8 = 8'b11111111;	   
    	   end
    	   else if(label8 == 4 & nk > 7) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label8 = 8'b11111111; 	   
    	   end
    	   else if(label8 == 5 & nk > 7) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label8 = 8'b11111111;   
    	   end
    	   else if(label8 == 6 & nk < Plabel6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label8 = 8'b11111111; 	   
    	   end
    	   else if(label8 == 7 & nk > 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label8 = 8'b11111111;  	   
    	   end
    	   else if(label8 == 8 & nk > 7) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label8 = 8'b11111111;  	   
    	   end
    	   else if(label8 == 9 & nk > 7) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label8 = 8'b11111111;   	   
    	   end
    	   //increments the label of 9min without loops
     	   if(label9 == 0 & nk > 8) begin
    	   	N_label0 = N_label0 + 1;
    	   	label9 = 8'b11111111;
    	   end
    	   else if(label9 == 1 & nk > 8) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label9 = 8'b11111111;   	   
    	   end
    	   else if(label9 == 2 & nk > 8) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label9 = 8'b11111111;  	   
    	   end
    	   else if(label9 == 3 & nk > 8) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label9 = 8'b11111111;	   
    	   end
    	   else if(label9 == 4 & nk > 8) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label9 = 8'b11111111; 	   
    	   end
    	   else if(label9 == 5 & nk > 8) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label9 = 8'b11111111;   
    	   end
    	   else if(label9 == 6 & nk > 8) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label9 = 8'b11111111; 	   
    	   end
    	   else if(label9 == 7 & nk > 8) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label9 = 8'b11111111;  	   
    	   end
    	   else if(label9 == 8 & nk > 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label9 = 8'b11111111;  	   
    	   end
    	   else if(label9 == 9 & nk > 8) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label9 = 8'b11111111;   	   
    	   end
    	   //increments the label of 10min without loops
     	   if(label10 == 0 & nk > 9) begin
    	   	N_label0 = N_label0 + 1;
    	   	label10 = 8'b11111111;
    	   end
    	   else if(label10 == 1 & nk > 9) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label10 = 8'b11111111;   	   
    	   end
    	   else if(label10 == 2 & nk > 9) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label10 = 8'b11111111;  	   
    	   end
    	   else if(label10 == 3 & nk > 9) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label10 = 8'b11111111;	   
    	   end
    	   else if(label10 == 4 & nk > 9) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label10 = 8'b11111111; 	   
    	   end
    	   else if(label10 == 5 & nk > 9) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label10 = 8'b11111111;   
    	   end
    	   else if(label10 == 6 & nk > 9) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label10 = 8'b11111111; 	   
    	   end
    	   else if(label10 == 7 & nk > 9) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label10 = 8'b11111111;  	   
    	   end
    	   else if(label10 == 8 & nk > 9) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label10 = 8'b11111111;  	   
    	   end
    	   else if(label10 == 9 & nk > 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label10 = 8'b11111111;   	   
    	   end
    	   
    	   //compares N_labels to find point label no loops
    	   if(N_label0 >= N_label1 & N_label0 >= N_label2 & N_label0 >= N_label3 & N_label0 >= N_label4 & N_label0 >= N_label5 & N_label0 >= N_label6 & N_label0 >= N_label7 & N_label0 >= N_label8 & N_label0 >= N_label9) begin
    	     labelOUTaux <= Plabel0;
    	   end
    	   else if(N_label1 >= N_label0 & N_label1 >= N_label2 & N_label1 >= N_label3 & N_label1 >= N_label4 & N_label1 >= N_label5 & N_label1 >= N_label6 & N_label1 >= N_label7 & N_label1 >= N_label8 & N_label1 >= N_label9) begin
    	     labelOUTaux <= Plabel1;
    	   end
    	   else if(N_label2 >= N_label0 & N_label2 >= N_label1 & N_label2 >= N_label3 & N_label2 >= N_label4 & N_label2 >= N_label5 & N_label2 >= N_label6 & N_label2 >= N_label7 & N_label2 >= N_label8 & N_label2 >= N_label9) begin
    	     labelOUTaux <= Plabel2;
    	   end
    	   else if(N_label3 >= N_label0 & N_label3 >= N_label1 & N_label3 >= N_label2 & N_label3 >= N_label4 & N_label3 >= N_label5 & N_label3 >= N_label6 & N_label3 >= N_label7 & N_label3 >= N_label8 & N_label3 >= N_label9) begin
    	     labelOUTaux <= Plabel3;
    	   end
    	   else if(N_label4 >= N_label0 & N_label4 >= N_label1 & N_label4 >= N_label2 & N_label4 >= N_label3 & N_label4 >= N_label5 & N_label4 >= N_label6 & N_label4 >= N_label7 & N_label4 >= N_label8 & N_label4 >= N_label9) begin
    	     labelOUTaux <= Plabel4;
    	   end
    	   else if(N_label5 >= N_label0 & N_label5 >= N_label1 & N_label5 >= N_label2 & N_label5 >= N_label3 & N_label5 >= N_label4 & N_label5 >= N_label6 & N_label5 >= N_label7 & N_label5 >= N_label8 & N_label5 >= N_label9) begin
    	     labelOUTaux <= Plabel5;
    	   end
    	   else if(N_label6 >= N_label0 & N_label6 >= N_label1 & N_label6 >= N_label2 & N_label6 >= N_label3 & N_label6 >= N_label4 & N_label6 >= N_label5 & N_label6 >= N_label7 & N_label6 >= N_label8 & N_label6 >= N_label9) begin
    	     labelOUTaux <= Plabel6;
    	   end
    	   else if(N_label7 >= N_label0 & N_label7 >= N_label1 & N_label7 >= N_label2 & N_label7 >= N_label3 & N_label7 >= N_label4 & N_label7 >= N_label5 & N_label7 >= N_label6 & N_label7 >= N_label8 & N_label7 >= N_label9) begin
    	     labelOUTaux <= Plabel7;
    	   end
    	   else if(N_label8 >= N_label0 & N_label8 >= N_label1 & N_label8 >= N_label2 & N_label8 >= N_label3 & N_label8 >= N_label4 & N_label8 >= N_label5 & N_label8 >= N_label6 & N_label8 >= N_label7 & N_label8 >= N_label9) begin
    	     labelOUTaux <= Plabel8;
    	   end
    	   else if(N_label9 >= N_label0 & N_label9 >= N_label1 & N_label9 >= N_label2 & N_label9 >= N_label3 & N_label9 >= N_label4 & N_label9 >= N_label5 & N_label9 >= N_label6 & N_label9 >= N_label7 & N_label9 >= N_label8) begin
    	     labelOUTaux <= Plabel9;
    	   end
    	end
    end
    `SIGNAL2OUT(Xlabel,labelOUTaux)
    
endmodule

