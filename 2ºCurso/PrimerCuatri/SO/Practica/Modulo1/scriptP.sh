#!/bin/bash
cp *.gz /tmp;
gunzip /tmp/*.gz;
/tmp/kernel32-3.0.4 ubda=/tmp/Fedora14-x86-root_fs mem=1024m;
