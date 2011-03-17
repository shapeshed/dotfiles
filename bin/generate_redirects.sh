#!/bin/bash
# File:        generate_redirects.sh
# Description: Generates redirect rules based on a folder structure
#
# Copyright 2009 George Ornbo (Shape Shed)
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
for file in *; do
   if [ -d $file ]; then
      printf "RewriteRule path/$file/? http://archive.yoursite.com/path/$file [R=301,L]\n" >> redirect_rules.txt
   fi
done

