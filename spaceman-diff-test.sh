#!/usr/bin/env roundup

describe "spaceman-diff: generates ascii image diffs!"

spaceman="./spaceman-diff"

it_shows_help_with_no_argv() {
  $spaceman | grep USAGE
}

it_deals_with_new_image() {
  output="$spaceman an-image-tho.png deadbeef 100644 img-tho.png /dev/null 100644"

  $output | grep "no img"
}
