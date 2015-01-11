# This should be run once only
cd /Users/hyo/prj/r4/wants
echo 8000 > .port # Whatever port your app server is using
ln -s $PWD/.port ~/.pow/`basename $PWD`
echo "port: 8000" > .foreman

# Then start your app normally everytime with:
# > foreman start
# Voila! App will be available at http://myapp.dev
