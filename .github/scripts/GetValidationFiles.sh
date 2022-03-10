

# Copy all files from resources, examples and terminology into a separate folder

mkdir ValidationFiles

cp -R resources ValidationFiles/resources
cp -R examples ValidationFiles/examples
cp -R terminology ValidationFiles/terminology

# Go to the folder 
cd ValidationFiles

# Delete all files with an *.md extension. This could be elaborated if there occur other issues.
find . -name "*.md" -type f -delete