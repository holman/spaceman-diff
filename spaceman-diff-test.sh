#!/usr/bin/env roundup

describe "spaceman-diff: generates ascii image diffs!"

spaceman="./spaceman-diff"

it_shows_help_with_no_argv() {
  $spaceman | grep USAGE
}

it_falls_back_for_non_image_data() {
  output="$spaceman 5461eb0cf2c766799e9b5325b9b9eb54a0af0f7a"

  $output | grep "diff --git a/spaceman-diff b/spaceman-diff"
}
