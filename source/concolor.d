/**
*   Copyright: © 2013-2014 Anton Gushcha
*   License: Subject to the terms of the MIT license, as written in the included LICENSE file.
*   Authors: NCrashed <ncrashed@gmail.com>
*/
module concolor;

import std.process;

static if(__VERSION__ < 2066) enum nogc;

@safe:
@nogc:

struct foreground
{
    static string green() nothrow
    {
        try return executeShell("tput setaf 2").output;
        catch(Exception e) 
        {
            return "";
        }
    }
    
    static string red() nothrow
    {
        try return executeShell("tput setaf 1").output;
        catch(Exception e) 
        {
            return "";
        }
    }
    
    static string reset() nothrow
    {
        try return executeShell("tput sgr0").output;
        catch(Exception e) 
        {
            return "";
        }
    }
}

struct background
{
    static string white() nothrow
    {
        try return executeShell("tput setab 7").output;
        catch(Exception e) 
        {
            return "";
        }
    }
    
    static string reset() nothrow
    {
        try return executeShell("tput sgr0").output;
        catch(Exception e) 
        {
            return "";
        }
    }
}