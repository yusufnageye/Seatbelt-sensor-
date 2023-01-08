module seatbelt(KEY0,KEY1,SW,LEDR,CLOCK_50); input KEY0;
input KEY1;
input SW;
input CLOCK_50; output reg LEDR; reg RST;
clk_xx (CLOCK_50, RST, FLASHING); always @(KEY0,KEY1,SW,LEDR,CLOCK_50) if(KEY1==1 && KEY0==0 && SW==0)
begin
LEDR=FLASHING;
RST=1;
end
else if(SW==1)
begin
LEDR=0;
RST=0;
end
else if (KEY1==0 && (KEY0 ==1 || KEY0== 0)) begin
LEDR=0;
end
else
begin
LEDR=0;
end
endmodule
module clk_xx (input CLOCK_50, RST, output reg CLOCK_MODULE);
reg[35:0] counter; integer a =0;
parameter xx = 32'd12500000;
always @(posedge CLOCK_50) begin
 
begin if(RST==0) begin
a=0;
end
else
begin counter<=counter+1;
if(counter>=xx && a < 20)
begin
counter<=35'b0;
CLOCK_MODULE <= !CLOCK_MODULE; a=a+1;
end
else if(a==20)
begin CLOCK_MODULE<=1; counter <= 35'b0;
end
end
end
end
endmodule
