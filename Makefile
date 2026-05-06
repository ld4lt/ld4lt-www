SHELL=bash

update:
	@if [ -e www.w3.org ] ; then rm -rf www.w3.org; fi
	((wget -r -np -nc -l 0 https://www.w3.org/community/ld4lt/; \
 	 wget -r -np -nc -l 0 https://www.w3.org/community/ld4lt/wiki) 2>&1 \
	| tee wget.log) \
	|| echo "WARNING: wget errors, check wget.log" 1>&2;
	git add www.w3.org wget.log;
	git commit -a -m "mirror "`date -R`
	git push || echo "ERROR: make sure you have the correct privileges to push into this repository" 1>&2
