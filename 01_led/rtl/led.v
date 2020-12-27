`timescale  1ns/1ns
///////////////////////////////////////////////////////////////////////////
// Author        : EmbedFire
// Create Date   : 2019/03/12
// Module Name   : led
// Project Name  : led
// Target Devices: Altera EP4CE10F17C8N
// Tool Versions : Quartus 13.0
// Description   : 按键控制LED灯 
// 论坛    : http://www.firebbs.c
//////////////////////////////////////////////////////////////////////////

module  led
(
    input   wire    key_in  ,   //输入按键

    output  wire    led_out     //输出控制led灯
);

//********************************************************************//
//***************************** Main Code ****************************//
//********************************************************************//
//led_out:led灯输出的结果为key_in按键的输入值
assign  led_out = key_in;

endmodule
