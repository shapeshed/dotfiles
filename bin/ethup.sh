#!/usr/bin/env bash

set -eEu -o pipefail

NODES=(node0 node1)
ETHDATA=~/.eth-dev
GETH=$GOPATH/src/github.com/ethereum/go-ethereum/build/bin/geth
VERBOSITY=9

for n in ${NODES[@]}; do

  # clear any chain data and re-init
  rm -Rf ${ETHDATA}/${n}/geth/chaindata
  rm -Rf ${ETHDATA}/${n}/geth/lightchaindata
  rm -Rf ${ETHDATA}/${n}/geth/transactions.rlp
  rm -Rf ${ETHDATA}/${n}/geth/ethash/*
  ${GETH} --datadir ${ETHDATA}/${n} init ${ETHDATA}/genesis.json

  if [[ ${NODES[0]} == ${n} ]]; then
    tmux new -s eth-dev -d
    tmux rename-window -t eth-dev cluster
    tmux send-keys -t cluster "${GETH} --config ${ETHDATA}/${n}/config.toml --verbosity ${VERBOSITY}" C-m
    tmux new-window -n console -t eth-dev:2
    tmux send-keys -t console "sleep 5 && ${GETH} --exec 'loadScript(\"${ETHDATA}/${n}/scripts/unlock.js\")' attach ipc:${ETHDATA}/${n}/geth.ipc" C-m
    tmux send-keys -t console "${GETH} attach ipc:${ETHDATA}/${n}/geth.ipc" C-m
  else
    tmux split-window -v -t cluster
    tmux send-keys -t cluster "${GETH} --config ${ETHDATA}/${n}/config.toml --verbosity ${VERBOSITY}" C-m
    tmux split-window -v -t console
    tmux send-keys -t console "sleep 5 && ${GETH} --exec 'loadScript(\"${ETHDATA}/${n}/scripts/unlock.js\")' attach ipc:${ETHDATA}/${n}/geth.ipc" C-m
    tmux send-keys -t console "${GETH} attach ipc:${ETHDATA}/${n}/geth.ipc" C-m
  fi

done

tmux attach -t eth-dev
