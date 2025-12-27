class Nextpnr < Formula
  desc "nextpnr portable FPGA place and route tool"
  homepage "https://github.com/YosysHQ/nextpnr"
  url "https://github.com/YosysHQ/nextpnr/archive/refs/tags/nextpnr-0.9.tar.gz"
  sha256 "8cebc65049ff91c411d963ea2304b1a3dd42036f79de2eb3e9834c842f934495"
  license "ISC"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "eigen"
  depends_on "python"
  depends_on "boost"
  depends_on "boost-python3"
  depends_on "qt@5"
  depends_on "icestorm"

def install
  system "cmake", "-S", ".", "-B", "build",
    "-DARCH=ice40",
    "-DBUILD_GUI=ON",
    "-DBUILD_TESTS=OFF",
    "-DICEBOX_ROOT=#{HOMEBREW_PREFIX}/share/icebox",
    "-DBoost_NO_BOOST_CMAKE=ON",
    "-DBoost_USE_MULTITHREADED=ON",
    *std_cmake_args
  system "cmake", "--build", "build"
  system "cmake", "--install", "build"
end

  test do
    system bin/"nextpnr-ice40", "--version"
  end
end
