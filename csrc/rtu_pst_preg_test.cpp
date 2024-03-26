#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "Vrtu_pst_preg.h"
#include "verilated.h"

int main(int argc, char **argv)
{
    VerilatedContext *contextp = new VerilatedContext;
    contextp->commandArgs(argc, argv);
    Vrtu_pst_preg *rtu_pst_preg = new Vrtu_pst_preg(contextp);

    rtu_pst_preg->clk = 0;
    rtu_pst_preg->rst_clk = 1;
    rtu_pst_preg->rtu_global_flush = 0;
    rtu_pst_preg->idu_rtu_ir_preg_alloc_vld = 0;
    rtu_pst_preg->idu_rtu_pst_create_vld = 0;
    rtu_pst_preg->idu_rtu_pst_create_preg_index = 0;
    rtu_pst_preg->idu_rtu_pst_create_iid = 0;
    rtu_pst_preg->idu_rtu_pst_create_gpr_index = 0;
    rtu_pst_preg->idu_rtu_pst_create_gpr_pre_preg_index = 0;
    rtu_pst_preg->x_inst_retire_iid = 0;
    rtu_pst_preg->x_retire_vld = 0;
    rtu_pst_preg->idu_rtu_pst_wb_vld = 0;
    rtu_pst_preg->eval();

    rtu_pst_preg->rst_clk = 0;
    rtu_pst_preg->eval();
    // printf("%d %lld\n", rtu_pst_preg->alloc_preg_vld, rtu_pst_preg->alloc_preg);

    // reset test
    rtu_pst_preg->rst_clk = 1;
    rtu_pst_preg->eval();
    rtu_pst_preg->clk = 1;
    rtu_pst_preg->eval();
    rtu_pst_preg->clk = 0;
    rtu_pst_preg->eval();
    printf("%d %lld\n", rtu_pst_preg->alloc_preg_vld, rtu_pst_preg->alloc_preg);

    rtu_pst_preg->idu_rtu_ir_preg_alloc_vld = 1;
    rtu_pst_preg->idu_rtu_pst_create_vld = 1;
    rtu_pst_preg->idu_rtu_pst_create_preg_index = (rtu_pst_preg->alloc_preg) ? rtu_pst_preg->alloc_preg : 0;
    rtu_pst_preg->idu_rtu_pst_create_iid = 0;
    rtu_pst_preg->idu_rtu_pst_create_gpr_index = 15;
    rtu_pst_preg->idu_rtu_pst_create_gpr_pre_preg_index = 15;
    rtu_pst_preg->x_inst_retire_iid = 0;
    rtu_pst_preg->x_retire_vld = 0;
    rtu_pst_preg->idu_rtu_pst_wb_vld = 0;
    rtu_pst_preg->clk = 1;
    rtu_pst_preg->eval();
    rtu_pst_preg->clk = 0;
    rtu_pst_preg->eval();
    printf("%d %lld\n", rtu_pst_preg->alloc_preg_vld, rtu_pst_preg->alloc_preg);

    rtu_pst_preg->idu_rtu_ir_preg_alloc_vld = 1;
    rtu_pst_preg->idu_rtu_pst_create_vld = 1;
    rtu_pst_preg->idu_rtu_pst_create_preg_index = (rtu_pst_preg->alloc_preg) ? rtu_pst_preg->alloc_preg : 0;
    rtu_pst_preg->idu_rtu_pst_create_iid = 1;
    rtu_pst_preg->idu_rtu_pst_create_gpr_index = 16;
    rtu_pst_preg->idu_rtu_pst_create_gpr_pre_preg_index = 16;
    rtu_pst_preg->x_inst_retire_iid = 0;
    rtu_pst_preg->x_retire_vld = 0;
    rtu_pst_preg->idu_rtu_pst_wb_vld = (long long)1 << 32;
    rtu_pst_preg->clk = 1;
    rtu_pst_preg->eval();
    rtu_pst_preg->clk = 0;
    rtu_pst_preg->eval();
    printf("%d %lld\n", rtu_pst_preg->alloc_preg_vld, rtu_pst_preg->alloc_preg);

    rtu_pst_preg->idu_rtu_ir_preg_alloc_vld = 1;
    rtu_pst_preg->idu_rtu_pst_create_vld = 1;
    rtu_pst_preg->idu_rtu_pst_create_preg_index = (rtu_pst_preg->alloc_preg) ? rtu_pst_preg->alloc_preg : 0;
    rtu_pst_preg->idu_rtu_pst_create_iid = 2;
    rtu_pst_preg->idu_rtu_pst_create_gpr_index = 17;
    rtu_pst_preg->idu_rtu_pst_create_gpr_pre_preg_index = 17;
    rtu_pst_preg->x_inst_retire_iid = 0;
    rtu_pst_preg->x_retire_vld = 1;
    rtu_pst_preg->idu_rtu_pst_wb_vld = (long long)1 << 33;
    rtu_pst_preg->clk = 1;
    rtu_pst_preg->eval();
    rtu_pst_preg->clk = 0;
    rtu_pst_preg->eval();
    printf("%d %lld\n", rtu_pst_preg->alloc_preg_vld, rtu_pst_preg->alloc_preg);

    rtu_pst_preg->idu_rtu_ir_preg_alloc_vld = 1;
    rtu_pst_preg->idu_rtu_pst_create_vld = 1;
    rtu_pst_preg->idu_rtu_pst_create_preg_index = (rtu_pst_preg->alloc_preg) ? rtu_pst_preg->alloc_preg : 0;
    rtu_pst_preg->idu_rtu_pst_create_iid = 3;
    rtu_pst_preg->idu_rtu_pst_create_gpr_index = 31;
    rtu_pst_preg->idu_rtu_pst_create_gpr_pre_preg_index = 31;
    rtu_pst_preg->x_inst_retire_iid = 1;
    rtu_pst_preg->x_retire_vld = 1;
    rtu_pst_preg->idu_rtu_pst_wb_vld = (long long)1 << 34;
    rtu_pst_preg->clk = 1;
    rtu_pst_preg->eval();
    rtu_pst_preg->clk = 0;
    rtu_pst_preg->eval();
    printf("%d %lld\n", rtu_pst_preg->alloc_preg_vld, rtu_pst_preg->alloc_preg);

    rtu_pst_preg->idu_rtu_ir_preg_alloc_vld = 1;
    rtu_pst_preg->idu_rtu_pst_create_vld = 1;
    rtu_pst_preg->idu_rtu_pst_create_preg_index = (rtu_pst_preg->alloc_preg) ? rtu_pst_preg->alloc_preg : 0;
    rtu_pst_preg->idu_rtu_pst_create_iid = 4;
    rtu_pst_preg->idu_rtu_pst_create_gpr_index = 30;
    rtu_pst_preg->idu_rtu_pst_create_gpr_pre_preg_index = 30;
    rtu_pst_preg->x_inst_retire_iid = 2;
    rtu_pst_preg->x_retire_vld = 1;
    rtu_pst_preg->idu_rtu_pst_wb_vld = (long long)1 << 35;
    rtu_pst_preg->clk = 1;
    rtu_pst_preg->eval();
    rtu_pst_preg->clk = 0;
    rtu_pst_preg->eval();
    printf("%d %lld\n", rtu_pst_preg->alloc_preg_vld, rtu_pst_preg->alloc_preg);

    rtu_pst_preg->idu_rtu_ir_preg_alloc_vld = 0;
    rtu_pst_preg->idu_rtu_pst_create_vld = 0;
    rtu_pst_preg->x_inst_retire_iid = 3;
    rtu_pst_preg->x_retire_vld = 1;
    rtu_pst_preg->idu_rtu_pst_wb_vld = 1 << 15;
    rtu_pst_preg->clk = 1;
    rtu_pst_preg->eval();
    rtu_pst_preg->clk = 0;
    rtu_pst_preg->eval();
    printf("%d %lld\n", rtu_pst_preg->alloc_preg_vld, rtu_pst_preg->alloc_preg);

    rtu_pst_preg->idu_rtu_ir_preg_alloc_vld = 0;
    rtu_pst_preg->idu_rtu_pst_create_vld = 0;
    rtu_pst_preg->x_inst_retire_iid = 4;
    rtu_pst_preg->x_retire_vld = 1;
    rtu_pst_preg->idu_rtu_pst_wb_vld = 0;
    rtu_pst_preg->clk = 1;
    rtu_pst_preg->eval();
    rtu_pst_preg->clk = 0;
    rtu_pst_preg->eval();
    printf("%d %lld\n", rtu_pst_preg->alloc_preg_vld, rtu_pst_preg->alloc_preg);

    rtu_pst_preg->rtu_global_flush = 1;
    rtu_pst_preg->eval();

    rtu_pst_preg->idu_rtu_ir_preg_alloc_vld = 0;
    rtu_pst_preg->idu_rtu_pst_create_vld = 0;
    rtu_pst_preg->x_retire_vld = 0;
    rtu_pst_preg->idu_rtu_pst_wb_vld = 0;
    rtu_pst_preg->clk = 1;
    rtu_pst_preg->eval();
    rtu_pst_preg->clk = 0;
    rtu_pst_preg->eval();
    printf("%d %lld\n", rtu_pst_preg->alloc_preg_vld, rtu_pst_preg->alloc_preg);

    while (!contextp->gotFinish())
    {
        break;
    }
    delete rtu_pst_preg;
    delete contextp;
    return 0;
}