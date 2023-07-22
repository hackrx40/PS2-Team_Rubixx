# /bin/bash

# Replace 10 and 50 with the desired range (inclusive).
random_number=$((RANDOM))
echo "$random_number" >> /home/viraj/Code/Hackathons/Bajaj\ Finserv/readme.txt

git add readme.txt
git commit -m "update txt file with $random_number"
git push origin dev
