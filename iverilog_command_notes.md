# Basic commands for `tb_main.v` test-bench with Icarus Verilog

Compile and run:  
```
❯ cd work_v
❯ iverilog -o test ../blind_cycler.v ../tb_main.v
❯ vvp test
```

Visualize waveforms with GTKWave:  
```
❯ gtkwave ../output/outwv.vcd&
```
