#!/bin/bash

python buster.py generate
LANG=C LC_ALL=C find static/* -not -path '.git' -type f -exec sed -i '' 's/http:\/\/localhost:4000/https:\/\/yourdomain.com/g' {} \;
cd static
git add -A
git commit -m "Updated on $(date)"
git push