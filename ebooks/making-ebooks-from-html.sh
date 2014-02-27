#!/bin/bash

# converting websites to ebooks and pdfs
#=======================================


# download the website with wget
#=========================================================

# cd to desktop
cd ~/Desktop

# wget miror website
wget -m http://makingthenetwork.org

# -m = mirror website
# k = convert links so they work locally

# cd into the directory you downloaded with wget
cd makingthenetwork.org


# convert all the images to png
#========================================================

find . -type f -regex ".*\.\(gif\|jpg\|jpeg\)$" -exec convert '{}' '{}.png' \;

# find = find command
# . = current working directory
# -type f = find only file types
# -regex ".*\.\(gif\|jpg\|jpeg\)$" = use a regular expresion to search for .jpg .jpeg .gif
# -exec = execute command 
# convert = imagemagik convert command
# '{}' = original file
# '{}.png' = save file with png extension



# rename png files to remove .jpg, .jpeg and .gif from the file name
#====================================================================

find . -type f -regex ".*\.\(gif\|jpg\|jpeg\)\.png$" |
while read file
do
newname=`echo $file | sed 's/\.\(jpe\?g\|gif\)//g'`
mv "$file" "$newname"
done


# sed change image urls in html file to png
#====================================================================

find . -type f -regex ".*\.\(htm\|html\)$" -exec sed -i 's/\.\(jpe\?g\|gif\)/\.png/Ig' '{}' \;


# install html-xml-utils for hxnormalize and hxselect
#====================================================

sudo apt-get install html-xml-utils


# install tidy for cleaning html
#===============================

sudo apt-get install tidy


# strip out just the content to paragraphs - makingnetwork.org
#======================================================================

hxnormalize -x index.htm | \
hxselect -s '\n' -c  \
'html>body>table>tbody>tr>td:nth-of-type(2)>table>tbody>tr:nth-of-type(5)>td>table>tbody>tr>td' > clean-index.htm


# find html pages strip out the content, tidy the html re add the html, head and body tags and save the file
find . -type f -regex ".*\.\(htm\|html\)$" |
while read file
do
hxnormalize -x "$file" | \
hxselect -s '\n' -c  \
'html>body>table>tbody>tr>td:nth-of-type(2)>table>tbody>tr:nth-of-type(5)>td>table>tbody>tr>td' | \
tidy -mibq --doctype strict --drop-font-tags yes --tidy-mark no --output-xhtml yes -o "$file"
done



# tidy html remove font tags
#=======================================================================

# tidy remove font tags and output html head and body tags
tidy -mibq --doctype strict --drop-font-tags yes --tidy-mark no --output-xhtml yes clean-index.htm

# m = modify original file
# i = indent
# b = bare strip quotes
# q = quiet
# --doctype strict = strict xhtml doctype
# --drop-font-tags yes = remove font tags
# --tidy-mark no = dont show tidy text
# --output-xhtml yes = output closing tags

#=============================================================


# install pandoc - linux mint 14
# ==============================

sudo apt-get install haskell-platform


# update cabal
#=============
cabal update

# add to ~/.bashrc
export PATH=$HOME/.cabal/bin:$PATH

cabal install pandoc
 
# textlive install for latex support
#===================================
sudo apt-get install texlive



# haskell-platform and pandoc install - linux mint 15
#====================================================

# https://github.com/NapoleonWils0n/cerberus/blob/master/pandoc/pandoc-install-linux-mint-15.sh



# create latex document
#======================

pandoc -f html -t latex clean-index.htm --self-contained -o clean-index.tex
pandoc -f latex clean-index.tex -o clean-index.pdf


#===============================================================#

# find pdfs that are part of the site and save as a list, then exclude from moving so you dont break links

# create pdfs
find . -type f -regex ".*\.\(htm\|html\)$" -exec pandoc -f html '{}' --toc -o '{}'.pdf \;

# make pdfs directory
mkdir -p pdfs

# move pdfs in to pdfs directory
find . -type f -name '*.pdf' -exec mv '{}' pdfs/ \;

#===============================================================#

# create epubs
find . -type f -regex ".*\.\(htm\|html\)$" -exec pandoc -f html -t epub '{}' --toc -o '{}'.epub \;

# make epubs directory
mkdir -p epub

# move epubs in to epub directory
find . -type f -name '*.epub' -exec mv '{}' pdfs/ \;


