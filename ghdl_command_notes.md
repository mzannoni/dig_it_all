# Basic commands for `tb_main.vhdl` test-bench

Analyze, elaborate and run:  
```
❯ ghdl -a --workdir=work_vhdl *.vhdl
❯ ghdl -e --workdir=work_vhdl tb_main
❯ ghdl -r --workdir=work_vhdl tb_main --wave=output/outwv.ghw --stop-time=20us
```

And to visualize with GTKWave:
```
❯ gtkwave output/outwv.ghw &
```
