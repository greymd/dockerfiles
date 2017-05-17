#!/bin/bash
set -u
THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")"; pwd)"
while read sh_version ; do
    mkdir -p $THIS_DIR/$sh_version
    cat Dockerfile.skel \
        | sed "s/##REPLACE_HERE##/$sh_version/" \
        | tee > $THIS_DIR/$sh_version/Dockerfile
    echo "Created: $THIS_DIR/$sh_version/Dockerfile" >&2
done < versions

echo -n "Proceed [Enter]: "
read

while read sh_version ; do
    _cmd="docker build $THIS_DIR/$sh_version -t bash:$sh_version"
    echo "Execute: $_cmd" >&2
    eval "$_cmd"
done < versions
