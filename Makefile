.PHONY: all clean

FTP_IP ?= 192.168.1.108

all:
	cmake --toolchain=cmake/toolchain.cmake -S . -B build && $(MAKE) -C build subsdk9_meta

clean:
	rm -r build || true

send:
	cmake --toolchain=cmake/toolchain.cmake -DFTP_IP=$(FTP_IP) -S . -B build && $(MAKE) -C build subsdk9_meta

update-headers:
	git submodule update --remote ./include/
