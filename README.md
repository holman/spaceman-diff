# spaceman-diff

diff images from the command line

![](https://cloud.githubusercontent.com/assets/2723/3005174/e28c2e00-ddd1-11e3-9dd8-c2c150e0ac86.jpg)

## what's inside™

Important business programmers don't have time to switch away from their terminal to view the diff of an image they're about to commit. The three seconds it takes to open an external diff visualization program could drive your sales team to drink and make inappropriate remarks to your new employees. Increase your productivity bottom line today, with `spaceman-diff`!

`spaceman-diff` is a quick drop in to `git-diff`. The idea is that you can just `git diff` like normal and, if you've changed an image file, `spaceman-diff` will render your images in a colorful ASCII approximation in your shell along with helpful data like file size changes.

Here's a quick example of what you might see:

~SCREENSHOT~

The goal is that `spaceman-diff` gives you a quick way of verifying that yes, the image you're committing is the image you want to commit, and yes, the image you're committing isn't 20 terabytes in size or something foolish like that.

## dependencies

There are two dependencies that you need before you can fiddle with pixels and characters and junk: [jp2a][jp2a] and [ImageMagick][imagemagick]. `jp2a` handles conversion of a JPEG to ASCII, and ImageMagick can do everything from image conversion to probably running a nuclear reactor.

### os x

If you're using [Homebrew][brew], blindly run this:

    brew install jp2a imagemagick

## install

Once you have your dependencies installed, drop `spaceman-diff` (LINK NEEDED) onto your system or your dotfiles directory or whatever kooky stuff you're using. Basically you need `spaceman-diff` to be available to your `$PATH`. After that, you need to configure Git to use `spaceman-diff` for all your image diffs.

If you don't have one already, create a file at `~/config/git/attributes` and add this to it:

```txt
*.png  diff=spaceman-diff
*.jpg  diff=spaceman-diff
*.jpeg diff=spaceman-diff
*.gif  diff=spaceman-diff
```

This basically tells Git to use the `spaceman-diff` strategy to render the diff for these four particular file extensions.

Next, you need to tell Git about spaceman-diff. Do that by editing `~/.gitconfig`:

```txt
[diff "spaceman-diff"]
  command = ~/Code/spaceman-diff/spaceman-diff
```

At this point, you should be ready to go. Try it out on a directory with an unstaged image change and run it with `git diff`.

## contributing

[Send a pull request][pull] with your changes, and make sure the tests pass. You can run dem tests with `./test` in your working directory.

## cool

This was cobbled together by [@holman](https://twitter.com/holman).

[jp2a]:        https://csl.name/jp2a/
[imagemagick]: http://www.imagemagick.org
[brew]:        http://brew.sh
[pull]:        https://github.com/holman/spaceman-diff/compare
