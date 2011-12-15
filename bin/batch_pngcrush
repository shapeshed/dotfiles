#!/bin/bash
# File: batch_pngcrush.sh
# Description: Batch processes PNG files using the pngcrush
# http://pmt.sourceforge.net/pngcrush/
#
# Copyright 2010 George Ornbo (Shape Shed)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
 
# Name for optimised folder (will be created later)
OPT='./optimised'

# Command to do the crushing (pngcrush required)
CRUSH='pngcrush -rem alla -brute -reduce'

# Make the optimised folder
mkdir -p $OPT

# Now loop through png files and crush them 
for f in *.png; do
  $CRUSH $f $OPT/$f
done