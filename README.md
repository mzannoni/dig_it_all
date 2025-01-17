<p align="center">
  <img src="doc/logo/logo.png" width="200"/>
</p>

# dig_it_all

Workspace to learn basic digital design techniques and languages.

## Current content

- Simple VHDL example, which I'm using to refresh my familiarity with digital design and to learn [GHDL](https://github.com/ghdl/ghdl).
- Same example, implemented in Verilog, used mostly to learn the language and to learn about 2 tools: [Icarus Verilog](https://github.com/steveicarus/iverilog) and [Verilator](https://github.com/verilator/verilator)

## Getting started

A first VHDL [test-bench](./vhdl_src/tb_main.vhdl) for a simple [sequence cycler](./vhdl_src/blind_cycler.vhdl) can be run following the basics steps noted down [here](./doc/ghdl_command_notes.md).  
An [equivalent example](./v_src/tb_main.v) in Verilog can be run following the steps noted [here](./doc/iverilog_command_notes.md).

## TODO:
- [ ] create a proper script for GHDL (e.g. based on [GHDL command notes](./ghdl_command_notes.md)).
- [x] implement blind_cycler in Verilog (sim with [Icarus Verilog](https://github.com/steveicarus/iverilog))
- [x] ~~implement blind_cycler in SystemVerilog (sim with [Verilator](https://github.com/verilator/verilator))~~ no need, same as Verilog
- [x] separate source files according to language
- [ ] Verilator examples with Make and CMake
