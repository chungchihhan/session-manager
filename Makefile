.PHONY: build install clean test

# Build the binary
build:
	@mkdir -p bin
	go build -o bin/super-resume ./cmd/super-resume

# Install to the bin directory (for plugin use)
install: build
	@echo "Binary built at bin/super-resume"
	@echo "To use with Claude Code, add this plugin directory:"
	@echo "  claude --plugin-dir $(shell pwd)"

# Clean build artifacts
clean:
	rm -rf bin/
	go clean

# Run tests
test:
	go test ./...

# Format code
fmt:
	go fmt ./...

# Run the TUI directly
run: build
	./bin/super-resume
