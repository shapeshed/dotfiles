#!/bin/bash
# File:        publish_jekyll.sh
# Description: Compiles Jekyll Website and publishes via rsync
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
WEBSITE_PATH="/Users/george/Sites/shapeshed.com/"
LOCAL_PATH="/Users/george/Sites/shapeshed.com/_site/"
REMOTE_PATH="shapeshed.com:/var/www/vhosts/shapeshed.com/httpdocs"

cd $WEBSITE_PATH && /Users/george/.rvm/gems/ree-1.8.7-2011.03/bin/jekyll --lsi && rsync -avz -e "ssh" --delete $LOCAL_PATH $REMOTE_PATH

