# Ignore warnings

As usual, it is not recommended to ignore warnings, but rather to fix the code to prevent them.  

In this specific example it is ignored a warning that occurs when an assignments is done such that the left had variable is assigned a variable with a smaller width.  

To ignore warnings the `verilator` option is `-Wno_<WARNINGNAME>`, where `<WARNINGNAME>` is the name of the warning to ignore.  

For instance:  
```
verilator --binary --build --trace -Wno-WIDTHEXPAND -j 0 ../sv/tb_countones_tst.sv
```
