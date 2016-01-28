#!/bin/zsh
# converts hex color codes to an html page which shows the colors

printf "
<!DOCTYPE html>
<html>
<head>
 <style>
  .color-sample {
    float: left;
    margin: 2px;
    width: 64px;
    height: 64px;
    border-radius: 3px;
  }
 </style>
</head>
<body>\n"

for i in $@ ; do
    printf "  <div class=\"color-sample\" style=\"background: %b\"></div>\n" $i
done

printf "</body>
</html>\n"
