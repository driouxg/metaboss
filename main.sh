#!/bin/bash

echo "Running..."

# apt-get install -y pkg-config
apt-get install -y libudev-dev
apt-get install -y openssl
apt-get install -y libssl-dev

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

source $HOME/.cargo/env && rustup default nightly && rustup update

git clone https://github.com/samuelvanderwaal/metaboss.git

cd metaboss
git checkout main

cargo install --path ./

sleep 50000

/root/.cargo/bin/metaboss sign all --keypair /keypair.json --candy-machine-id <CANDY_MACHINE_ID> --v2