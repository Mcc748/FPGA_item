`timescale  1ns/1ns
////////////////////////////////////////////////////////////////////////
// Author        : EmbedFire
// Create Date   : 2019/03/21
// Module Name   : tb_spi_flash_be
// Project Name  : spi_flash_be
// Target Devices: Altera EP4CE10F17C8N
// Tool Versions : Quartus 13.0
// Description   : spi_flash_be顶层模块仿真文件
//
// Revision      : V1.0
// Additional Comments:
// 
// 实验平台: 野火_征途Pro_FPGA开发板
// 公司    : http://www.embedfire.com
// 论坛    : http://www.firebbs.cn
// 淘宝    : https://fire-stm32.taobao.com
////////////////////////////////////////////////////////////////////////

module  tb_spi_flash_be();

//wire  define
wire    cs_n;
wire    sck ;
wire    mosi ;

//reg   define
reg     clk     ;
reg     rst_n   ;
reg     key     ;

//时钟、复位信号、模拟按键信号
initial
    begin
        clk =   0;
        rst_n   <=  0;
        key <=  0;
        #100
        rst_n   <=  1;
        #1000
        key <=  1;
        #20
        key <=  0;
    end

always  #10 clk <=  ~clk;

defparam memory.mem_access.initfile = "initmemory.txt";

//-------------spi_flash_erase-------------
spi_flash_be    spi_flash_be_inst
(
    .sys_clk    (clk    ),  //系统时钟，频率50MHz
    .sys_rst_n  (rst_n  ),  //复位信号,低电平有效
    .pi_key     (key    ),  //按键输入信号

    .sck        (sck    ),  //串行时钟
    .cs_n       (cs_n   ),  //片选信号
    .mosi       (mosi   )   //主输出从输入数据
);

m25p16  memory
(
    .c          (sck    ),  //输入串行时钟,频率12.5Mhz,1bit
    .data_in    (mosi   ),  //输入串行指令或数据,1bit
    .s          (cs_n   ),  //输入片选信号,1bit
    .w          (1'b1   ),  //输入写保护信号,低有效,1bit
    .hold       (1'b1   ),  //输入hold信号,低有效,1bit

    .data_out   (       )   //输出串行数据
);

endmodule