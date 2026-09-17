# Kraftaa Tap

## Codebase Observatory

Install [Codebase Observatory](https://github.com/kraftaa/codebase-observatory):

```bash
brew install kraftaa/tap/observatory
observatory --version
```

Open the interactive review map for uncommitted work in the current repository:

```bash
observatory review --repo "$PWD" --base HEAD --working-tree
```

Generate machine-readable impact evidence:

```bash
observatory impact --repo "$PWD" --base HEAD --working-tree --json
```

## Embed Parity

Install [embed-parity](https://github.com/kraftaa/parity-checker) on an
Apple-silicon Mac:

```bash
brew install kraftaa/tap/embed-parity
embed-parity --version
```

The formula includes the SentenceTransformers runtime needed to compare a
local model with a Text Embeddings Inference deployment.

## Whyslow

Install [Whyslow](https://github.com/kraftaa/whyslow):

```bash
brew install kraftaa/tap/whyslow-db
whyslow --version
```

Upgrade it later with `brew update && brew upgrade whyslow-db`. The formula
installs the `whyslow-db` package and exposes the `whyslow` command.

## How do I install these formulae?

`brew install kraftaa/tap/<formula>`

Or `brew tap kraftaa/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "kraftaa/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
