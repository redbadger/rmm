#!/usr/bin/env fish
argparse 'h/help' -- $argv
or return

if set -q _flag_help
    echo must specify example as the single argument
    return 0
end

argparse --min-args=1 -- $argv
or return

cargo build

pushd $argv[1]
../../target/debug/crux codegen --lib shared
popd
