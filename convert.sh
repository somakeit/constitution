cat constitution.txt | sed -E \
  -e '1s/^/# /' \
  -e '3s/^/## /' \
  -e 's/^ *$//' \
  -e 's/$/\
/g' \
  -e 's/  /    /g' \
  -e 's/^( *)\(([a-z0-9]*)\)  *([^ ].*)$/\1\2. \3/' \
  -e 's/^([0-9]*)\.  *(.*)$/\1. \2/' \
  -e "s/[‘’]/'/g" \
  -e 's/[“”]/"/g' \
  > constitution.tmp
sed -E \
  -e 's/^( *)[a-z]*\. /\11\. /' \
  -e 's/–/--/g' \
  constitution.tmp \
  | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n\n/\
/g' \
  | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n\n/\
/g' \
  | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n\n/\
/g' \
  | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\
\
/g' \
  > constitution.md
pandoc --from=markdown --to=html5 --output=index.html --css=html/style.css ./constitution.tmp
rm constitution.tmp

