`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory  1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
//we will store the machine code for a code written in C later. for now initialize 
//each entry to be its index * 3 (memory[i] = i * 3;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the memory, output the contents of that specific 
//address. for data memory we are using 1K word of storage space. for the instruction memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 


////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output [31:0] Instruction;    // Instruction at memory location Address
    
    /* Please fill in the implementation here */
    
    reg [31:0] memory [1023:0];
    
    integer i;
    
    initial begin
    
        $display("Address = %h", Address);
    
        //$readmemh("C:/Users/megzu/OneDrive - University of Arizona/ECE 369/Lab 4/MIPS tests/addi_$t1_$zero_6.mem", memory);
        //$readmemh("C:/Users/meganzupancic/Downloads/test.mem", memory); 
        $readmemh("C:/Users/athiel/Downloads/testv2.mem", memory);
        
        
        $display("Memory Contents:");
        
        for (i = 0; i < 100; i = i + 1) begin
            $display("Address %0d: %h", i, memory[i]);
        end
        ////////LAB 1//////////////////////////////////////////
        //integer i;
    
        //initial begin
        //    for (i = 0; i < 128; i = i + 1) begin
        //        Memory[i] <= i * 3;
        //    end
        //end
        ///////////////////////////////////////////////////////
    
    
    end
    
    //always @(posedge Clk_in) begin // mixed level sensitive and edge triggered event controls are not supported for synthesis: posedge Clk_in, Address
            //Instruction <= memory[Address[10:2]];   
    //end
    assign Instruction = memory[Address[10:2]];

endmodule