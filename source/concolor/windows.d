/**
*   Copyright: © 2013-2014 Anton Gushcha
*   License: Subject to the terms of the MIT license, as written in the included LICENSE file.
*   Authors: NCrashed <ncrashed@gmail.com>
*/
module concolor.windows;

import std.process;

static if(__VERSION__ < 2066) enum nogc;
@safe @nogc: