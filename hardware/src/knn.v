`timescale 1ns/1ps
`include "iob_lib.vh"

module knn_core
  #(
    parameter KNN_WDATA_W = 16
    )
   (
    `INPUT(KNN_ENABLE, 1),
    `INPUT(clk, 1),
    `INPUT(rst, 1),
    `INPUT(x, KNN_WDATA_W),
    `INPUT(y,KNN_WDATA_W),
    `INPUT(data_x, KNN_WDATA_W),
    `INPUT(data_y,KNN_WDATA_W),
    `INPUT(data_label, 8),
    `INPUT(Nlabels, 8), 
    `INPUT(classify,1),
    `INPUT(d_ready, 1),
    `OUTPUT(Xlabel, 8),
    `OUTPUT(distance, KNN_WDATA_W)
   // `OUTPUT(DONE, 1)
    );
   
   //distance
   `SIGNAL_SIGNED(d_aux, 2*KNN_WDATA_W)
   `SIGNAL_SIGNED(dx, KNN_WDATA_W)
   `SIGNAL_SIGNED(dy, KNN_WDATA_W)
   `COMB begin
      dx=(x-data_x);
      dy=(y-data_y);
      if(d_ready) begin
      	d_aux = dx*dx+dy*dy;
      end
      else begin
        d_aux = 32'b01111111111111111111111111111111;
      end
    end
    `SIGNAL2OUT(distance, x)
    
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
    
    always @* begin
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
          N_label0=0;
          N_label1=0;
          N_label2=0;
          N_label3=0;
          N_label4=0;
          N_label5=0;
          N_label6=0;
          N_label7=0;
          N_label8=0;
          N_label9=0;
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
          labelOUTaux=20;
    	end
    end
    
    //1
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en1, min1, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en1, label1, data_label)
    
    //2
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en2, min2, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en2, label2, data_label)
          
    //3
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en3, min3, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en3, label3, data_label)
  
    //4
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en4, min4, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en4, label4, data_label)

    //5
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en5, min5, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en5, label5, data_label)
    
    //6
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en6, min6, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en6, label6, data_label)
    
    //7
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en7, min7, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en7, label7, data_label)
    
    //8
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en8, min8, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en8, label8, data_label)
    
    //9
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en9, min9, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en9, label9, data_label)
    
    //10
    `REG_ARE(clk,rst, 32'b01111111111111111111111111111111, en10, min10, d_aux)
    `REG_ARE(clk,rst, 8'b11111111, en10, label10, data_label)
    
    always @* begin
    	if(d_aux<min1) begin
    	   en1 =1;
    	end
    	else if(d_aux==min1) begin
    	   en1=0;
    	end
    	else if(d_aux<min2) begin
    	   en2=1;
    	end
    	else if (d_aux==min2) begin
    	   en2=0;
    	end
    	else if(d_aux<min3) begin
    	   en3=1;
    	end
    	else if (d_aux==min3) begin
    	   en3=0;
    	end
    	else if(d_aux<min4) begin
    	   en4=1;
    	end
    	else if (d_aux==min4) begin
    	   en4=0;
    	end
    	else if(d_aux<min5) begin
    	   en5=1;
    	end
    	else if (d_aux==min5) begin
    	   en5=0;
    	end
    	else if(d_aux<min6) begin
    	   en6=1;
    	end
    	else if(d_aux==min6) begin
    	   en6=0;
    	end
    	else if(d_aux<min7)begin
    	   en7=1;
    	end
    	else if (d_aux==min7) begin
    	   en7=0;
    	end
    	else if(d_aux<min8)begin
    	   en8=1;
    	end
    	else if (d_aux==min8) begin
    	   en8=0;
    	end
    	else if(d_aux<min9)begin
    	   en9=1;
    	end
    	else if (d_aux==min9) begin
    	   en9=0;
    	end
    	else if(d_aux<min10)begin
    	   en10=1;
    	end
    	else if (d_aux==min10) begin
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
    	if(classify) begin
    	   //increments the label of 1min without loops
    	   if(label1 == 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label1 = 8'b11111111;
    	   end
    	   else if(label1 == 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label1 = 8'b11111111;   	   
    	   end
    	   else if(label1 == 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label1 = 8'b11111111;  	   
    	   end
    	   else if(label1 == 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label1 = 8'b11111111;	   
    	   end
    	   else if(label1 == 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label1 = 8'b11111111; 	   
    	   end
    	   else if(label1 == 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label1 = 8'b11111111;   
    	   end
    	   else if(label1 == 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label1 = 8'b11111111; 	   
    	   end
    	   else if(label1 == 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label1 = 8'b11111111;  	   
    	   end
    	   else if(label1 == 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label1 = 8'b11111111;  	   
    	   end
    	   else if(label1 == 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label1 = 8'b11111111;   	   
    	   end
    	   //increments the label of 2min without loops
     	   if(label2 == 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label2 = 8'b11111111;
    	   end
    	   else if(label2 == 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label2 = 8'b11111111;   	   
    	   end
    	   else if(label2 == 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label2 = 8'b11111111;  	   
    	   end
    	   else if(label2 == 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label2 = 8'b11111111;	   
    	   end
    	   else if(label2 == 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label2 = 8'b11111111; 	   
    	   end
    	   else if(label2 == 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label2 = 8'b11111111;   
    	   end
    	   else if(label2 == 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label2 = 8'b11111111; 	   
    	   end
    	   else if(label2 == 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label2 = 8'b11111111;  	   
    	   end
    	   else if(label2 == 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label2 = 8'b11111111;  	   
    	   end
    	   else if(label2 == 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label2 = 8'b11111111;   	   
    	   end
    	   //increments the label of 3min without loops
     	   if(label3 == 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label3 = 8'b11111111;
    	   end
    	   else if(label3 == 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label3 = 8'b11111111;   	   
    	   end
    	   else if(label3 == 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label3 = 8'b11111111;  	   
    	   end
    	   else if(label3 == 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label3 = 8'b11111111;	   
    	   end
    	   else if(label3 == 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label3 = 8'b11111111; 	   
    	   end
    	   else if(label3 == 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label3 = 8'b11111111;   
    	   end
    	   else if(label3 == 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label3 = 8'b11111111; 	   
    	   end
    	   else if(label3 == 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label3 = 8'b11111111;  	   
    	   end
    	   else if(label3 == 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label3 = 8'b11111111;  	   
    	   end
    	   else if(label3 == 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label3 = 8'b11111111;   	   
    	   end
    	   //increments the label of 4min without loops
     	   if(label4 == 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label4 = 8'b11111111;
    	   end
    	   else if(label4 == 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label4 = 8'b11111111;   	   
    	   end
    	   else if(label4 == 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label4 = 8'b11111111;  	   
    	   end
    	   else if(label4 == 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label4 = 8'b11111111;	   
    	   end
    	   else if(label4 == 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label4 = 8'b11111111; 	   
    	   end
    	   else if(label4 == 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label4 = 8'b11111111;   
    	   end
    	   else if(label4 == 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label4 = 8'b11111111; 	   
    	   end
    	   else if(label4 == 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label4 = 8'b11111111;  	   
    	   end
    	   else if(label4 == 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label4 = 8'b11111111;  	   
    	   end
    	   else if(label4 == 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label4 = 8'b11111111;   	   
    	   end
    	   //increments the label of 5min without loops
     	   if(label5 == 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label5 = 8'b11111111;
    	   end
    	   else if(label5 == 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label5 = 8'b11111111;   	   
    	   end
    	   else if(label5 == 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label5 = 8'b11111111;  	   
    	   end
    	   else if(label5 == 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label5 = 8'b11111111;	   
    	   end
    	   else if(label5 == 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label5 = 8'b11111111; 	   
    	   end
    	   else if(label5 == 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label5 = 8'b11111111;   
    	   end
    	   else if(label5 == 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label5 = 8'b11111111; 	   
    	   end
    	   else if(label5 == 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label5 = 8'b11111111;  	   
    	   end
    	   else if(label5 == 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label5 = 8'b11111111;  	   
    	   end
    	   else if(label5 == 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label5 = 8'b11111111;   	   
    	   end
    	   //increments the label of 6min without loops
     	   if(label6 == 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label6 = 8'b11111111;
    	   end
    	   else if(label6 == 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label6 = 8'b11111111;   	   
    	   end
    	   else if(label6 == 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label6 = 8'b11111111;  	   
    	   end
    	   else if(label6 == 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label6 = 8'b11111111;	   
    	   end
    	   else if(label6 == 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label6 = 8'b11111111; 	   
    	   end
    	   else if(label6 == 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label6 = 8'b11111111;   
    	   end
    	   else if(label6 == 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label6 = 8'b11111111; 	   
    	   end
    	   else if(label6 == 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label6 = 8'b11111111;  	   
    	   end
    	   else if(label6 == 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label6 = 8'b11111111;  	   
    	   end
    	   else if(label6 == 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label6 = 8'b11111111;   	   
    	   end
    	   //increments the label of 7min without loops
     	   if(label7 == 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label7 = 8'b11111111;
    	   end
    	   else if(label7 == 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label7 = 8'b11111111;   	   
    	   end
    	   else if(label7 == 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label7 = 8'b11111111;  	   
    	   end
    	   else if(label7 == 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label7 = 8'b11111111;	   
    	   end
    	   else if(label7 == 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label7 = 8'b11111111; 	   
    	   end
    	   else if(label7 == 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label7 = 8'b11111111;   
    	   end
    	   else if(label7 == 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label7 = 8'b11111111; 	   
    	   end
    	   else if(label7 == 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label7 = 8'b11111111;  	   
    	   end
    	   else if(label7 == 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label7 = 8'b11111111;  	   
    	   end
    	   else if(label7 == 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label7 = 8'b11111111;   	   
    	   end
    	   //increments the label of 8min without loops
     	   if(label8 == 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label8 = 8'b11111111;
    	   end
    	   else if(label8 == 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label8 = 8'b11111111;   	   
    	   end
    	   else if(label8 == 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label8 = 8'b11111111;  	   
    	   end
    	   else if(label8 == 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label8 = 8'b11111111;	   
    	   end
    	   else if(label8 == 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label8 = 8'b11111111; 	   
    	   end
    	   else if(label8 == 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label8 = 8'b11111111;   
    	   end
    	   else if(label8 == 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label8 = 8'b11111111; 	   
    	   end
    	   else if(label8 == 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label8 = 8'b11111111;  	   
    	   end
    	   else if(label8 == 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label8 = 8'b11111111;  	   
    	   end
    	   else if(label8 == 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label8 = 8'b11111111;   	   
    	   end
    	   //increments the label of 9min without loops
     	   if(label9 == 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label9 = 8'b11111111;
    	   end
    	   else if(label9 == 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label9 = 8'b11111111;   	   
    	   end
    	   else if(label9 == 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label9 = 8'b11111111;  	   
    	   end
    	   else if(label9 == 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label9 = 8'b11111111;	   
    	   end
    	   else if(label9 == 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label9 = 8'b11111111; 	   
    	   end
    	   else if(label9 == 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label9 = 8'b11111111;   
    	   end
    	   else if(label9 == 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label9 = 8'b11111111; 	   
    	   end
    	   else if(label9 == 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label9 = 8'b11111111;  	   
    	   end
    	   else if(label9 == 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label9 = 8'b11111111;  	   
    	   end
    	   else if(label9 == 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label9 = 8'b11111111;   	   
    	   end
    	   //increments the label of 10min without loops
     	   if(label10 == 0) begin
    	   	N_label0 = N_label0 + 1;
    	   	label10 = 8'b11111111;
    	   end
    	   else if(label10 == 1) begin
    	   	N_label1 = N_label1 + 1; 
    	   	label10 = 8'b11111111;   	   
    	   end
    	   else if(label10 == 2) begin
    	   	N_label2 = N_label2 + 1;  
    	   	label10 = 8'b11111111;  	   
    	   end
    	   else if(label10 == 3) begin
    	   	N_label3 = N_label3 + 1;    
    	   	label10 = 8'b11111111;	   
    	   end
    	   else if(label10 == 4) begin
    	   	N_label4 = N_label4 + 1;  
    	   	label10 = 8'b11111111; 	   
    	   end
    	   else if(label10 == 5) begin
    	   	N_label5 = N_label5 + 1;    	
    	   	label10 = 8'b11111111;   
    	   end
    	   else if(label10 == 6) begin
    	   	N_label6 = N_label6 + 1;   
    	   	label10 = 8'b11111111; 	   
    	   end
    	   else if(label10 == 7) begin
    	   	N_label7 = N_label7 + 1;  
    	   	label10 = 8'b11111111;  	   
    	   end
    	   else if(label10 == 8) begin
    	   	N_label8 = N_label8 + 1;  
    	   	label10 = 8'b11111111;  	   
    	   end
    	   else if(label10 == 9) begin
    	   	N_label9 = N_label9 + 1; 
    	   	label10 = 8'b11111111;   	   
    	   end
    	   
    	   //compares N_labels to find point label no loops
    	   if(N_label0 > N_label1 & N_label0 > N_label2 & N_label0 > N_label3 & N_label0 > N_label4 & N_label0 > N_label5 & N_label0 > N_label6 & N_label0 > N_label7 & N_label0 > N_label8 & N_label0 > N_label9) begin
    	     `SIGNAL2OUT(labelOUTaux, Plabel0);
    	   //  `SIGNAL2OUT(DONE, 1'b1);
    	   end
    	   else if(N_label1 > N_label0 & N_label1 > N_label2 & N_label1 > N_label3 & N_label1 > N_label4 & N_label1 > N_label5 & N_label1 > N_label6 & N_label1 > N_label7 & N_label1 > N_label8 & N_label1 > N_label9) begin
    	     `SIGNAL2OUT(labelOUTaux, Plabel1);
    	   //  `SIGNAL2OUT(DONE, 1'b1);
    	   end
    	   else if(N_label2 > N_label0 & N_label2 > N_label1 & N_label2 > N_label3 & N_label2 > N_label4 & N_label2 > N_label5 & N_label2 > N_label6 & N_label2 > N_label7 & N_label2 > N_label8 & N_label2 > N_label9) begin
    	     `SIGNAL2OUT(labelOUTaux, Plabel2);
    	   //  `SIGNAL2OUT(DONE, 1'b1);
    	   end
    	   else if(N_label3 > N_label0 & N_label3 > N_label1 & N_label3 > N_label2 & N_label3 > N_label4 & N_label3 > N_label5 & N_label3 > N_label6 & N_label3 > N_label7 & N_label3 > N_label8 & N_label3 > N_label9) begin
    	     `SIGNAL2OUT(labelOUTaux, Plabel3);
    	    // `SIGNAL2OUT(DONE, 1'b1);
    	   end
    	   else if(N_label4 > N_label0 & N_label4 > N_label1 & N_label4 > N_label2 & N_label4 > N_label3 & N_label4 > N_label5 & N_label4 > N_label6 & N_label4 > N_label7 & N_label4 > N_label8 & N_label4 > N_label9) begin
    	     `SIGNAL2OUT(labelOUTaux, Plabel4);
    	    // `SIGNAL2OUT(DONE, 1'b1);
    	   end
    	   else if(N_label5 > N_label0 & N_label5 > N_label1 & N_label5 > N_label2 & N_label5 > N_label3 & N_label5 > N_label4 & N_label5 > N_label6 & N_label5 > N_label7 & N_label5 > N_label8 & N_label5 > N_label9) begin
    	     `SIGNAL2OUT(labelOUTaux, Plabel5);
    	    // `SIGNAL2OUT(DONE, 1'b1);
    	   end
    	   else if(N_label6 > N_label0 & N_label6 > N_label1 & N_label6 > N_label2 & N_label6 > N_label3 & N_label6 > N_label4 & N_label6 > N_label5 & N_label6 > N_label7 & N_label6 > N_label8 & N_label6 > N_label9) begin
    	     `SIGNAL2OUT(labelOUTaux, Plabel6);
    	    // `SIGNAL2OUT(DONE, 1'b1);
    	   end
    	   else if(N_label7 > N_label0 & N_label7 > N_label1 & N_label7 > N_label2 & N_label7 > N_label3 & N_label7 > N_label4 & N_label7 > N_label5 & N_label7 > N_label6 & N_label7 > N_label8 & N_label7 > N_label9) begin
    	     `SIGNAL2OUT(labelOUTaux, Plabel7);
    	    // `SIGNAL2OUT(DONE, 1'b1);
    	   end
    	   else if(N_label8 > N_label0 & N_label8 > N_label1 & N_label8 > N_label2 & N_label8 > N_label3 & N_label8 > N_label4 & N_label8 > N_label5 & N_label8 > N_label6 & N_label8 > N_label7 & N_label8 > N_label9) begin
    	     `SIGNAL2OUT(labelOUTaux, Plabel8);
    	    // `SIGNAL2OUT(DONE, 1'b1);
    	   end
    	   else if(N_label9 > N_label0 & N_label9 > N_label1 & N_label9 > N_label2 & N_label9 > N_label3 & N_label9 > N_label4 & N_label9 > N_label5 & N_label9 > N_label6 & N_label9 > N_label7 & N_label9 > N_label8) begin
    	     `SIGNAL2OUT(labelOUTaux, Plabel9);
    	    // `SIGNAL2OUT(DONE, 1'b1);
    	   end
    	end
    end
    `SIGNAL2OUT(Xlabel,labelOUTaux)
    
endmodule

