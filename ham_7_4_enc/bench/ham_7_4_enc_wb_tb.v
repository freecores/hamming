
`timescale 1ns / 1ps
module stimulus(CLK_I,RST_I,STB_I,WE_I,CYC_I,DAT_I,ADR_I,DAT_O,ACK_O,CODEWORD,DV_OUT);

output  CLK_I;
reg  CLK_I;
output  RST_I;
reg  RST_I;
output  STB_I;
reg  STB_I;
output  WE_I;
reg  WE_I;
output  CYC_I;
reg  CYC_I;
output [7:0] DAT_I;
reg [7:0] DAT_I;
output  ADR_I;
reg  ADR_I;
input [7:0] DAT_O;
input  ACK_O;
input [7:0] CODEWORD;
input  DV_OUT;


initial
  begin                  //SIGNAL CLK_I
        CLK_I = 1'b0;
  end


always
begin
        #20
        CLK_I =! CLK_I;
end

//////////////////////////////////////////////////
initial
  begin                  //SIGNAL RST_I
        RST_I = 1'b1;
        #200
        RST_I = 1'b0;
  end

//////////////////////////////////////////////////

initial
  begin                  //SIGNAL STB_I
        STB_I = 1'b0;
        #400
        STB_I = 1'b1;
        #40
        STB_I = 1'b0;
        #40
        STB_I = 1'b1;
        #200
        STB_I = 1'b0;
  end
           
        
//////////////////////////////////////////////////

initial
  begin                  //SIGNAL WE_I
        WE_I = 1'b1;
  end

//////////////////////////////////////////////////
initial
  begin                  //SIGNAL CYC_I
        CYC_I = 1'b1;
  end

//////////////////////////////////////////////////
initial
  begin                  //SIGNAL DAT_I
        DAT_I = 8'h00;
        #400
        DAT_I = 8'h01;
        #40
        DAT_I = 8'h00;
        #40
        DAT_I = 8'h02;
        #40
        DAT_I = 8'h03;
        #40
        DAT_I = 8'h04;
        #40
        DAT_I = 8'h05;
        #40
        DAT_I = 8'h06;
        #40
        DAT_I = 8'h00;
     
  end   

//////////////////////////////////////////////////
initial
  begin                  //SIGNAL ADR_I
        ADR_I = 1'b0;
  end

//////////////////////////////////////////////////
initial
  begin                  //SIGNAL ADR_I
        ADR_I = 1'b0;
  end
           
//////////////////////////////////////////////////
  initial  
    #10000 $finish;   
           
endmodule
           
//Test bench module   
module testbench;
        
wire  CLK_I;
wire  RST_I;
wire  STB_I;
wire  WE_I;
wire  CYC_I;
wire [7:0] DAT_I;
wire  ADR_I;
wire [7:0] DAT_O;
wire  ACK_O;
wire [7:0] CODEWORD;
wire  DV_OUT;
     
//Instantiation of the stimulus module.
stimulus stimulus_0(CLK_I,RST_I,STB_I,WE_I,CYC_I,DAT_I,ADR_I,DAT_O,ACK_O,CODEWORD,DV_OUT);

  
//Instantiation of the product module.
ham_7_4_enc ham_7_4_enc_0(
        .CLK_I(CLK_I),
        .RST_I(RST_I),
        .STB_I(STB_I),
        .WE_I(WE_I),
        .CYC_I(CYC_I),
        .DAT_I(DAT_I),
        .ADR_I(ADR_I),
        .DAT_O(DAT_O),
        .ACK_O(ACK_O),
        .CODEWORD(CODEWORD),
        .DV_OUT(DV_OUT)
        );  

endmodule   