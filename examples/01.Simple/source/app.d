/**
*   Copyright: © 2013-2014 Anton Gushcha
*   License: Subject to the terms of the MIT license, as written in the included LICENSE file.
*   Authors: NCrashed <ncrashed@gmail.com>
*/
module example01;

import std.stdio;
import concolor.d;

void main()
{
    writeln("Hello world!", foreground.green, " Green color!", foreground.red, " Red color!");
    writeln("Show how to reset color. ", background.white, "some text", background.reset);
}