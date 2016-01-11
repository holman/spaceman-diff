#!/usr/bin/env roundup

describe "spaceman-diff: generates ascii image diffs!"

spaceman="./spaceman-diff"

it_shows_help_with_no_argv() {
  $spaceman | grep USAGE
}

it_renders_diff() {
  output="$spaceman test/images/flag.png test/images/flag.png a190ba 100644 test/images/gooder-flag.png 000000 100644"

  $output | grep "OLD:"
  $output | grep "(84 KB)"
  $output | grep "NEW:"
  $output | grep "(9 KB)"
}

it_works_with_output_filenames_containing_spaces() {
  output_file=$(mktemp /tmp/XXXXX)

  $spaceman "test/images/flag.png" \
    "test/images/flag.png" a190ba 100644 \
    "test/images/with spaces.png" 000000 100644 > "$output_file"

  grep -F 'OLD: flag.png (84 KB)' < "$output_file"
  grep -F 'NEW: with spaces.png (9 KB)' < "$output_file"

  rm "$output_file"
}

it_works_with_input_filenames_containing_spaces() {
  output_file=$(mktemp /tmp/XXXXX)

  $spaceman "test/images/with spaces.png" \
    "test/images/with spaces.png" a190ba 100644 \
    "test/images/flag.png" 000000 100644 > "$output_file"

  grep -F 'OLD: with spaces.png (9 KB)' < "$output_file"
  grep -F 'NEW: flag.png (84 KB)' < "$output_file"

  rm "$output_file"
}
