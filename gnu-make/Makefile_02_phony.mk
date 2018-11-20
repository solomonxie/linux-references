# Run: make -f Makefile_02_phony.mk / make -f Makefile_02_phony.mk clean
# What this step adds: .PHONY targets — targets that don't name a real file.
# Step 2: .PHONY so `clean` always runs even if a file named "clean" exists

hello.txt: greeting.txt
	cp greeting.txt hello.txt

greeting.txt:
	echo "Hello, Make!" > greeting.txt

# Step 2: mark non-file targets phony
.PHONY: clean
clean:
	rm -f hello.txt greeting.txt
