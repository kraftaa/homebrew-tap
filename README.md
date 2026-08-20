# Kraftaa Tap

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
