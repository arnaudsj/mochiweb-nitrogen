#!/bin/sh
make
cd `dirname $0`
exec erl -pa $PWD/ebin $PWD/libs/*/ebin $PWD/libs/*/include -boot start_sasl -s reloader -s nitroskel
