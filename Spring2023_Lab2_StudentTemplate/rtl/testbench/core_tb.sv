//***********************************************************
// ECE 3058 Architecture Concurrency and Energy in Computation
//
// RISCV Processor System Verilog Behavioral Model
//
// School of Electrical & Computer Engineering
// Georgia Institute of Technology
// Atlanta, GA 30332
//
//  Engineer:   Zou, Ivan
//  Module:     core_tb
//  Functionality:
//      This is the testbed for the 5 Stage Pipeline RISCV processor
//
//***********************************************************
`timescale 1ns / 1ns

module Core_tb;

// Clock and Reset signals to simulate as input into core
	logic clk = 1;
	logic mem_enable;
	logic reset;

	// local variables to display for testbench
	logic[6:0] cycle_count;
	
	integer i;
	initial
	begin
		cycle_count = 0;

		// do the simulation
		$dumpfile("Core_Simulation.vcd");

		// dump all the signals into the vcd waveforem file
		$dumpvars(0, Core_tb);

		reset = 1'b1;
		mem_enable = 1'b1;

		// Set the Test instructions and preset MEM and Regfile here if desired

		// Start Testbench Test Instructions. First instruction should always be a NOP

		#1 

		/* Test 1
	// NOP 
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[0] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[1] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[2] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[3] = 8'h00;

    // // add x5, x5, x2
	// core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[4] = 8'h00;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[5] = 8'h22;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[6] = 8'h82;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[7] = 8'hb3;

    // // sub x4, x12, x7
	// core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[8] = 8'h40;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[9] = 8'h76;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[10] = 8'h02;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[11] = 8'h33;
	*/

/* // Functional 
    // NOP 
		core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[0] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[1] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[2] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[3] = 8'h00;

	// NOP 
		core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[4] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[5] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[6] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[7] = 8'h00;

	// NOP 
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[8] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[9] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[10] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[11] = 8'h00;

	//addi x9, x2, -20
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[12] = 8'hfe;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[13] = 8'hc1;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[14] = 8'h04;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[15] = 8'h93;

	//add x10, x11, x12
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[16] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[17] = 8'hc5;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[18] = 8'h85;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[19] = 8'h33;

	//lw x8, 0(x0)
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[20] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[21] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[22] = 8'h24;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[23] = 8'h03;

	//sub x20, x3, x6
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[24] = 8'h40;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[25] = 8'h61;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[26] = 8'h8a;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[27] = 8'h33;

	//slt x21, x18, x19
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[28] = 8'h01;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[29] = 8'h39;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[30] = 8'h2a;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[31] = 8'hb3;

	//jal x11, 20
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[32] = 8'h01;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[33] = 8'h40;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[34] = 8'h05;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[35] = 8'hef;

	*/
	// core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[36] = 8'h40;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[37] = 8'h76;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[38] = 8'h02;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[39] = 8'h33;

// Simple write back stall case
	// // NOP 
	// 	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[0] = 8'h00;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[1] = 8'h00;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[2] = 8'h00;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[3] = 8'h00;

	// // lw x9, 0(x0) 
	// 	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[4] = 8'h00;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[5] = 8'h00;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[6] = 8'h24;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[7] = 8'h83;

	// // add x1, x9, x2
	// core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[8] = 8'h00;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[9] = 8'h24;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[10] = 8'h80;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[11] = 8'hb3;

	// //lw x8, 4(x0)
	// core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[12] = 8'h00;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[13] = 8'h40;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[14] = 8'h24;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[15] = 8'h03;

	// //add x3, x8, x6
	// core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[16] = 8'h00;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[17] = 8'h64;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[18] = 8'h01;
    // core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[19] = 8'hb3;

/*//Task 2 Simple
	// NOP 
		core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[0] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[1] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[2] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[3] = 8'h00;

	// add x1, x2, x3 
		core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[4] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[5] = 8'h31;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[6] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[7] = 8'hb3;

	// add x2, x3, x4 
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[8] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[9] = 8'h41;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[10] = 8'h81;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[11] = 8'h33;

	//add x3, x4, x5
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[12] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[13] = 8'h52;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[14] = 8'h01;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[15] = 8'hb3;

	//add x4, x1, x2
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[16] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[17] = 8'h20;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[18] = 8'h82;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[19] = 8'h33;
*/
	
/*	// Task2 complex 
    // NOP 
		core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[0] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[1] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[2] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[3] = 8'h00;

	// NOP 
		core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[4] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[5] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[6] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[7] = 8'h00;

	// NOP 
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[8] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[9] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[10] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[11] = 8'h00;

	//add x4, x1, x2
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[12] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[13] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[14] = 8'h24;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[15] = 8'h83;

	//lw x8, 4(x0)
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[16] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[17] = 8'h40;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[18] = 8'h24;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[19] = 8'h03;

	//lw x7, 0(x0)
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[20] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[21] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[22] = 8'h23;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[23] = 8'h83;

	//lw x1, 0(x0)
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[24] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[25] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[26] = 8'h20;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[27] = 8'h83;

	// NOP
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[28] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[29] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[30] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[31] = 8'h00;

	// NOP
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[32] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[33] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[34] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[35] = 8'h00;

	//lw x1, 4(x0)
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[36] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[37] = 8'h40;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[38] = 8'h20;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[39] = 8'h83;

	
	//add x2, x2, x7
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[40] = 8'h00;
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[41] = 8'h71;
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[42] = 8'h01;
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[43] = 8'h33;
	
	//lw x3, 4(x0)
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[44] = 8'h00;
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[45] = 8'h40;
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[46] = 8'h21;
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[47] = 8'h83;

	//add x4, x3, x20
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[48] = 8'h01;
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[49] = 8'h41;
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[50] = 8'h82;
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[51] = 8'h33;
	
*/

// Task3 General 
    // NOP 
		core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[0] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[1] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[2] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[3] = 8'h00;

	// addi x8, x0, -5 
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[4] = 8'hff;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[5] = 8'hb0;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[6] = 8'h04;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[7] = 8'h13;

	// add x8, x0, x5
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[8] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[9] = 8'h50 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[10] = 8'h04 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[11] = 8'h33;

	//sub x9, x6, x8
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[12] = 8'h40 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[13] = 8'h83 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[14] = 8'h04 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[15] = 8'hb3;

	//lw x9, 0(x0)
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[16] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[17] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[18] = 8'h24 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[19] = 8'h83;

	//add x9, x9, x8
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[20] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[21] = 8'h84 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[22] = 8'h84 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[23] = 8'hb3;

	//sub x9, x9, x8
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[24] = 8'h40 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[25] = 8'h84;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[26] = 8'h84;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[27] = 8'hb3;

	// add x12, x9, x8
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[28] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[29] = 8'h84 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[30] = 8'h86 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[31] = 8'h33;

	// slt x11, x8, x9
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[32] = 8'h00;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[33] = 8'h94 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[34] = 8'h25 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[35] = 8'hb3;

	//sub x2, x0, x11
	core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[36] = 8'h40 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[37] = 8'hb0 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[38] = 8'h01 ;
    core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[39] = 8'h33;

	

		#6 reset = 1'b0;

		#50 $finish;
	end

	always
		#1 clk <= clk + 1;

	always @(posedge clk) begin
		if (~reset)
			cycle_count <= cycle_count + 1;
	end

	Core core_proc(
		// Inputs
		.clock(clk),
		.reset(reset),
		.mem_en(mem_enable)
	);

endmodule
