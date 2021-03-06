require "formula"

class Kitemviews < Formula
  url "http://download.kde.org/stable/frameworks/5.8/kitemviews-5.8.0.tar.xz"
  sha1 "483af2ff63a8de102522520e791240c6e77f9056"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kitemviews.git'

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
