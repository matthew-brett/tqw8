#!/bin/bash
suffix=$1
if [ -z "$suffix" ]; then
    echo "Specify suffix on command line"
    exit 1
fi
my_dir=$(dirname "${BASH_SOURCE[0]}")
base_dir=$(dirname $my_dir)
out="$base_dir/tmp_repo_$suffix"
rm -rf $out
(cd $my_dir && git commit -a -m 'Again')
cd $base_dir
git clone $my_dir $out
(cd $out && make)
