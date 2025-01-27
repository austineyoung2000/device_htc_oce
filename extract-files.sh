#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

DEVICE=oce
VENDOR=htc

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

CM_ROOT="$MY_DIR"/../../..

HELPER="$CM_ROOT"/vendor/rr/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

if [ $# -eq 0 ]; then
    SRC=adb
else
    if [ $# -eq 1 ]; then
        SRC=$1
    else
        echo "$0: bad number of arguments"
        echo ""
        echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
        echo ""
        echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
        echo "the device using adb pull."
        exit 1
    fi
fi

function blob_fixup() {
    case "${1}" in
    vendor/lib/libwvhidl.so)
        patchelf --replace-needed "libprotobuf-cpp-lite.so" "libprotobuf-cpp-lite-v28.so" "${2}"
    ;;
    vendor/lib64/libwvhidl.so)
        patchelf --replace-needed "libprotobuf-cpp-full.so" "libprotobuf-cpp-full-v28.so" "${2}"
    ;;
    vendor/lib64/libsettings.so)
        patchelf --replace-needed "libprotobuf-cpp-full.so" "libprotobuf-cpp-full-v28.so" "${2}"
    ;;
    grep -q libutils-v33.so "${2}" || "${PATCHELF}" --add-needed "libutils-v33.so" "${2}"
    ;;
    esac
}

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$CM_ROOT"

extract "$MY_DIR"/proprietary-files.txt "$SRC"

patchelf --add-needed "libbase_shim.so" "$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary/vendor/bin/imsrcsd
patchelf --add-needed "libbase_shim.so" "$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary/vendor/lib64/lib-uceservice.so
patchelf --add-needed "libbase_shim.so" "$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary/vendor/lib/lib-uceservice.so

"$MY_DIR"/setup-makefiles.sh
