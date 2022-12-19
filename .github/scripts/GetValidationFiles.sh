# Copy all files from resources, examples and terminology into a separate folder.

mkdir ValidationFiles

# Copy all files recursive into new folder.
cp -R resources ValidationFiles/resources
cp -R examples ValidationFiles/examples
cp -R terminology ValidationFiles/resources

echo "All files to validate are copied to the ValidationFiles directory."

# Go to the folder 
cd ValidationFiles

# Delete all files with an *.md extension as they are not accepted by the Java validator. 
# This could be elaborated if there occur other issues.
find . -name "*.md" -type f -delete
echo "All *.md files are deleted from the ValidationFiles"

find . -name "*.py" -type f -delete
echo "All *.py files are deleted from the ValidationFiles"