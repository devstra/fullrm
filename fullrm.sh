search=$1

echo "Searching for $1..."
# find the path of files/folders with names containing given search term and wraps them with quotes
results=$(fd --exclude /System --exclude /usr/local/Homebrew -uu $search / | perl -pe "s/(.*?$search.*?\/|$).*/\1/i;s/\/$//" | uniq | sed -e 's/^/"/g' -e 's/$/"/g' | tr '\n' ' ')

echo $results

read -p "These files/folders will be deleted. Do you confirm (Y/n)?" answer

if [ $answer == 'Y' ] || [ $answer == 'y' ] ; then
    # xargs sudo rm -rf
    for i in $results
    do
        rm -rf $results
    done
    echo 'The files/folders have been deleted.'
else
    echo 'Task aborted.'
fi