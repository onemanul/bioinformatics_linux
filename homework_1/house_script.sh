#!/bin/bash

mkdir -p house/floor_1 house/floor_2
cd house/floor_1
mkdir kitchen bathroom wardrobe
cd kitchen
mkdir fridge
echo -e "Milk\nEggs\nBread" > fridge/products.txt # -e = \n support
cat >> fridge/products.txt << END
Cheese
Bacon
END
touch table.txt chair.txt
touch ../bathroom/shower.txt
cd ../wardrobe
cat > clothes.txt << EOF
Dress
Jeans
Shirt
EOF
cd ../../floor_2
mkdir bedroom_1 bedroom_2
cd bedroom_1
touch bed.txt
cp bed.txt ../bedroom_2
echo "Money" > safe.txt
chmod 600 safe.txt
cd ../bedroom_2
echo "Tasty sweets" > .stash.txt
