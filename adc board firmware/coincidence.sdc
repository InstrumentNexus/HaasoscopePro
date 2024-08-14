
## 50MHz FPGA main clock (usually generated by oscillator)
create_clock -name clk50    -period  20.000  [get_ports clk50]

## 50MHz external clock
create_clock -name clk_ext   -period  20.000  [get_ports clk_ext]

## 60MHz FT232H chip clock (generated by FT232H)
create_clock -name ftdi_clk -period  16.666  [get_ports ftdi_clk]

## The clk for adjusting the pll phase
create_clock -name scanclk -period 10.000   [get_nodes command_processor:inst1|scanclk]


derive_pll_clocks
derive_clock_uncertainty -add


## Declare that these two clocks are asynchronous
set_clock_groups -asynchronous -group {clk50 clk_ext *pll1|clk[0]* *pll1|clk[1]* *pll1|clk[2]*} -group {ftdi_clk} -group {scanclk}

#IO constraints
set_max_delay -to [get_ports ftdi_*] 10
set_min_delay -to [get_ports ftdi_*] 0
set_max_delay -from [get_ports ftdi_*] 10
set_min_delay -from [get_ports ftdi_*] 0
set_max_delay -from [get_ports lvds1in*] 10
set_min_delay -from [get_ports lvds1in*] 0