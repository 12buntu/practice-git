#!/bin/bash
echo -e "What is your name?\n"
read name
date=$( date +%m/%d/%y )
git checkout -B $date-$name
git add --all
echo -e "This should push code from your computer to the master (default) branch of the git repository as well as create a new branch for today, for backup"


echo -e "\nCommit message: (type 'skip' if you used Android studio to create the commit\n" 
read commitMessage
case $commitMessage in
        skip) 
        ;;

        *)	
		git commit -m "$commitMessage"
esac

git push -u origin $date-$name
$merge

function merge {
echo -e "Merge with master (yes/no)\n"
read yesorno
case $yesorno in
	yes)
		git checkout master
		git add --all
		git merge $date-$name
		git commit -m "merged from $date-$name"
		git push -u origin master
		;;
	no)
		
		;;
	*)
		echo "Invalid Response"
		merge
		;;
esac
}
