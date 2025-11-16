#!/usr/bin/env bash

OUTDIR="/code/data"
if [ ! -e $OUTDIR ] ; then
    echo $OUTDIR does not exist!
fi

CUR_DIR=$(pwd)

set -eu

cd $OUTDIR
../download-srtm-data.sh
../create-tiles.sh SRTM_NE_250m.tif 10 10
rm -rf SRTM_NE_250m.tif
../create-tiles.sh SRTM_SE_250m.tif 10 10
rm -rf SRTM_SE_250m.tif
../create-tiles.sh SRTM_W_250m.tif 10 20
rm -rf SRTM_W_250m.tif

cd $CUR_DIR
