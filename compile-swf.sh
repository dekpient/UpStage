#!/bin/sh
# Ing - 24/8/13

echo 'Compiling...'
mtasc -version 8 -swf client/bin/classes.swf -header 320:200:31 -cp client/src client/src/App.as client/src/upstage/Client.as

swfmill simple client/src/application.xml client/bin/client.swf

echo 'Moving files...'

mv client/bin/classes.swf server/src/html/swf/
mv client/bin/client.swf server/src/html/swf/

echo 'Done'
