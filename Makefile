.PHONY: build test lint lint-unused test-unused clean

# Build the main binary
build:
	go build -o bin/erst ./cmd/erst

# Run tests
test:
	go test ./...

# Run full linter suite
lint:
	golangci-lint run

# Run unused code detection
lint-unused:
	./scripts/lint-unused.sh

# Test unused code detection setup
test-unused:
	./scripts/test-unused-detection.sh

# Clean build artifacts
clean:
	rm -rf bin/
	go clean -cache

# Install dependencies
deps:
	go mod tidy
	go mod download
