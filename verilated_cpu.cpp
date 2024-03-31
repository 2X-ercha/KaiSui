#include "./vsrc/obj_dir/Vcpu.h"
#include <cstdio>
#include <assert.h>
#include <fstream>
#include <iostream>
using namespace std;

#define CREATE_DPI(type, name) \
    type read##name(uint64_t addr)              {return vaddr_read(addr, sizeof(type)); } \
    void write##name(uint64_t addr, type value) {vaddr_write(addr, sizeof(type), value); }

extern "C" {

    #include <memory/vaddr.h>
        CREATE_DPI(uint8_t, byte)
        CREATE_DPI(uint16_t, half)
        CREATE_DPI(uint32_t, word)
        CREATE_DPI(uint64_t, dword)

    #include <cpu/cpu.h>
        void debug_inv(uint64_t addr)              {INV(addr); }
        void ebreak(uint64_t addr, uint64_t gpr10) {NEMUTRAP(addr, gpr10); }

}

Vcpu* vcpu = NULL;
VerilatedContext* vcontext = NULL;

extern "C" {

    void vcpu_init() {
        if (vcpu) delete vcpu;
        if (vcontext) delete vcontext;

        vcontext = new VerilatedContext();
        vcpu = new Vcpu{vcontext};
        vcpu->clk = 0;
        vcpu->rst_clk = 1;
        vcpu->eval();
        vcpu->rst_clk = 0;
        vcpu->eval();
        vcpu->rst_clk = 1;
        vcpu->eval();
    }

    void vcpu_do_cycle() {
        vcpu->clk = 1;
        vcpu->eval();
        vcpu->clk = 0;
        vcpu->eval();
    }

    uint64_t vcpu_get_pc() {
        return vcpu->pc;
    }

    void vcpu_get_regs(uint64_t* writeout) {
        for (int i = 0; i < 32; i++)
            writeout[i] = 0;
    }

}