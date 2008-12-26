#!/bin/sh
make compile
#cd `dirname $0/..`
exec erl -name nitroskel@localhost -pa $PWD/ebin $PWD/libs/*/ebin $PWD/libs/*/include -boot start_sasl -s reloader -s nitroskel
