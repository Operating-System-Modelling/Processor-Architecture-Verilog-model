/**
 * Stall control logic for a 5 stage RISCV processor. 
 * Generates stall signals based on hazard detection, including:
 * - Load use stalls
 * - Write after read and write after write register hazards
*/
//***********************************************************
// ECE 3058 Architecture Concurrency and Energy in Computation
//
// RISCV Processor System Verilog Behavioral Model
//
// School of Electrical & Computer Engineering
// Georgia Institute of Technology
// Atlanta, GA 30332
//
//  Module:     core_tb
//  Functionality:
//      Stall Controller for a 5 Stage RISCV Processor
//
//***********************************************************
import CORE_PKG::*;

module Stall_Control (
  input logic reset, 

  input logic [6:0] ID_instr_opcode_ip,
  input logic [4:0] ID_src1_addr_ip,
  input logic [4:0] ID_src2_addr_ip,

  //The destination register from the different stages
  input logic [4:0] EX_reg_dest_ip,  // destination register from EX pipe
  input logic [4:0] LSU_reg_dest_ip,
  input logic [4:0] WB_reg_dest_ip,
  input logic WB_write_reg_en_ip,

  // The opcode of the current instr. in ID/EX
  input [6:0] EX_instr_opcode_ip,
  
  input logic fw_en_ip, //Ashan's change - forwarding enable signal
  output logic stall_op
);

  always_comb begin
    stall_op = 1'b0;
    case(ID_instr_opcode_ip) 

      OPCODE_OP: begin
        
        /**
        * Task 1
        * 
        * Here you will need to decide when to pull the stall control logic high. 
        * 
        * 1. Load to use stalls
        * 2. Stalls when reading and writing from Register File
        * For Register Register instructions, what registers are relevant
        */

        //Ashan's change
        // Checks if there is no forwarding involved, then that at either rs1 or rs2 is not zero
        //It then checks if it is a load instruction, if current instruction is needing a register  rs1 or rs2 then stall
        // if instruction needs a value from write back stall, if needed from memory it is forwarded
        if(fw_en_ip == 1'b0) begin
        if (ID_src1_addr_ip !=0 && ID_src2_addr_ip !=0) begin
          if (((EX_instr_opcode_ip == 7'b0000011) && ((EX_reg_dest_ip == ID_src1_addr_ip) || (EX_reg_dest_ip == ID_src2_addr_ip))) ||


          (!((LSU_reg_dest_ip == ID_src1_addr_ip) )&&
          ((WB_reg_dest_ip == ID_src1_addr_ip) )) ||

          (((LSU_reg_dest_ip != ID_src2_addr_ip)) &&
          ((WB_reg_dest_ip == ID_src2_addr_ip) && (WB_write_reg_en_ip == 1'b1)))  
           ) begin
            stall_op = 1'b1;
          end
        end
        end

        //Ashan's change

      end

      OPCODE_OPIMM: begin

        /**
        * Task 1
        * 
        * Here you will need to decide when to pull the stall control logic high. 
        * 
        * 1. Load to use stalls
        * 2. Stalls when reading and writing from Register File
        * For Register Immedite instructions, what registers are relevant
        */
        //Ashan's change
        // Checks if there is no forwarding involved, then that at either rs1 is not zero
        //It then checks if it is a load instruction, if current instruction is needing a register  rs1  then stall
        // if instruction needs a value from write back stall, if needed from memory it is forwarded
        if(fw_en_ip == 1'b0) begin
        if (ID_src1_addr_ip != 0) begin
          if (((EX_reg_dest_ip == ID_src1_addr_ip)  && (EX_instr_opcode_ip == 7'b0000011 )) ||

          (((LSU_reg_dest_ip != ID_src1_addr_ip))&&
          ((WB_reg_dest_ip == ID_src1_addr_ip) && (WB_write_reg_en_ip == 1'b1)))    
           ) begin
            stall_op = 1'b1;
          end
        end
        end
        //Ashan's change

      end

      default: begin
        stall_op = 1'b0;
      end
    endcase
  end

endmodule
