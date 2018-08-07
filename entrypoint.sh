#!/bin/bash

if [[ "${1}" = *#* ]]; then
	repository="${1%#*}"
	branch="${1#*#}"
else
	repository="${1}"
	branch="master"
fi

git clone "${repository}" && cd `basename "${repository//.git}"`
git checkout "${branch}"
shift

chmod +x "${1}" &> /dev/null
exec ${@}
