#!/bin/bash
/usr/bin//valgrind --leak-check=full ./dist/Debug/GNU-Linux/shopping3a -input ./data/ECommerce926.dataset -events 500 -index-by UserID -report-by Brand -output ./data/ECommerce926-hit2.dataset < ./tests/validation/ECommerce926.keyboard 1> /dev/null 2>> ./tests/output/ECommerce926.mleaks.full
