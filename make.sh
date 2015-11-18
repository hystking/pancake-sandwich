npm run build
cp -r public sandwich/public
cd sandwich
npm install --production --prune
cd ..
zip -r sandwich.zip sandwich
