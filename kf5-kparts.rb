require "formula"

class Kf5Kparts < Formula
  url "http://download.kde.org/stable/frameworks/5.7/kparts-5.7.0.tar.xz"
  sha1 "a133935e3a009ade8d8e2239261411a90a4adf19"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kparts.git'

  depends_on "cmake" => :build
  depends_on "kf5-extra-cmake-modules" => :build
  depends_on "kf5-kio"

  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
