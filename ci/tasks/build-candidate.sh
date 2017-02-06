#!/usr/bin/env bash

set -e

semver=`cat version-semver/number`

BOSH_CLI="$(pwd)/$(echo bosh-cli/bosh-cli-*)"
chmod +x ${BOSH_CLI}

pushd bosh-cpi-release

  source .envrc

  echo $semver > src/bosh-softlayer-cpi/version

  cpi_release_name="bosh-softlayer-cpi"

  echo "building CPI release..."
  $BOSH_CLI create release --name $cpi_release_name --version $semver --tarball --force
popd

mv bosh-cpi-release/dev_releases/$cpi_release_name/$cpi_release_name-$semver.tgz candidate/











