# SimpleProcessor
This is a 16-bit simple processor written in SystemVerilog with a controller and a datapath module. 
Both modules are connected with multiple address, data, and controller buses.
It can add and subtract two numbers, store data, load data, has no operation, and halt.

The Controller has ROM, instruction register, state machine, and program counter. Instructions are saved in the ROM.

The datapath has RAM, 16-bit mux, 16x16 register file, and ALU. RAM has data saved.


Lastly, each module had been simulated with its testbench, and the top level module had been emulated on DE2-115 to debug.
