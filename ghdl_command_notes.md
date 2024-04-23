# Basic commands for `tb_main` test-bench

Analyze, elaborate and run:  
```
❯ ghdl -a --workdir=work *.vhdl
❯ ghdl -e --workdir=work tb_main
❯ ghdl -r --workdir=work tb_main --wave=output/outwv.ghw --stop-time=20us
```

And to visualize with GTKWave:
```
❯ gtkwave output/outwv.ghw &
```
