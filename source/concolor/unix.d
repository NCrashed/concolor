/**
*   Copyright: © 2013-2014 Anton Gushcha
*   License: Subject to the terms of the MIT license, as written in the included LICENSE file.
*   Authors: NCrashed <ncrashed@gmail.com>
*/
module concolor.unix;

import std.process;

static if(__VERSION__ < 2066) enum nogc;
@safe:

struct foreground
{
    version(linux)
    {
        enum Command
        {
            black   = "tput setaf 0",
            red     = "tput setaf 1",
            green   = "tput setaf 2",
            yellow  = "tput setaf 3",
            blue    = "tput setaf 4",
            magenta = "tput setaf 5",
            cyan    = "tput setaf 6",
            white   = "tput setaf 7",
            reset   = "tput sgr0"
        }
    }
    else version(OSX) // untested
    {
        enum Command
        {
            black   = "tput setaf 0",
            red     = "tput setaf 1",
            green   = "tput setaf 2",
            yellow  = "tput setaf 3",
            blue    = "tput setaf 4",
            magenta = "tput setaf 5",
            cyan    = "tput setaf 6",
            white   = "tput setaf 7",
            reset   = "tput sgr0"
        }
    }
    else version(Posix)
    {
        enum Command
        {
            black   = "tput AF 0",
            red     = "tput AF 1",
            green   = "tput AF 2",
            yellow  = "tput AF 3",
            blue    = "tput AF 4",
            magenta = "tput AF 5",
            cyan    = "tput AF 6",
            white   = "tput AF 7",
            reset   = "tput me"
        }
    }
    
    mixin(genColorFuncs!Command);
}

struct background
{
    version(linux)
    {
        enum Command
        {
            black   = "tput setab 0",
            red     = "tput setab 1",
            green   = "tput setab 2",
            yellow  = "tput setab 3",
            blue    = "tput setab 4",
            magenta = "tput setab 5",
            cyan    = "tput setab 6",
            white   = "tput setab 7",
            reset   = "tput sgr0"
        }
    }
    else version(OSX) // untested
    {
        enum Command
        {
            black   = "tput setab 0",
            red     = "tput setab 1",
            green   = "tput setab 2",
            yellow  = "tput setab 3",
            blue    = "tput setab 4",
            magenta = "tput setab 5",
            cyan    = "tput setab 6",
            white   = "tput setab 7",
            reset   = "tput sgr0"
        }
    }
    else version(Posix)
    {
        enum Command
        {
            black   = "tput AB 0",
            red     = "tput AB 1",
            green   = "tput AB 2",
            yellow  = "tput AB 3",
            blue    = "tput AB 4",
            magenta = "tput AB 5",
            cyan    = "tput AB 6",
            white   = "tput AB 7",
            reset   = "tput me"
        }
    }
    
    mixin(genColorFuncs!Command);
}

private string changeColor(T)(T color) nothrow
     if(is(T == enum))
{
    try return executeShell(color).output;
    catch(Exception e) 
    {
        return "";
    }
}

private string genColorFuncs(T)() if(is(T == enum))
{
    string ret;
    foreach(member; __traits(allMembers, T))
    {
        ret ~= `
            static string `~member~`() nothrow
            {
                return changeColor(Command.`~member~`);    
            }
        `;
    }
    return ret;
}
