# Run: make -f Makefile_13_eval_call.mk
# What this step adds: advanced — call() for a reusable macro, eval() to
# generate rules programmatically instead of writing them by hand.
# Step 13: eval + call

.PHONY: all clean

# Step 13: a "function" — $(1) is its first argument
greet = echo "hello, $(1)!"

# Step 13: a rule template instantiated once per name via eval
define make_greet_rule
greet-$(1):
	@$$(call greet,$(1))
endef

NAMES = alice bob
$(foreach n,$(NAMES),$(eval $(call make_greet_rule,$(n))))

all: greet-alice greet-bob

clean:
	@true
