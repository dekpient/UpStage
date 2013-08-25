#!/bin/sh
# Ing - 24/8/13
DEBUG=upstage.client.App.debug
#DEBUG=no

echo 'Compiling...'
mtasc -version 10 -trace $DEBUG -msvc -wimp -strict -frame 1 -swf client/bin/classes.swf -header 320:200:31 -cp client/src client/src/App.as client/src/upstage/Client.as

swfmill simple client/src/application.xml client/bin/client.swf

echo 'Moving files...'

mv client/bin/classes.swf server/src/html/swf/
mv client/bin/client.swf server/src/html/swf/

echo 'Done'

# MTASC options

# -swf file : specify input SWF which contains assets.
# -cp path : add a directory path to the ClassPath : this is the list of directories that MTASC will use to look for .as files. You can use several times -cp to add several directories.
# -main : will automaticaly call static function main once all classes are registered.
# -header width:height:fps:bgcolor : does not load a SWF, instead create a new one containing only compiled code and using provided header informations. bgcolor is optional and should be 6 digits hexadecimal value.
# -mx : use precompiled MX classes (see section on V2 components below).

# -version n : specify SWF version : 6 to generate Player 6r89 compatible SWF or 8 to access Flash8 features.
# -v : activate verbose mode, printing some additional informations about compiling process.
# -out file : change output swf file.
# -msvc : use Microsoft Visual Studio errors style formating instead of Java style (for file names and lines number).
# -strict : will use strict compilation mode which require that all variables are explicitely typed.
# -exclude file : exclude code generation of classes listed in specified file (format is one full class path per line).
# -trace function : specify a custom trace function. (see Trace Facilities), or no disable all the traces.
# -keep : keep AS2 classes compiled by MCC into the SWF (this could cause some classes to be present two times if also compiled with MTASC).
# -frame f : will export AS2 classes into target frame of swf.
# -pack path : compile all the files contained in specified package - not recursively (eg to compile files in c:\flash\code\my\app do mtasc -cp c:\flash\code -pack my/app).
# -group : will merge classes into one single clip (this will reduce SWF size but might cause some problems if you're using -keep or -mx).
# -wimp : adds warnings for import statements that are not used in the file.
# -infer : adds type inference for initialized local variables (see below).
