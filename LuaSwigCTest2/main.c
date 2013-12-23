//
//  main.c
//  LuaSwigCTest2
//

#include <stdio.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

extern void luaopen_mylua(lua_State *L);

void show_error(lua_State *L)
{
    const char *p = lua_tostring(L, -1);
    printf(p);
    printf("\n");
}

int main(int argc, const char * argv[])
{
    // insert code here...
    lua_State *L;
    L = luaL_newstate();
    luaL_openlibs(L);
    luaopen_mylua(L);
    if (luaL_loadfile(L, "/Users/nagaiyouhei/Documents/src/LuaSwigCTest/pointer_array.lua")) {
        printf("loadfile error \n");
        show_error(L);
        goto CLOSE;
    }
    if (lua_pcall(L, 0, 0, 0)) {
        printf("pcall error\n");
        show_error(L);
        goto CLOSE;
    }
CLOSE:
    lua_close(L);
    
    return 0;
}

