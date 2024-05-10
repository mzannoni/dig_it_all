# Basic commands for `tb_main.v` test-bench with Icarus Verilog

## Preliminary

It is recommended to work in a separate working folder:  
```
❯ mkdir work_v
```

If it exists, it's recommended to wipe it before starting a new simulation.  

## Simulation run

Compile and run:  
```
❯ cd work_v
❯ iverilog -o test ../v_src/blind_cycler.v ../v_src/tb_main.v
❯ vvp test
```

Visualize waveforms with GTKWave:  
```
❯ gtkwave ../output/outwv.vcd&
```
