class NextpnrIce40 < Formula
  desc "nextpnr portable FPGA place and route tool"
  homepage "https://github.com/YosysHQ/nextpnr"
  head "https://github.com/YosysHQ/nextpnr.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "eigen"
  depends_on "boost"
  depends_on "icestorm"

  def install
    system "cmake", "-S", ".", "-B", "build",
      "-DARCH=ice40",
      "-DBUILD_TESTS=OFF",
      "-DICEBOX_ROOT=#{HOMEBREW_PREFIX}/share/icebox",
      *std_cmake_args

    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system bin/"nextpnr-ice40", "--version"
  end
end