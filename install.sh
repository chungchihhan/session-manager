#!/bin/bash
set -e

# Super Resume Installer — installs the TUI binary only.
# For Claude Code skills, install via the marketplace instead.
# Usage: curl -fsSL https://raw.githubusercontent.com/chungchihhan/super-resume/main/install.sh | bash

REPO="chungchihhan/super-resume"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

detect_platform() {
    OS=$(uname -s | tr '[:upper:]' '[:lower:]')
    ARCH=$(uname -m)

    case "$OS" in
        linux*) OS="linux" ;;
        darwin*) OS="darwin" ;;
        mingw*|msys*|cygwin*) OS="windows" ;;
        *) error "Unsupported OS: $OS" ;;
    esac

    case "$ARCH" in
        x86_64|amd64) ARCH="amd64" ;;
        arm64|aarch64) ARCH="arm64" ;;
        *) error "Unsupported architecture: $ARCH" ;;
    esac

    echo "${OS}_${ARCH}"
}

get_latest_version() {
    curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/'
}

install() {
    PLATFORM=$(detect_platform)
    info "Detected platform: $PLATFORM"

    VERSION=$(get_latest_version)
    [ -z "$VERSION" ] && error "Could not determine latest version. Check https://github.com/${REPO}/releases"
    info "Latest version: $VERSION"
    VERSION_NUM="${VERSION#v}"

    EXT="tar.gz"
    [ "$OS" = "windows" ] && EXT="zip"

    DOWNLOAD_URL="https://github.com/${REPO}/releases/download/${VERSION}/super-resume_${VERSION_NUM}_${PLATFORM}.${EXT}"
    info "Downloading from: $DOWNLOAD_URL"

    TMP_DIR=$(mktemp -d)
    trap "rm -rf $TMP_DIR" EXIT

    curl -fsSL "$DOWNLOAD_URL" -o "$TMP_DIR/archive.${EXT}"

    cd "$TMP_DIR"
    if [ "$EXT" = "tar.gz" ]; then
        tar -xzf "archive.${EXT}"
    else
        unzip -q "archive.${EXT}"
    fi

    mkdir -p "$INSTALL_DIR"
    cp super-resume "$INSTALL_DIR/"
    chmod +x "$INSTALL_DIR/super-resume"
    info "Installed to: $INSTALL_DIR/super-resume"

    if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
        warn "$INSTALL_DIR is not in your PATH"
        echo ""
        echo "Add to your shell config:"
        echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.zshrc"
        echo "  source ~/.zshrc"
        echo ""
    fi

    echo ""
    info "Done! Run 'super-resume' in your terminal to launch the TUI."
}

install
