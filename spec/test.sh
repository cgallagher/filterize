#! /bin/bash

convert /Users/chrisgallagher/Work/clients/gems/filterize/spec/borat.jpg \
\(-gamma 0.75 -modulate 100,130 -contrast\) \
\(+clone -sparse-color Barycentric '0,0 black 0,%h white' -function polynomial 4,-4,1 -level 0,50%\) \
-compose blur -set option:compose:args 5 -composite tilt.jpg
