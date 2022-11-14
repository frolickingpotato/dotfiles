#!/bin/bash

exec cat ~/Projects/ASCII\ Art/pikachu.js | head -n 65 > ~/Projects/ASCII\ Art/pakechoo.js
exec pfetch | tail -n 8 | cut -b13- >> ~/Projects/ASCII\ Art/pakechoo.js
exec echo '`
console.log(paint(image, "    ", comment, 2))' >> ~/Projects/ASCII\ Art/pakechoo.js
