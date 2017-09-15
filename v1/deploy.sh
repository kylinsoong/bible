#!/bin/bash
echo "--------------------------------------"
echo "Deploy Document"
echo "--------------------------------------"
echo ""

DOCUMENT_VERSION_CURRENT=v1
DOCUMENT_VERSION=$1

if [ -z != $DOCUMENT_VERSION ]
then
echo "Document version is $DOCUMENT_VERSION"
else
DOCUMENT_VERSION=$DOCUMENT_VERSION_CURRENT
echo "Document version is null, use default $DOCUMENT_VERSION"
fi

rm -fr $DOCUMENT_VERSION

gitbook build ./ $DOCUMENT_VERSION

echo ""

git status
echo ""
git add --all
echo ""
git commit -m "Deploy document"
echo ""
git push origin gh-pages
