# Firefox History and Bookmark Command Line Interface



Author
: https://gist.github.com/heyarne
Source
: https://gist.github.com/heyarne/79e92635cc8ec3d58e1ea3338ad0347f




These scripts use `fzf` and `sqlite` to efficiently query your firefox history and bookmarks.
This is heavily inspired by a post from the creator of `fzf`: https://junegunn.kr/2015/04/browsing-chrome-history-with-fzf/.
`fzf` allows you to select multiple items and the results returned will be the URLs.

## What Does It Look Like?

[![asciicast](https://asciinema.org/a/WMeN4tjlNfpTmo9wLVxTBdCJz.svg)](https://asciinema.org/a/WMeN4tjlNfpTmo9wLVxTBdCJz)

## Common Use Cases
### Open a visited Web Page in a Browser

On Linux:
```
bhistory | xargs xdg-open
```

On macOS:
```
bhistory | xargs open
```

### Copy the URLs of Selected Bookmarks into Your Clipboard

On Linux (with X11):
```
bbookmarks | xsel --clipboard -i
```

On macOS:
```
bbookmarks | pbcopy
```

## Things to Consider

- The firefox profile is matched with a glob wildcard (`*`). This will probably break if you use more than one profile.
- The scripts are untested but should work on macOS; you need to change the profile path to `~/Library/Application\ Support/Firefox/Profiles`
