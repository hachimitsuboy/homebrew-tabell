# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tabell < Formula
  desc "Generate variable names"
  homepage "https://hachimitsuboy.github.io/tabell/"
  url "https://github.com/hachimitsuboy/tabell/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "83991e3acb38e5917e9b88ee8b15af6bc1744633ca2b28129e275d603fff0e62"
  license "MIT"

  option "without-completions", "Disable bash completions"
  depends_on "rustup" => :build
  depends_on "bash-completion@2" => :optional

  # depends_on "cmake" => :build
  def install
    bin.install "tabell"
    prefix.install "README.md"
    prefix.install "LICENSE"
    
    bash_completion.install "completions/bash/tabell" if build.with? "completions"
    zsh_completion.install  "completions/zsh/_tabell" if build.with? "completions"
    fish_completion.install "completions/fish/tabell" if build.with? "completions"
  end
end
