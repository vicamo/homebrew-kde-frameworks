require "formula"

class Kdnssd < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kdnssd-5.8.0.tar.xz"
  sha1 "c3a73ed275d8dd4835a51b6653d1520d43dfcaa7"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/attica.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
