# Basic commands for `tb_main.v` test-bench with Verilator

## Preliminary

It is recommended to work in a separate working folder:  
```
❯ mkdir work_verilator
```

If it exists, it's recommended to wipe it before starting a new simulation.  

## Simulation run

Compile and run:  
```
❯ cd work_verilator
❯ verilator --binary --build --trace -j 0 -top tb_main ../v_src/blind_cycler.v ../v_src/tb_main.v
❯ ./obj_dir/Vtb_main
```

Visualize waveforms with GTKWave:  
```
❯ gtkwave ../output/outwv.vcd&
```
