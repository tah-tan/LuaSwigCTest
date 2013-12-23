# LuaSwigCTest

This project is a test project to glue c and lua with SWIG.

I'd like to understand how to use functons that use C pointer and C array (in pointer form), 
and this project is the test bench.

This project contains only test code, so, written code is very poor and very harmful, don't mention it.

# Learned topics

- You may use Lua table to use C array.
- Array length is represented integer only. long, short, unsigned long are not supported.
- Array arguments consist of the pointer and length, and its order. For example, if your C function is void func(int *array_top, int array_num), that's OK. But, if your function is void func(int array_num, int *array_top), Lua will agree that the number of arguments or the type of arguments.
- Output pointer become return value, if you set as arguments. For example, if your C function is void func(int *output), then Lua code is a = func(b). If the function has two or more output arguments and C function is void func(int *a, int *b) (for example), then the code will be c, d = func(a, b). 

