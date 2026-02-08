# Homebrew Tap for Emergent

Official Homebrew tap for the Emergent CLI.

## Installation

```bash
brew tap Emergent-Comapny/emergent
brew install emergent-cli
```

## Usage

```bash
# Check version
emergent version

# Login to server
emergent login

# List projects
emergent projects list

# Self-update
emergent upgrade
```

## Formula

The formula is maintained in `Formula/emergent-cli.rb`. It downloads pre-built binaries from the [Emergent GitHub releases](https://github.com/Emergent-Comapny/emergent/releases).

## Updating

To update the formula after a new release:

1. Update the version and SHA256 checksums in `Formula/emergent-cli.rb`
2. Commit and push
3. Users can update with `brew upgrade emergent-cli`
