# SimpleProcessor
This is a 16-bit simple processor written in SystemVerilog. It has a controller and a datapath module. 
Both modules are connected with multiple address, data, and controller buses.
It can add and subtract two numbers, store data, load data, has no operation, and halt.

The Controller has ROM, instruction register, state machine, and program counter. Instructions are saved in the ROM.

The datapath has RAM, 16-bit mux, 16x16 register file, and ALU. RAM has data saved.


Lastly, each module had been simulated with its testbench, and the top level module had been emulated on DE2-115 to debug.

To check each module's detail, please check SimpleProject.docx(https://docs.google.com/document/d/1udIptBi3uGzLuEvmSvigkzLvhxrYNhYG/edit?usp=sharing&ouid=115632453977737866904&rtpof=true&sd=true)


DEMO video: https://drive.google.com/file/d/1zyvEdDL0EP5kUAi6qQiFTYZmS470VuCc/view?usp=share_link


*correction: Instead of the term ROM, which has instructions stored, it should be L1i (level 1 cache instruction).
             And Instead of RAM, it should be L1d (level 1 cache data).
