#!/bin/bash
suffix=$1
if [ -z "$suffix" ]; then
    echo "Specify suffix on command line"
    exit 1
fi
my_dir=$(dirname "${BASH_SOURCE[0]}")
base_dir=$(dirname $my_dir)
out_base="$base_dir/tmp_repo_$suffix"
(cd $my_dir && git commit -a -m 'Again')
cd $base_dir
for i in {1..20}
do
    out="${out_base}_${i}"
    echo $out
    rm -rf $out
    # git clone $my_dir $out
    # (cd $out && make)
done
