SRC_PATH := src
EXAMPLE_PATH := examples

EXAMPLES = $(wildcard $(EXAMPLE_PATH)/*.lua)

LUA_PATH_EXT := $(SRC_PATH)/?.lua;$(EXAMPLE_PATH)/lib/?.lua#;$(TARGET_PATH)/?.so
ifeq ($(LUA_PATH),)
	LUA_PATH := $(LUA_PATH_EXT)
else
	LUA_PATH := $(LUA_PATH);$(LUA_PATH_EXT)
endif

LUA_BIN ?= lua
LUA_EXEC := LUA_PATH="$(LUA_PATH)" $(LUA_BIN)

run-examples:
	@for example in $(EXAMPLES) ; do \
		echo "🏃 $$example" ; \
		$(LUA_EXEC) $$example ; \
	done

# TARGET_PATH := target

# CFLAGS := -fPIC
# LDFLAGS := -llua

# # LUA_SRC := $(wildcard $(SRC_PATH)/*.lua)

# C_SRC := $(wildcard $(SRC_PATH)/*.c)
# C_TARGET := $(addprefix $(TARGET_PATH)/, $(addsuffix .so, $(notdir $(basename $(C_SRC)))))



# default: build

# $(TARGET_PATH):
# 	mkdir -p $(TARGET_PATH)

# $(TARGET_PATH)/%.so: $(C_SRC)
# 	$(CC) $(CFLAGS) -shared -o $@ $< $(LDFLAGS)

# build: $(TARGET_PATH) $(C_TARGET)

# .PHONY: clean
# clean:
# 	rm -rf $(TARGET_PATH)
