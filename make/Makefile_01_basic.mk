# Run: make -f Makefile_01_basic.mk
# What this step adds: a target with a prerequisite and a recipe.
# Step 1: basic rule syntax — target: prerequisites \n <TAB> recipe

hello.txt: greeting.txt
	cp greeting.txt hello.txt

greeting.txt:
	echo "Hello, Make!" > greeting.txt
