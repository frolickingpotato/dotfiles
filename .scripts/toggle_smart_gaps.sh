#!/bin/bash

sed -Ei 's/^[[:blank:]]*smart_gaps**/#&/;t;s/^#([[:blank:]]*smart_gaps)/\1/' .config/i3/config
i3-msg restart
