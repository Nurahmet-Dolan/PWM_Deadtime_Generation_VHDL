`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////



module top_level_tb;
    reg clk;
    reg rst;
    wire pwm_out1;
    wire pwm_out2;
    
    top_level dut (
    .clk(clk),
    .rst(rst),
    .pwm_out1(pwm_out1),
    .pwm_out2(pwm_out2));
    
initial begin
    clk = 0;
    rst = 1;
    #500;
    rst = 0;
end 

    always #2.5 clk =~clk;   
    
endmodule