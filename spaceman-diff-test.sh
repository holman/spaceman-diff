#!/usr/bin/env roundup

describe "spaceman-diff: generates ascii image diffs!"

spaceman="./spaceman-diff"

it_shows_help_with_no_argv() {
  $spaceman | grep USAGE
}

it_renders_diff() {
  output="$spaceman test/images/flag.png test/images/flag.png a190ba 100644 test/images/gooder-flag.png 000000 100644"

  $output | grep "OLD:"
  $output | grep "NEW:"
}
