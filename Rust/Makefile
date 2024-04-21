PROJECTS = p01 p02

EXECUTABLES = r_01 r_02

.PHONY: all clean

all: $(EXECUTABLES)

r_%: p% p%/src/main.rs
	cargo build --release --manifest-path $</Cargo.toml
	cp $</target/release/p$* r_$*

clean:
	$(foreach dir, $(PROJECTS), cargo clean --manifest-path $(dir)/Cargo.toml;)
	rm -f $(EXECUTABLES)

