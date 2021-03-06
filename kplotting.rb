require "formula"

class Kplotting < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kplotting-5.8.0.tar.xz"
  sha1 "beddec71add49c48e76a3edd6e5574c8a61499a1"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kplotting.git'

  depends_on "cmake" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
