#!/usr/bin/env bash
# install fedora dependencies

sudo dnf install \
  cmake \
  @development-tools \
  git \
  vim neovim \
  -y

