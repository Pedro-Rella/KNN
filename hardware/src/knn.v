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
    
    `SIGNAL(N_label10,8)
    `SIGNAL(N_label11,8)
    `SIGNAL(N_label12,8)
    `SIGNAL(N_label13,8)
    `SIGNAL(N_label14,8)
    `SIGNAL(N_label15,8)
    `SIGNAL(N_label16,8)
    `SIGNAL(N_label17,8)
    `SIGNAL(N_label18,8)
    `SIGNAL(N_label19,8)
    `SIGNAL(N_label20,8)
    `SIGNAL(N_label21,8)
    `SIGNAL(N_label22,8)
    `SIGNAL(N_label23,8)
    `SIGNAL(N_label24,8)
    `SIGNAL(N_label25,8)
    `SIGNAL(N_label26,8)
    `SIGNAL(N_label27,8)
    `SIGNAL(N_label28,8)
    `SIGNAL(N_label29,8)
    `SIGNAL(N_label30,8)
    `SIGNAL(N_label31,8)
    `SIGNAL(N_label32,8)
    `SIGNAL(N_label33,8)
    `SIGNAL(N_label34,8)
    `SIGNAL(N_label35,8)
    `SIGNAL(N_label36,8)
    `SIGNAL(N_label37,8)
    `SIGNAL(N_label38,8)
    `SIGNAL(N_label39,8)
    `SIGNAL(N_label40,8)
    `SIGNAL(N_label41,8)
    `SIGNAL(N_label42,8)
    `SIGNAL(N_label43,8)
    `SIGNAL(N_label44,8)
    `SIGNAL(N_label45,8)
    `SIGNAL(N_label46,8)
    `SIGNAL(N_label47,8)
    `SIGNAL(N_label48,8)
    `SIGNAL(N_label49,8)
    `SIGNAL(N_label50,8)
    `SIGNAL(N_label51,8)
    `SIGNAL(N_label52,8)
    `SIGNAL(N_label53,8)
    `SIGNAL(N_label54,8)
    `SIGNAL(N_label55,8)
    `SIGNAL(N_label56,8)
    `SIGNAL(N_label57,8)
    `SIGNAL(N_label58,8)
    `SIGNAL(N_label59,8)
    `SIGNAL(N_label60,8)
    `SIGNAL(N_label61,8)
    `SIGNAL(N_label62,8)
    `SIGNAL(N_label63,8)
    `SIGNAL(N_label64,8)
    `SIGNAL(N_label65,8)
    `SIGNAL(N_label66,8)
    `SIGNAL(N_label67,8)
    `SIGNAL(N_label68,8)
    `SIGNAL(N_label69,8)
    `SIGNAL(N_label70,8)
    `SIGNAL(N_label71,8)
    `SIGNAL(N_label72,8)
    `SIGNAL(N_label73,8)
    `SIGNAL(N_label74,8)
    `SIGNAL(N_label75,8)
    `SIGNAL(N_label76,8)
    `SIGNAL(N_label77,8)
    `SIGNAL(N_label78,8)
    `SIGNAL(N_label79,8)
    `SIGNAL(N_label80,8)
    `SIGNAL(N_label81,8)
    `SIGNAL(N_label82,8)
    `SIGNAL(N_label83,8)
    `SIGNAL(N_label84,8)
    `SIGNAL(N_label85,8)
    `SIGNAL(N_label86,8)
    `SIGNAL(N_label87,8)
    `SIGNAL(N_label88,8)
    `SIGNAL(N_label89,8)
    `SIGNAL(N_label90,8)
    `SIGNAL(N_label91,8)
    `SIGNAL(N_label92,8)
    `SIGNAL(N_label93,8)
    `SIGNAL(N_label94,8)
    `SIGNAL(N_label95,8)
    `SIGNAL(N_label96,8)
    `SIGNAL(N_label97,8)
    `SIGNAL(N_label98,8)
    `SIGNAL(N_label99,8)
    `SIGNAL(N_label100,8)
    `SIGNAL(N_label101,8)
    `SIGNAL(N_label102,8)
    `SIGNAL(N_label103,8)
    `SIGNAL(N_label104,8)
    `SIGNAL(N_label105,8)
    `SIGNAL(N_label106,8)
    `SIGNAL(N_label107,8)
    `SIGNAL(N_label108,8)
    `SIGNAL(N_label109,8)
    
    `SIGNAL(N_label0,8)
    `SIGNAL(N_label1,8)
    `SIGNAL(N_label2,8)
    `SIGNAL(N_label3,8)
    `SIGNAL(N_label4,8)
    `SIGNAL(N_label5,8)
    `SIGNAL(N_label6,8)
    `SIGNAL(N_label7,8)
    `SIGNAL(N_label8,8)
    `SIGNAL(N_label9,8)
     
    `SIGNAL_SIGNED(labelOUTaux, 8)
    
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
    	else begin
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
    always @* begin
    	if(control == 2) begin
    	
    	   //increments the label of 1min without loops
    	   if(label1 == 0 & nk > 0) begin
    	   	N_label10 = 1;
    	   	N_label11 = 0;
    	   	N_label12 = 0;
    	   	N_label13 = 0;
    	   	N_label14 = 0;
    	   	N_label15 = 0;
    	   	N_label16 = 0;
    	   	N_label17 = 0;
    	   	N_label18 = 0;
    	   	N_label19 = 0;
    	   end
    	   else if(label1 == 1 & nk > 0) begin
    	   	N_label10 = 0;
    	   	N_label11 = 1;
    	   	N_label12 = 0;
    	   	N_label13 = 0;
    	   	N_label14 = 0;
    	   	N_label15 = 0;
    	   	N_label16 = 0;
    	   	N_label17 = 0;
    	   	N_label18 = 0;
    	   	N_label19 = 0;	   
    	   end
    	   else if(label1 == 2 & nk > 0) begin
    	   	N_label10 = 0;
    	   	N_label11 = 0;
    	   	N_label12 = 1;
    	   	N_label13 = 0;
    	   	N_label14 = 0;
    	   	N_label15 = 0;
    	   	N_label16 = 0;
    	   	N_label17 = 0;
    	   	N_label18 = 0;
    	   	N_label19 = 0;	   
    	   end
    	   else if(label1 == 3 & nk > 0) begin
    	   	N_label10 = 0;
    	   	N_label11 = 0;
    	   	N_label12 = 0;
    	   	N_label13 = 1;
    	   	N_label14 = 0;
    	   	N_label15 = 0;
    	   	N_label16 = 0;
    	   	N_label17 = 0;
    	   	N_label18 = 0;
    	   	N_label19 = 0;   
    	   end
    	   else if(label1 == 4 & nk > 0) begin
    	   	N_label10 = 0;
    	   	N_label11 = 0;
    	   	N_label12 = 0;
    	   	N_label13 = 0;
    	   	N_label14 = 1;
    	   	N_label15 = 0;
    	   	N_label16 = 0;
    	   	N_label17 = 0;
    	   	N_label18 = 0;
    	   	N_label19 = 0;  
    	   end
    	   else if(label1 == 5 & nk > 0) begin
    	   	N_label10 = 0;
    	   	N_label11 = 0;
    	   	N_label12 = 0;
    	   	N_label13 = 0;
    	   	N_label14 = 0;
    	   	N_label15 = 1;
    	   	N_label16 = 0;
    	   	N_label17 = 0;
    	   	N_label18 = 0;
    	   	N_label19 = 0;
    	   end
    	   else if(label1 == 6 & nk > 0) begin
    	   	N_label10 = 0;
    	   	N_label11 = 0;
    	   	N_label12 = 0;
    	   	N_label13 = 0;
    	   	N_label14 = 0;
    	   	N_label15 = 0;
    	   	N_label16 = 1;
    	   	N_label17 = 0;
    	   	N_label18 = 0;
    	   	N_label19 = 0;  
    	   end
    	   else if(label1 == 7 & nk > 0) begin
    	   	N_label10 = 1;
    	   	N_label11 = 0;
    	   	N_label12 = 0;
    	   	N_label13 = 0;
    	   	N_label14 = 0;
    	   	N_label15 = 0;
    	   	N_label16 = 0;
    	   	N_label17 = 1;
    	   	N_label18 = 0;
    	   	N_label19 = 0;	   
    	   end
    	   else if(label1 == 8 & nk > 0) begin
    	   	N_label10 = 1;
    	   	N_label11 = 0;
    	   	N_label12 = 0;
    	   	N_label13 = 0;
    	   	N_label14 = 0;
    	   	N_label15 = 0;
    	   	N_label16 = 0;
    	   	N_label17 = 0;
    	   	N_label18 = 1;
    	   	N_label19 = 0;	   
    	   end
    	   else if(label1 == 9 & nk > 0) begin
    	   	N_label10 = 1;
    	   	N_label11 = 0;
    	   	N_label12 = 0;
    	   	N_label13 = 0;
    	   	N_label14 = 0;
    	   	N_label15 = 0;
    	   	N_label16 = 0;
    	   	N_label17 = 0;
    	   	N_label18 = 0;
    	   	N_label19 = 1;	   
    	   end
    	   else begin
    	   	N_label10 = 0;
    	   	N_label11 = 0;
    	   	N_label12 = 0;
    	   	N_label13 = 0;
    	   	N_label14 = 0;
    	   	N_label15 = 0;
    	   	N_label16 = 0;
    	   	N_label17 = 0;
    	   	N_label18 = 0;
    	   	N_label19 = 0;
    	   end
    	   
    	   //increments the label of 2min without loops
     	   if(label2 == 0 & nk > 1) begin
    	   	N_label20 = 1;
    	   	N_label21 = 0;
    	   	N_label22 = 0;
    	   	N_label23 = 0;
    	   	N_label24 = 0;
    	   	N_label25 = 0;
    	   	N_label26 = 0;
    	   	N_label27 = 0;
    	   	N_label28 = 0;
    	   	N_label29 = 0;
    	   end
    	   else if(label2 == 1 & nk > 1) begin
    	   	N_label20 = 0;
    	   	N_label21 = 1;
    	   	N_label22 = 0;
    	   	N_label23 = 0;
    	   	N_label24 = 0;
    	   	N_label25 = 0;
    	   	N_label26 = 0;
    	   	N_label27 = 0;
    	   	N_label28 = 0;
    	   	N_label29 = 0; 	   
    	   end
    	   else if(label2 == 2 & nk > 1) begin
    	   	N_label20 = 0;
    	   	N_label21 = 0;
    	   	N_label22 = 1;
    	   	N_label23 = 0;
    	   	N_label24 = 0;
    	   	N_label25 = 0;
    	   	N_label26 = 0;
    	   	N_label27 = 0;
    	   	N_label28 = 0;
    	   	N_label29 = 0;	   
    	   end
    	   else if(label2 == 3 & nk > 1) begin
    	   	N_label20 = 0;
    	   	N_label21 = 0;
    	   	N_label22 = 0;
    	   	N_label23 = 1;
    	   	N_label24 = 0;
    	   	N_label25 = 0;
    	   	N_label26 = 0;
    	   	N_label27 = 0;
    	   	N_label28 = 0;
    	   	N_label29 = 0;   
    	   end
    	   else if(label2 == 4 & nk > 1) begin
    	   	N_label20 = 0;
    	   	N_label21 = 0;
    	   	N_label22 = 0;
    	   	N_label23 = 0;
    	   	N_label24 = 1;
    	   	N_label25 = 0;
    	   	N_label26 = 0;
    	   	N_label27 = 0;
    	   	N_label28 = 0;
    	   	N_label29 = 0;   
    	   end
    	   else if(label2 == 5 & nk > 1) begin
    	   	N_label20 = 0;
    	   	N_label21 = 0;
    	   	N_label22 = 0;
    	   	N_label23 = 0;
    	   	N_label24 = 0;
    	   	N_label25 = 1;
    	   	N_label26 = 0;
    	   	N_label27 = 0;
    	   	N_label28 = 0;
    	   	N_label29 = 0; 
    	   end
    	   else if(label2 == 6 & nk > 1) begin
    	   	N_label20 = 0;
    	   	N_label21 = 0;
    	   	N_label22 = 0;
    	   	N_label23 = 0;
    	   	N_label24 = 0;
    	   	N_label25 = 0;
    	   	N_label26 = 1;
    	   	N_label27 = 0;
    	   	N_label28 = 0;
    	   	N_label29 = 0;   
    	   end
    	   else if(label2 == 7 & nk > 1) begin
    	   	N_label20 = 0;
    	   	N_label21 = 0;
    	   	N_label22 = 0;
    	   	N_label23 = 0;
    	   	N_label24 = 0;
    	   	N_label25 = 0;
    	   	N_label26 = 0;
    	   	N_label27 = 1;
    	   	N_label28 = 0;
    	   	N_label29 = 0;	   
    	   end
    	   else if(label2 == 8 & nk > 1) begin
    	   	N_label20 = 0;
    	   	N_label21 = 0;
    	   	N_label22 = 0;
    	   	N_label23 = 0;
    	   	N_label24 = 0;
    	   	N_label25 = 0;
    	   	N_label26 = 0;
    	   	N_label27 = 0;
    	   	N_label28 = 1;
    	   	N_label29 = 0;	   
    	   end
    	   else if(label2 == 9 & nk > 1) begin
    	   	N_label20 = 0;
    	   	N_label21 = 0;
    	   	N_label22 = 0;
    	   	N_label23 = 0;
    	   	N_label24 = 0;
    	   	N_label25 = 0;
    	   	N_label26 = 0;
    	   	N_label27 = 0;
    	   	N_label28 = 0;
    	   	N_label29 = 1; 	   
    	   end
    	   else begin
    	        N_label20 = 0;
    	   	N_label21 = 0;
    	   	N_label22 = 0;
    	   	N_label23 = 0;
    	   	N_label24 = 0;
    	   	N_label25 = 0;
    	   	N_label26 = 0;
    	   	N_label27 = 0;
    	   	N_label28 = 0;
    	   	N_label29 = 0;
    	   end
    	   
    	   //increments the label of 3min without loops
     	   if(label3 == 0 & nk > 2) begin
    	   	N_label30 = 1;
    	   	N_label31 = 0;
    	   	N_label32 = 0;
    	   	N_label33 = 0;
    	   	N_label34 = 0;
    	   	N_label35 = 0;
    	   	N_label36 = 0;
    	   	N_label37 = 0;
    	   	N_label38 = 0;
    	   	N_label39 = 0;
    	   end
    	   else if(label3 == 1 & nk > 2) begin
    	   	N_label30 = 0;
    	   	N_label31 = 1;
    	   	N_label32 = 0;
    	   	N_label33 = 0;
    	   	N_label34 = 0;
    	   	N_label35 = 0;
    	   	N_label36 = 0;
    	   	N_label37 = 0;
    	   	N_label38 = 0;
    	   	N_label39 = 0; 	   
    	   end
    	   else if(label3 == 2 & nk > 2) begin
    	   	N_label30 = 0;
    	   	N_label31 = 0;
    	   	N_label32 = 1;
    	   	N_label33 = 0;
    	   	N_label34 = 0;
    	   	N_label35 = 0;
    	   	N_label36 = 0;
    	   	N_label37 = 0;
    	   	N_label38 = 0;
    	   	N_label39 = 0;	   
    	   end
    	   else if(label3 == 3 & nk > 2) begin
    	   	N_label30 = 0;
    	   	N_label31 = 0;
    	   	N_label32 = 0;
    	   	N_label33 = 1;
    	   	N_label34 = 0;
    	   	N_label35 = 0;
    	   	N_label36 = 0;
    	   	N_label37 = 0;
    	   	N_label38 = 0;
    	   	N_label39 = 0;   
    	   end
    	   else if(label3 == 4 & nk > 2) begin
    	   	N_label30 = 0;
    	   	N_label31 = 0;
    	   	N_label32 = 0;
    	   	N_label33 = 0;
    	   	N_label34 = 1;
    	   	N_label35 = 0;
    	   	N_label36 = 0;
    	   	N_label37 = 0;
    	   	N_label38 = 0;
    	   	N_label39 = 0;  
    	   end
    	   else if(label3 == 5 & nk > 2) begin
    	   	N_label30 = 0;
    	   	N_label31 = 0;
    	   	N_label32 = 0;
    	   	N_label33 = 0;
    	   	N_label34 = 0;
    	   	N_label35 = 1;
    	   	N_label36 = 0;
    	   	N_label37 = 0;
    	   	N_label38 = 0;
    	   	N_label39 = 0;  
    	   end
    	   else if(label3 == 6 & nk > 2) begin
    	   	N_label30 = 0;
    	   	N_label31 = 0;
    	   	N_label32 = 0;
    	   	N_label33 = 0;
    	   	N_label34 = 0;
    	   	N_label35 = 0;
    	   	N_label36 = 1;
    	   	N_label37 = 0;
    	   	N_label38 = 0;
    	   	N_label39 = 0;  
    	   end
    	   else if(label3 == 7 & nk > 2) begin
    	   	N_label30 = 0;
    	   	N_label31 = 0;
    	   	N_label32 = 0;
    	   	N_label33 = 0;
    	   	N_label34 = 0;
    	   	N_label35 = 0;
    	   	N_label36 = 0;
    	   	N_label37 = 1;
    	   	N_label38 = 0;
    	   	N_label39 = 0;	   
    	   end
    	   else if(label3 == 8 & nk > 2) begin
    	   	N_label30 = 0;
    	   	N_label31 = 0;
    	   	N_label32 = 0;
    	   	N_label33 = 0;
    	   	N_label34 = 0;
    	   	N_label35 = 0;
    	   	N_label36 = 0;
    	   	N_label37 = 0;
    	   	N_label38 = 1;
    	   	N_label39 = 0;	   
    	   end
    	   else if(label3 == 9 & nk > 2) begin
    	   	N_label30 = 0;
    	   	N_label31 = 0;
    	   	N_label32 = 0;
    	   	N_label33 = 0;
    	   	N_label34 = 0;
    	   	N_label35 = 0;
    	   	N_label36 = 0;
    	   	N_label37 = 0;
    	   	N_label38 = 0;
    	   	N_label39 = 1;	   
    	   end
    	   else begin
    	       N_label30 = 0;
    	   	N_label31 = 0;
    	   	N_label32 = 0;
    	   	N_label33 = 0;
    	   	N_label34 = 0;
    	   	N_label35 = 0;
    	   	N_label36 = 0;
    	   	N_label37 = 0;
    	   	N_label38 = 0;
    	   	N_label39 = 0;
    	   end
    	   
    	   //increments the label of 4min without loops
     	   if(label4 == 0 & nk > 3) begin
    	   	N_label40 = 1;
    	   	N_label41 = 0;
    	   	N_label42 = 0;
    	   	N_label43 = 0;
    	   	N_label44 = 0;
    	   	N_label45 = 0;
    	   	N_label46 = 0;
    	   	N_label47 = 0;
    	   	N_label48 = 0;
    	   	N_label49 = 0;
    	   end
    	   else if(label4 == 1 & nk > 3) begin
    	   	N_label40 = 0;
    	   	N_label41 = 1;
    	   	N_label42 = 0;
    	   	N_label43 = 0;
    	   	N_label44 = 0;
    	   	N_label45 = 0;
    	   	N_label46 = 0;
    	   	N_label47 = 0;
    	   	N_label48 = 0;
    	   	N_label49 = 0;	   
    	   end
    	   else if(label4 == 2 & nk > 3) begin
    	   	N_label40 = 0;
    	   	N_label41 = 0;
    	   	N_label42 = 1;
    	   	N_label43 = 0;
    	   	N_label44 = 0;
    	   	N_label45 = 0;
    	   	N_label46 = 0;
    	   	N_label47 = 0;
    	   	N_label48 = 0;
    	   	N_label49 = 0;	   
    	   end
    	   else if(label4 == 3 & nk > 3) begin
    	   	N_label40 = 0;
    	   	N_label41 = 0;
    	   	N_label42 = 0;
    	   	N_label43 = 1;
    	   	N_label44 = 0;
    	   	N_label45 = 0;
    	   	N_label46 = 0;
    	   	N_label47 = 0;
    	   	N_label48 = 0;
    	   	N_label49 = 0;   
    	   end
    	   else if(label4 == 4 & nk > 3) begin
    	   	N_label40 = 0;
    	   	N_label41 = 0;
    	   	N_label42 = 0;
    	   	N_label43 = 0;
    	   	N_label44 = 1;
    	   	N_label45 = 0;
    	   	N_label46 = 0;
    	   	N_label47 = 0;
    	   	N_label48 = 0;
    	   	N_label49 = 0;   
    	   end
    	   else if(label4 == 5 & nk > 3) begin
    	   	N_label40 = 0;
    	   	N_label41 = 0;
    	   	N_label42 = 0;
    	   	N_label43 = 0;
    	   	N_label44 = 0;
    	   	N_label45 = 1;
    	   	N_label46 = 0;
    	   	N_label47 = 0;
    	   	N_label48 = 0;
    	   	N_label49 = 0; 
    	   end
    	   else if(label4 == 6 & nk > 3) begin
    	   	N_label40 = 0;
    	   	N_label41 = 0;
    	   	N_label42 = 0;
    	   	N_label43 = 0;
    	   	N_label44 = 0;
    	   	N_label45 = 0;
    	   	N_label46 = 1;
    	   	N_label47 = 0;
    	   	N_label48 = 0;
    	   	N_label49 = 0; 
    	   end
    	   else if(label4 == 7 & nk > 3) begin
    	   	N_label40 = 0;
    	   	N_label41 = 0;
    	   	N_label42 = 0;
    	   	N_label43 = 0;
    	   	N_label44 = 0;
    	   	N_label45 = 0;
    	   	N_label46 = 0;
    	   	N_label47 = 1;
    	   	N_label48 = 0;
    	   	N_label49 = 0;	   
    	   end
    	   else if(label4 == 8 & nk > 3) begin
    	   	N_label40 = 0;
    	   	N_label41 = 0;
    	   	N_label42 = 0;
    	   	N_label43 = 0;
    	   	N_label44 = 0;
    	   	N_label45 = 0;
    	   	N_label46 = 0;
    	   	N_label47 = 0;
    	   	N_label48 = 1;
    	   	N_label49 = 0; 	   
    	   end
    	   else if(label4 == 9 & nk > 3) begin
    	   	N_label40 = 0;
    	   	N_label41 = 0;
    	   	N_label42 = 0;
    	   	N_label43 = 0;
    	   	N_label44 = 0;
    	   	N_label45 = 0;
    	   	N_label46 = 0;
    	   	N_label47 = 0;
    	   	N_label48 = 0;
    	   	N_label49 = 1; 	   
    	   end
    	   else begin
    	        N_label40 = 0;
    	   	N_label41 = 0;
    	   	N_label42 = 0;
    	   	N_label43 = 0;
    	   	N_label44 = 0;
    	   	N_label45 = 0;
    	   	N_label46 = 0;
    	   	N_label47 = 0;
    	   	N_label48 = 0;
    	   	N_label49 = 0;
    	   end
    	   //increments the label of 5min without loops
     	   if(label5 == 0 & nk > 4) begin
    	   	N_label50 = 1;
    	   	N_label51 = 0;
    	   	N_label52 = 0;
    	   	N_label53 = 0;
    	   	N_label54 = 0;
    	   	N_label55 = 0;
    	   	N_label56 = 0;
    	   	N_label57 = 0;
    	   	N_label58 = 0;
    	   	N_label59 = 0;
    	   end
    	   else if(label5 == 1 & nk > 4) begin
    	   	N_label50 = 0;
    	   	N_label51 = 1;
    	   	N_label52 = 0;
    	   	N_label53 = 0;
    	   	N_label54 = 0;
    	   	N_label55 = 0;
    	   	N_label56 = 0;
    	   	N_label57 = 0;
    	   	N_label58 = 0;
    	   	N_label59 = 0;	   
    	   end
    	   else if(label5 == 2 & nk > 4) begin
    	   	N_label50 = 0;
    	   	N_label51 = 0;
    	   	N_label52 = 1;
    	   	N_label53 = 0;
    	   	N_label54 = 0;
    	   	N_label55 = 0;
    	   	N_label56 = 0;
    	   	N_label57 = 0;
    	   	N_label58 = 0;
    	   	N_label59 = 0;	   	   
    	   end
    	   else if(label5 == 3 & nk > 4) begin
    	   	N_label50 = 0;
    	   	N_label51 = 0;
    	   	N_label52 = 0;
    	   	N_label53 = 1;
    	   	N_label54 = 0;
    	   	N_label55 = 0;
    	   	N_label56 = 0;
    	   	N_label57 = 0;
    	   	N_label58 = 0;
    	   	N_label59 = 0;	      
    	   end
    	   else if(label5 == 4 & nk > 4) begin
    	   	N_label50 = 0;
    	   	N_label51 = 0;
    	   	N_label52 = 0;
    	   	N_label53 = 0;
    	   	N_label54 = 1;
    	   	N_label55 = 0;
    	   	N_label56 = 0;
    	   	N_label57 = 0;
    	   	N_label58 = 0;
    	   	N_label59 = 0;	 
    	   end
    	   else if(label5 == 5 & nk > 4) begin
    	   	N_label50 = 0;
    	   	N_label51 = 0;
    	   	N_label52 = 0;
    	   	N_label53 = 0;
    	   	N_label54 = 0;
    	   	N_label55 = 1;
    	   	N_label56 = 0;
    	   	N_label57 = 0;
    	   	N_label58 = 0;
    	   	N_label59 = 0;	  
    	   end
    	   else if(label5 == 6 & nk > 4) begin
    	   	N_label50 = 0;
    	   	N_label51 = 0;
    	   	N_label52 = 0;
    	   	N_label53 = 0;
    	   	N_label54 = 0;
    	   	N_label55 = 0;
    	   	N_label56 = 1;
    	   	N_label57 = 0;
    	   	N_label58 = 0;
    	   	N_label59 = 0;	    
    	   end
    	   else if(label5 == 7 & nk > 4) begin
    	   	N_label50 = 0;
    	   	N_label51 = 0;
    	   	N_label52 = 0;
    	   	N_label53 = 0;
    	   	N_label54 = 0;
    	   	N_label55 = 0;
    	   	N_label56 = 0;
    	   	N_label57 = 1;
    	   	N_label58 = 0;
    	   	N_label59 = 0;	 	   
    	   end
    	   else if(label5 == 8 & nk > 4) begin
    	   	N_label50 = 0;
    	   	N_label51 = 0;
    	   	N_label52 = 0;
    	   	N_label53 = 0;
    	   	N_label54 = 0;
    	   	N_label55 = 0;
    	   	N_label56 = 0;
    	   	N_label57 = 0;
    	   	N_label58 = 1;
    	   	N_label59 = 0;	 	   
    	   end
    	   else if(label5 == 9 & nk > 4) begin
    	   	N_label50 = 0;
    	   	N_label51 = 0;
    	   	N_label52 = 0;
    	   	N_label53 = 0;
    	   	N_label54 = 0;
    	   	N_label55 = 0;
    	   	N_label56 = 0;
    	   	N_label57 = 0;
    	   	N_label58 = 0;
    	   	N_label59 = 1;	  	   
    	   end
    	   else begin
    	        N_label50 = 0;
    	   	N_label51 = 0;
    	   	N_label52 = 0;
    	   	N_label53 = 0;
    	   	N_label54 = 0;
    	   	N_label55 = 0;
    	   	N_label56 = 0;
    	   	N_label57 = 0;
    	   	N_label58 = 0;
    	   	N_label59 = 0;	 
    	   end
    	   
    	   //increments the label of 6min without loops
     	   if(label6 == 0 & nk > 5) begin
    	   	N_label60 = 1;
    	   	N_label61 = 0;
    	   	N_label62 = 0;
    	   	N_label63 = 0;
    	   	N_label64 = 0;
    	   	N_label65 = 0;
    	   	N_label66 = 0;
    	   	N_label67 = 0;
    	   	N_label68 = 0;
    	   	N_label69 = 0;	 
    	   end
    	   else if(label6 == 1 & nk > 5) begin
    	   	N_label60 = 0;
    	   	N_label61 = 1;
    	   	N_label62 = 0;
    	   	N_label63 = 0;
    	   	N_label64 = 0;
    	   	N_label65 = 0;
    	   	N_label66 = 0;
    	   	N_label67 = 0;
    	   	N_label68 = 0;
    	   	N_label69 = 0;	 	   
    	   end
    	   else if(label6 == 2 & nk > 5) begin
    	   	N_label60 = 0;
    	   	N_label61 = 0;
    	   	N_label62 = 1;
    	   	N_label63 = 0;
    	   	N_label64 = 0;
    	   	N_label65 = 0;
    	   	N_label66 = 0;
    	   	N_label67 = 0;
    	   	N_label68 = 0;
    	   	N_label69 = 0;	 	   
    	   end
    	   else if(label6 == 3 & nk > 5) begin
    	   	N_label60 = 0;
    	   	N_label61 = 0;
    	   	N_label62 = 0;
    	   	N_label63 = 1;
    	   	N_label64 = 0;
    	   	N_label65 = 0;
    	   	N_label66 = 0;
    	   	N_label67 = 0;
    	   	N_label68 = 0;
    	   	N_label69 = 0;	   
    	   end
    	   else if(label6 == 4 & nk > 5) begin
    	   	N_label60 = 0;
    	   	N_label61 = 0;
    	   	N_label62 = 0;
    	   	N_label63 = 0;
    	   	N_label64 = 1;
    	   	N_label65 = 0;
    	   	N_label66 = 0;
    	   	N_label67 = 0;
    	   	N_label68 = 0;
    	   	N_label69 = 0;	   
    	   end
    	   else if(label6 == 5 & nk > 5) begin
    	   	N_label60 = 0;
    	   	N_label61 = 0;
    	   	N_label62 = 0;
    	   	N_label63 = 0;
    	   	N_label64 = 0;
    	   	N_label65 = 1;
    	   	N_label66 = 0;
    	   	N_label67 = 0;
    	   	N_label68 = 0;
    	   	N_label69 = 0;	  
    	   end
    	   else if(label6 == 6 & nk > 5) begin
    	   	N_label60 = 0;
    	   	N_label61 = 0;
    	   	N_label62 = 0;
    	   	N_label63 = 0;
    	   	N_label64 = 0;
    	   	N_label65 = 0;
    	   	N_label66 = 1;
    	   	N_label67 = 0;
    	   	N_label68 = 0;
    	   	N_label69 = 0;	    
    	   end
    	   else if(label6 == 7 & nk > 5) begin
    	   	N_label60 = 0;
    	   	N_label61 = 0;
    	   	N_label62 = 0;
    	   	N_label63 = 0;
    	   	N_label64 = 0;
    	   	N_label65 = 0;
    	   	N_label66 = 0;
    	   	N_label67 = 1;
    	   	N_label68 = 0;
    	   	N_label69 = 0;	 	   
    	   end
    	   else if(label6 == 8 & nk > 5) begin
    	   	N_label60 = 0;
    	   	N_label61 = 0;
    	   	N_label62 = 0;
    	   	N_label63 = 0;
    	   	N_label64 = 0;
    	   	N_label65 = 0;
    	   	N_label66 = 0;
    	   	N_label67 = 0;
    	   	N_label68 = 1;
    	   	N_label69 = 0;	 	   
    	   end
    	   else if(label6 == 9 & nk > 5) begin
    	   	N_label60 = 0;
    	   	N_label61 = 0;
    	   	N_label62 = 0;
    	   	N_label63 = 0;
    	   	N_label64 = 0;
    	   	N_label65 = 0;
    	   	N_label66 = 0;
    	   	N_label67 = 0;
    	   	N_label68 = 0;
    	   	N_label69 = 1;	 	   
    	   end
    	   else begin
    	        N_label60 = 0;
    	   	N_label61 = 0;
    	   	N_label62 = 0;
    	   	N_label63 = 0;
    	   	N_label64 = 0;
    	   	N_label65 = 0;
    	   	N_label66 = 0;
    	   	N_label67 = 0;
    	   	N_label68 = 0;
    	   	N_label69 = 0;	 
    	   end
    	   
    	   //increments the label of 7min without loops
     	   if(label7 == 0 & nk > 6) begin
    	   	N_label70 = 1;
    	   	N_label71 = 0;
    	   	N_label72 = 0;
    	   	N_label73 = 0;
    	   	N_label74 = 0;
    	   	N_label75 = 0;
    	   	N_label76 = 0;
    	   	N_label77 = 0;
    	   	N_label78 = 0;
    	   	N_label79 = 0;	 
    	   end
    	   else if(label7 == 1 & nk > 6) begin
    	   	N_label70 = 0;
    	   	N_label71 = 1;
    	   	N_label72 = 0;
    	   	N_label73 = 0;
    	   	N_label74 = 0;
    	   	N_label75 = 0;
    	   	N_label76 = 0;
    	   	N_label77 = 0;
    	   	N_label78 = 0;
    	   	N_label79 = 0;	   	   
    	   end
    	   else if(label7 == 2 & nk > 6) begin
    	   	N_label70 = 0;
    	   	N_label71 = 0;
    	   	N_label72 = 1;
    	   	N_label73 = 0;
    	   	N_label74 = 0;
    	   	N_label75 = 0;
    	   	N_label76 = 0;
    	   	N_label77 = 0;
    	   	N_label78 = 0;
    	   	N_label79 = 0;	 	   
    	   end
    	   else if(label7 == 3 & nk > 6) begin
    	   	N_label70 = 0;
    	   	N_label71 = 0;
    	   	N_label72 = 0;
    	   	N_label73 = 1;
    	   	N_label74 = 0;
    	   	N_label75 = 0;
    	   	N_label76 = 0;
    	   	N_label77 = 0;
    	   	N_label78 = 0;
    	   	N_label79 = 0;	    
    	   end
    	   else if(label7 == 4 & nk > 6) begin
    	   	N_label70 = 0;
    	   	N_label71 = 0;
    	   	N_label72 = 0;
    	   	N_label73 = 0;
    	   	N_label74 = 1;
    	   	N_label75 = 0;
    	   	N_label76 = 0;
    	   	N_label77 = 0;
    	   	N_label78 = 0;
    	   	N_label79 = 0;	   
    	   end
    	   else if(label7 == 5 & nk > 6) begin
    	   	N_label70 = 0;
    	   	N_label71 = 0;
    	   	N_label72 = 0;
    	   	N_label73 = 0;
    	   	N_label74 = 0;
    	   	N_label75 = 1;
    	   	N_label76 = 0;
    	   	N_label77 = 0;
    	   	N_label78 = 0;
    	   	N_label79 = 0;	   
    	   end
    	   else if(label7 == 6 & nk > 6) begin
    	   	N_label70 = 0;
    	   	N_label71 = 0;
    	   	N_label72 = 0;
    	   	N_label73 = 0;
    	   	N_label74 = 0;
    	   	N_label75 = 0;
    	   	N_label76 = 1;
    	   	N_label77 = 0;
    	   	N_label78 = 0;
    	   	N_label79 = 0;	   
    	   end
    	   else if(label7 == 7 & nk > 6) begin
    	   	N_label70 = 0;
    	   	N_label71 = 0;
    	   	N_label72 = 0;
    	   	N_label73 = 0;
    	   	N_label74 = 0;
    	   	N_label75 = 0;
    	   	N_label76 = 0;
    	   	N_label77 = 1;
    	   	N_label78 = 0;
    	   	N_label79 = 0;	 	   
    	   end
    	   else if(label7 == 8 & nk < 6) begin
    	   	N_label70 = 0;
    	   	N_label71 = 0;
    	   	N_label72 = 0;
    	   	N_label73 = 0;
    	   	N_label74 = 0;
    	   	N_label75 = 0;
    	   	N_label76 = 0;
    	   	N_label77 = 0;
    	   	N_label78 = 1;
    	   	N_label79 = 0;	  	   
    	   end
    	   else if(label7 == 9 & nk > 6) begin
    	   	N_label70 = 0;
    	   	N_label71 = 0;
    	   	N_label72 = 0;
    	   	N_label73 = 0;
    	   	N_label74 = 0;
    	   	N_label75 = 0;
    	   	N_label76 = 0;
    	   	N_label77 = 0;
    	   	N_label78 = 0;
    	   	N_label79 = 1;	 	   
    	   end
    	   else begin
    	        N_label70 = 0;
    	   	N_label71 = 0;
    	   	N_label72 = 0;
    	   	N_label73 = 0;
    	   	N_label74 = 0;
    	   	N_label75 = 0;
    	   	N_label76 = 0;
    	   	N_label77 = 0;
    	   	N_label78 = 0;
    	   	N_label79 = 0;	 
    	   end
    	   
    	   //increments the label of 8min without loops
     	   if(label8 == 0 & nk > 7) begin
    	   	N_label80 = 1;
    	   	N_label81 = 0;
    	   	N_label82 = 0;
    	   	N_label83 = 0;
    	   	N_label84 = 0;
    	   	N_label85 = 0;
    	   	N_label86 = 0;
    	   	N_label87 = 0;
    	   	N_label88 = 0;
    	   	N_label89 = 0;	 
    	   end
    	   else if(label8 == 1 & nk > 7) begin
    	   	N_label80 = 0;
    	   	N_label81 = 1;
    	   	N_label82 = 0;
    	   	N_label83 = 0;
    	   	N_label84 = 0;
    	   	N_label85 = 0;
    	   	N_label86 = 0;
    	   	N_label87 = 0;
    	   	N_label88 = 0;
    	   	N_label89 = 0;	 	   
    	   end
    	   else if(label8 == 2 & nk > 7) begin
    	   	N_label80 = 0;
    	   	N_label81 = 0;
    	   	N_label82 = 1;
    	   	N_label83 = 0;
    	   	N_label84 = 0;
    	   	N_label85 = 0;
    	   	N_label86 = 0;
    	   	N_label87 = 0;
    	   	N_label88 = 0;
    	   	N_label89 = 0;	 	   
    	   end
    	   else if(label8 == 3 & nk > 7) begin
    	   	N_label80 = 0;
    	   	N_label81 = 0;
    	   	N_label82 = 0;
    	   	N_label83 = 1;
    	   	N_label84 = 0;
    	   	N_label85 = 0;
    	   	N_label86 = 0;
    	   	N_label87 = 0;
    	   	N_label88 = 0;
    	   	N_label89 = 0;	    
    	   end
    	   else if(label8 == 4 & nk > 7) begin
    	   	N_label80 = 0;
    	   	N_label81 = 0;
    	   	N_label82 = 0;
    	   	N_label83 = 0;
    	   	N_label84 = 1;
    	   	N_label85 = 0;
    	   	N_label86 = 0;
    	   	N_label87 = 0;
    	   	N_label88 = 0;
    	   	N_label89 = 0;	    
    	   end
    	   else if(label8 == 5 & nk > 7) begin
    	   	N_label80 = 0;
    	   	N_label81 = 0;
    	   	N_label82 = 0;
    	   	N_label83 = 0;
    	   	N_label84 = 0;
    	   	N_label85 = 1;
    	   	N_label86 = 0;
    	   	N_label87 = 0;
    	   	N_label88 = 0;
    	   	N_label89 = 0;	 
    	   end
    	   else if(label8 == 6 & nk < 7) begin
    	   	N_label80 = 0;
    	   	N_label81 = 0;
    	   	N_label82 = 0;
    	   	N_label83 = 0;
    	   	N_label84 = 0;
    	   	N_label85 = 0;
    	   	N_label86 = 1;
    	   	N_label87 = 0;
    	   	N_label88 = 0;
    	   	N_label89 = 0;	    
    	   end
    	   else if(label8 == 7 & nk > 7) begin
    	   	N_label80 = 0;
    	   	N_label81 = 0;
    	   	N_label82 = 0;
    	   	N_label83 = 0;
    	   	N_label84 = 0;
    	   	N_label85 = 0;
    	   	N_label86 = 0;
    	   	N_label87 = 1;
    	   	N_label88 = 0;
    	   	N_label89 = 0;	 	   
    	   end
    	   else if(label8 == 8 & nk > 7) begin
    	   	N_label80 = 0;
    	   	N_label81 = 0;
    	   	N_label82 = 0;
    	   	N_label83 = 0;
    	   	N_label84 = 0;
    	   	N_label85 = 0;
    	   	N_label86 = 0;
    	   	N_label87 = 0;
    	   	N_label88 = 1;
    	   	N_label89 = 0;	 	   
    	   end
    	   else if(label8 == 9 & nk > 7) begin
    	   	N_label80 = 0;
    	   	N_label81 = 0;
    	   	N_label82 = 0;
    	   	N_label83 = 0;
    	   	N_label84 = 0;
    	   	N_label85 = 0;
    	   	N_label86 = 0;
    	   	N_label87 = 0;
    	   	N_label88 = 0;
    	   	N_label89 = 1;	  	   
    	   end
    	   else begin
    	        N_label80 = 0;
    	   	N_label81 = 0;
    	   	N_label82 = 0;
    	   	N_label83 = 0;
    	   	N_label84 = 0;
    	   	N_label85 = 0;
    	   	N_label86 = 0;
    	   	N_label87 = 0;
    	   	N_label88 = 0;
    	   	N_label89 = 0;	 
    	   end
    	   
    	   //increments the label of 9min without loops
     	   if(label9 == 0 & nk > 8) begin
    	   	N_label90 = 1;
    	   	N_label91 = 0;
    	   	N_label92 = 0;
    	   	N_label93 = 0;
    	   	N_label94 = 0;
    	   	N_label95 = 0;
    	   	N_label96 = 0;
    	   	N_label97 = 0;
    	   	N_label98 = 0;
    	   	N_label99 = 0;	 
    	   end
    	   else if(label9 == 1 & nk > 8) begin
    	   	N_label90 = 0;
    	   	N_label91 = 1;
    	   	N_label92 = 0;
    	   	N_label93 = 0;
    	   	N_label94 = 0;
    	   	N_label95 = 0;
    	   	N_label96 = 0;
    	   	N_label97 = 0;
    	   	N_label98 = 0;
    	   	N_label99 = 0;	 	   
    	   end
    	   else if(label9 == 2 & nk > 8) begin
    	   	N_label90 = 0;
    	   	N_label91 = 0;
    	   	N_label92 = 1;
    	   	N_label93 = 0;
    	   	N_label94 = 0;
    	   	N_label95 = 0;
    	   	N_label96 = 0;
    	   	N_label97 = 0;
    	   	N_label98 = 0;
    	   	N_label99 = 0;	   	   
    	   end
    	   else if(label9 == 3 & nk > 8) begin
    	   	N_label90 = 0;
    	   	N_label91 = 0;
    	   	N_label92 = 0;
    	   	N_label93 = 1;
    	   	N_label94 = 0;
    	   	N_label95 = 0;
    	   	N_label96 = 0;
    	   	N_label97 = 0;
    	   	N_label98 = 0;
    	   	N_label99 = 0;	   
    	   end
    	   else if(label9 == 4 & nk > 8) begin
    	   	N_label90 = 0;
    	   	N_label91 = 0;
    	   	N_label92 = 0;
    	   	N_label93 = 0;
    	   	N_label94 = 1;
    	   	N_label95 = 0;
    	   	N_label96 = 0;
    	   	N_label97 = 0;
    	   	N_label98 = 0;
    	   	N_label99 = 0;	    
    	   end
    	   else if(label9 == 5 & nk > 8) begin
    	   	N_label90 = 0;
    	   	N_label91 = 0;
    	   	N_label92 = 0;
    	   	N_label93 = 0;
    	   	N_label94 = 0;
    	   	N_label95 = 1;
    	   	N_label96 = 0;
    	   	N_label97 = 0;
    	   	N_label98 = 0;
    	   	N_label99 = 0;	 
    	   end
    	   else if(label9 == 6 & nk > 8) begin
    	   	N_label90 = 0;
    	   	N_label91 = 0;
    	   	N_label92 = 0;
    	   	N_label93 = 0;
    	   	N_label94 = 0;
    	   	N_label95 = 0;
    	   	N_label96 = 1;
    	   	N_label97 = 0;
    	   	N_label98 = 0;
    	   	N_label99 = 0;	    
    	   end
    	   else if(label9 == 7 & nk > 8) begin
    	   	N_label90 = 0;
    	   	N_label91 = 0;
    	   	N_label92 = 0;
    	   	N_label93 = 0;
    	   	N_label94 = 0;
    	   	N_label95 = 0;
    	   	N_label96 = 0;
    	   	N_label97 = 1;
    	   	N_label98 = 0;
    	   	N_label99 = 0;	  	   
    	   end
    	   else if(label9 == 8 & nk > 8) begin
    	   	N_label90 = 0;
    	   	N_label91 = 0;
    	   	N_label92 = 0;
    	   	N_label93 = 0;
    	   	N_label94 = 0;
    	   	N_label95 = 0;
    	   	N_label96 = 0;
    	   	N_label97 = 0;
    	   	N_label98 = 1;
    	   	N_label99 = 0;	  	   
    	   end
    	   else if(label9 == 9 & nk > 8) begin
    	   	N_label90 = 0;
    	   	N_label91 = 0;
    	   	N_label92 = 0;
    	   	N_label93 = 0;
    	   	N_label94 = 0;
    	   	N_label95 = 0;
    	   	N_label96 = 0;
    	   	N_label97 = 0;
    	   	N_label98 = 0;
    	   	N_label99 = 1;	  	   
    	   end
    	   else begin
    	        N_label90 = 0;
    	   	N_label91 = 0;
    	   	N_label92 = 0;
    	   	N_label93 = 0;
    	   	N_label94 = 0;
    	   	N_label95 = 0;
    	   	N_label96 = 0;
    	   	N_label97 = 0;
    	   	N_label98 = 0;
    	   	N_label99 = 0;	 
    	   end
    	   
    	   //increments the label of 10min without loops
     	   if(label10 == 0 & nk > 9) begin
    	   	N_label100 = 1;
    	   	N_label101 = 0;
    	   	N_label102 = 0;
    	   	N_label103 = 0;
    	   	N_label104 = 0;
    	   	N_label105 = 0;
    	   	N_label106 = 0;
    	   	N_label107 = 0;
    	   	N_label108 = 0;
    	   	N_label109 = 0;	 
    	   end
    	   else if(label10 == 1 & nk > 9) begin
    	   	N_label100 = 0;
    	   	N_label101 = 1;
    	   	N_label102 = 0;
    	   	N_label103 = 0;
    	   	N_label104 = 0;
    	   	N_label105 = 0;
    	   	N_label106 = 0;
    	   	N_label107 = 0;
    	   	N_label108 = 0;
    	   	N_label109 = 0;	   
    	   end
    	   else if(label10 == 2 & nk > 9) begin
    	   	N_label100 = 0;
    	   	N_label101 = 0;
    	   	N_label102 = 1;
    	   	N_label103 = 0;
    	   	N_label104 = 0;
    	   	N_label105 = 0;
    	   	N_label106 = 0;
    	   	N_label107 = 0;
    	   	N_label108 = 0;
    	   	N_label109 = 0;	   
    	   end
    	   else if(label10 == 3 & nk > 9) begin
    	   	N_label100 = 0;
    	   	N_label101 = 0;
    	   	N_label102 = 0;
    	   	N_label103 = 1;
    	   	N_label104 = 0;
    	   	N_label105 = 0;
    	   	N_label106 = 0;
    	   	N_label107 = 0;
    	   	N_label108 = 0;
    	   	N_label109 = 0;   
    	   end
    	   else if(label10 == 4 & nk > 9) begin
    	   	N_label100 = 0;
    	   	N_label101 = 0;
    	   	N_label102 = 0;
    	   	N_label103 = 0;
    	   	N_label104 = 1;
    	   	N_label105 = 0;
    	   	N_label106 = 0;
    	   	N_label107 = 0;
    	   	N_label108 = 0;
    	   	N_label109 = 0;	   
    	   end
    	   else if(label10 == 5 & nk > 9) begin
    	   	N_label100 = 0;
    	   	N_label101 = 0;
    	   	N_label102 = 0;
    	   	N_label103 = 0;
    	   	N_label104 = 0;
    	   	N_label105 = 1;
    	   	N_label106 = 0;
    	   	N_label107 = 0;
    	   	N_label108 = 0;
    	   	N_label109 = 0; 
    	   end
    	   else if(label10 == 6 & nk > 9) begin
    	   	N_label100 = 0;
    	   	N_label101 = 0;
    	   	N_label102 = 0;
    	   	N_label103 = 0;
    	   	N_label104 = 0;
    	   	N_label105 = 0;
    	   	N_label106 = 1;
    	   	N_label107 = 0;
    	   	N_label108 = 0;
    	   	N_label109 = 0;	   
    	   end
    	   else if(label10 == 7 & nk > 9) begin
    	   	N_label100 = 0;
    	   	N_label101 = 0;
    	   	N_label102 = 0;
    	   	N_label103 = 0;
    	   	N_label104 = 0;
    	   	N_label105 = 0;
    	   	N_label106 = 0;
    	   	N_label107 = 1;
    	   	N_label108 = 0;
    	   	N_label109 = 0; 	   
    	   end
    	   else if(label10 == 8 & nk > 9) begin
    	   	N_label100 = 0;
    	   	N_label101 = 0;
    	   	N_label102 = 0;
    	   	N_label103 = 0;
    	   	N_label104 = 0;
    	   	N_label105 = 0;
    	   	N_label106 = 0;
    	   	N_label107 = 0;
    	   	N_label108 = 1;
    	   	N_label109 = 0;	   
    	   end
    	   else if(label10 == 9 & nk > 9) begin
    	   	N_label100 = 0;
    	   	N_label101 = 0;
    	   	N_label102 = 0;
    	   	N_label103 = 0;
    	   	N_label104 = 0;
    	   	N_label105 = 0;
    	   	N_label106 = 0;
    	   	N_label107 = 0;
    	   	N_label108 = 0;
    	   	N_label109 = 1; 	   
    	   end
    	   else begin
    	        N_label100 = 0;
    	   	N_label101 = 0;
    	   	N_label102 = 0;
    	   	N_label103 = 0;
    	   	N_label104 = 0;
    	   	N_label105 = 0;
    	   	N_label106 = 0;
    	   	N_label107 = 0;
    	   	N_label108 = 0;
    	   	N_label109 = 0;
    	   end
    	   
    	   N_label0 = N_label10 + N_label20 + N_label30 + N_label40 + N_label50 + N_label60 + N_label70 + N_label80 + N_label90 + N_label100;
    	   N_label1 = N_label11 + N_label21 + N_label31 + N_label41 + N_label51 + N_label61 + N_label71 + N_label81 + N_label91 + N_label101;
    	   N_label2 = N_label12 + N_label22 + N_label32 + N_label42 + N_label52 + N_label62 + N_label72 + N_label82 + N_label92 + N_label102;
    	   N_label3 = N_label13 + N_label23 + N_label33 + N_label43 + N_label53 + N_label63 + N_label73 + N_label83 + N_label93 + N_label103;
    	   N_label4 = N_label14 + N_label24 + N_label34 + N_label44 + N_label54 + N_label64 + N_label74 + N_label84 + N_label94 + N_label104;
    	   N_label5 = N_label15 + N_label25 + N_label35 + N_label45 + N_label55 + N_label65 + N_label75 + N_label85 + N_label95 + N_label105;
    	   N_label6 = N_label16 + N_label26 + N_label36 + N_label46 + N_label56 + N_label66 + N_label76 + N_label86 + N_label96 + N_label106;
    	   N_label7 = N_label17 + N_label27 + N_label37 + N_label47 + N_label57 + N_label67 + N_label77 + N_label87 + N_label97 + N_label107;
    	   N_label8 = N_label18 + N_label28 + N_label38 + N_label48 + N_label58 + N_label68 + N_label78 + N_label88 + N_label98 + N_label108;
    	   N_label9 = N_label19 + N_label29 + N_label39 + N_label49 + N_label59 + N_label69 + N_label79 + N_label89 + N_label99 + N_label109;

    	   
    	   //compares N_labels to find point label no loops
    	   if(N_label0 >= N_label1 & N_label0 >= N_label2 & N_label0 >= N_label3 & N_label0 >= N_label4 & N_label0 >= N_label5 & N_label0 >= N_label6 & N_label0 >= N_label7 & N_label0 >= N_label8 & N_label0 >= N_label9) begin
    	     labelOUTaux = 0;
    	   end
    	   else if(N_label1 >= N_label0 & N_label1 >= N_label2 & N_label1 >= N_label3 & N_label1 >= N_label4 & N_label1 >= N_label5 & N_label1 >= N_label6 & N_label1 >= N_label7 & N_label1 >= N_label8 & N_label1 >= N_label9) begin
    	     labelOUTaux = 1;
    	   end
    	   else if(N_label2 >= N_label0 & N_label2 >= N_label1 & N_label2 >= N_label3 & N_label2 >= N_label4 & N_label2 >= N_label5 & N_label2 >= N_label6 & N_label2 >= N_label7 & N_label2 >= N_label8 & N_label2 >= N_label9) begin
    	     labelOUTaux = 2;
    	   end
    	   else if(N_label3 >= N_label0 & N_label3 >= N_label1 & N_label3 >= N_label2 & N_label3 >= N_label4 & N_label3 >= N_label5 & N_label3 >= N_label6 & N_label3 >= N_label7 & N_label3 >= N_label8 & N_label3 >= N_label9) begin
    	     labelOUTaux = 3;
    	   end
    	   else if(N_label4 >= N_label0 & N_label4 >= N_label1 & N_label4 >= N_label2 & N_label4 >= N_label3 & N_label4 >= N_label5 & N_label4 >= N_label6 & N_label4 >= N_label7 & N_label4 >= N_label8 & N_label4 >= N_label9) begin
    	     labelOUTaux = 4;
    	   end
    	   else if(N_label5 >= N_label0 & N_label5 >= N_label1 & N_label5 >= N_label2 & N_label5 >= N_label3 & N_label5 >= N_label4 & N_label5 >= N_label6 & N_label5 >= N_label7 & N_label5 >= N_label8 & N_label5 >= N_label9) begin
    	     labelOUTaux = 5;
    	   end
    	   else if(N_label6 >= N_label0 & N_label6 >= N_label1 & N_label6 >= N_label2 & N_label6 >= N_label3 & N_label6 >= N_label4 & N_label6 >= N_label5 & N_label6 >= N_label7 & N_label6 >= N_label8 & N_label6 >= N_label9) begin
    	     labelOUTaux = 6;
    	   end
    	   else if(N_label7 >= N_label0 & N_label7 >= N_label1 & N_label7 >= N_label2 & N_label7 >= N_label3 & N_label7 >= N_label4 & N_label7 >= N_label5 & N_label7 >= N_label6 & N_label7 >= N_label8 & N_label7 >= N_label9) begin
    	     labelOUTaux = 7;
    	   end
    	   else if(N_label8 >= N_label0 & N_label8 >= N_label1 & N_label8 >= N_label2 & N_label8 >= N_label3 & N_label8 >= N_label4 & N_label8 >= N_label5 & N_label8 >= N_label6 & N_label8 >= N_label7 & N_label8 >= N_label9) begin
    	     labelOUTaux = 8;
    	   end
    	   else if(N_label9 >= N_label0 & N_label9 >= N_label1 & N_label9 >= N_label2 & N_label9 >= N_label3 & N_label9 >= N_label4 & N_label9 >= N_label5 & N_label9 >= N_label6 & N_label9 >= N_label7 & N_label9 >= N_label8) begin
    	     labelOUTaux = 9;
    	   end
    	   else begin
    	     labelOUTaux = -1;
    	   end
    	end
    end
    `SIGNAL2OUT(Xlabel,labelOUTaux)
    
endmodule
