#!/bin/sh
export TENGEN_APPSERVER=`expr "$(cat 10gen.properties)" : 'BASE=\(.*\)\/libraries'`
echo TENGEN_APPSERVER=$TENGEN_APPSERVER

CLASSPATH=./bin/:$TENGEN_APPSERVER/build/
for i in $TENGEN_APPSERVER/include/*.jar; do
  export CLASSPATH=${CLASSPATH}:${i}
done
echo CLASSPATH=$CLASSPATH

export ED_HOME=$TENGEN_APPSERVER
echo ED_HOME=$TENGEN_APPSERVER

echo Ready to run mongo.rb

#javac -d bin src/mongo/ruby/Mongo.java
#java mongo.ruby.Mongo
CLASSPATH=$CLASSPATH jruby mongo.rb
#CLASSPATH=$CLASSPATH jruby -S irb -r mongo.rb

echo Done.
