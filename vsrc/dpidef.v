//External memory operations -------------------------------------------------------------------------
import "DPI-C" function byte         readbyte(longint addr);
import "DPI-C" function shortint     readhalf(longint addr);
import "DPI-C" function int          readword(longint addr);
import "DPI-C" function longint      readdword(longint addr);

import "DPI-C" function void    writebyte(longint addr, byte value);
import "DPI-C" function void    writehalf(longint addr, shortint value);
import "DPI-C" function void    writeword(longint addr, int value);
import "DPI-C" function void    writedword(longint addr, longint value);

import "DPI-C" function void    debug_inv(longint addr);
import "DPI-C" function void    ebreak(longint addr, longint gpr10);

//Code in this file has been tested.