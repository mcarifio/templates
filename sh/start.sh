#!/usr/bin/env bash
# Mike Carifio <mike@carif.io>


# exit on error
#set -e

function usage {
    echo <<EOF
-v verbose
-h help
-? help
EOF
}

function complete {
    echo "bash completion spec tbs"
}

function on_exit {
    :
}
trap on_exit EXIT

function on_error {
  echo $* > /dev/stderr
  exit 1
}

here=$(dirname ${BASH_SOURCE})
me=$(basename ${BASH_SOURCE})

# read default values
[[ -r $0.defaults ]] && source $0.defaults || :


# parse arguments
OPTIND=1
let verbose=0
let usage=0

while getopts "h?v-d:" opt; do
    case "$opt" in
    h|\?)
        usage
        ;;
    v)  let verbose=1
        ;;

    *) shift ${OPTIND}
       on_error "'$1' is not a valid argument"
    esac
done

shift $((OPTIND-1))
[[ "$1" = "--" ]] && shift


echo "verbose: ${verbose}"
echo "usage: ${usage}"
exit 0
