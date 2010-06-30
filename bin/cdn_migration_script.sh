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
 

# Move images to the CDN 
# for f in *.markdown; do
#   sed 's/\(\[[1-9]\]: \)\/images/\1http:\/\/cdn.shapeshed.com\/images/' $f > tempfile && mv tempfile $f
# done

# # # And downloads
# for f in *.markdown; do
#   sed 's/http:\/\/www.shapeshed.com\/downloads/http:\/\/cdn.shapeshed.com\/downloads/' $f > tempfile && mv tempfile $f
# done

# Whilst we are at it let's remove www
for f in *.markdown; do
  sed 's/\(\[[1-9]\]: \)\/images/\1http:\/\/cdn.shapeshed.com\/images/' $f > tempfile && mv tempfile $f
  sed 's/http:\/\/www.shapeshed.com/http:\/\/shapeshed.com/' $f > tempfile && mv tempfile $f
  sed 's/http:\/\/www.shapeshed.com\/downloads/http:\/\/cdn.shapeshed.com\/downloads/' $f > tempfile && mv tempfile $f
  sed 's/src=\"\/movies/src=\"http:\/\/cdn.shapeshed.com\/videos/' $f > tempfile && mv tempfile $f
done

# # Move movies to videos
# for f in *.markdown; do
#   
# done


