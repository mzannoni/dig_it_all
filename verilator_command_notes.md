# Basic commands for `tb_main.v` test-bench with Verilator

Compile and run:  
```
❯ cd work_verilator
❯ verilator --binary --build --trace -j 0 -top tb_main ../blind_cycler.v ../tb_main.v
❯ ./obj_dir/Vtb_main
```

Visualize waveforms with GTKWave:  
```
❯ gtkwave ../output/outwv.vcd&
```
