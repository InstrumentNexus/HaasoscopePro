
## 50MHz FPGA main clock (usually generated by oscillator)
create_clock -name clk50    -period  20.000  [get_ports clk50]            

## 60MHz FT232H chip clock (generated by FT232H)
create_clock -name ftdi_clk -period  16.667  [get_ports ftdi_clk]        

## Declare that these two clocks are asynchronous
set_clock_groups -asynchronous -group {clk50} -group {ftdi_clk}           

