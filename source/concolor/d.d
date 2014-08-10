/**
*   Copyright: © 2013-2014 Anton Gushcha
*   License: Subject to the terms of the MIT license, as written in the included LICENSE file.
*   Authors: NCrashed <ncrashed@gmail.com>
*/
module concolor.d;

version(windows) public import concolor.windows;
version(linux) public import concolor.unix;
version(Posix) public import concolor.unix;