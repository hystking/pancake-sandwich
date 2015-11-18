cd pancake
npm install
npm run build
cd ..
cp -r pancake/public sandwich/public
cd sandwich
npm install --production --prune
cd ..
zip -r sandwich.zip sandwich
