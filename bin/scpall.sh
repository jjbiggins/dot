#!/bin/bash

for a in *.{jpg,pdf,}; do
    scp "$a" oper@test://test/programs/jbiggins/xsl/images/ &&
    scp *.csv oper@test://test/data/jbiggins/input/
done
