# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Nextpnr < Formula
  desc "nextpnr portable FPGA place and route tool"
  homepage "https://github.com/YosysHQ/nextpnr"
  url "https://github.com/YosysHQ/nextpnr/archive/refs/tags/nextpnr-0.9.tar.gz"
  sha256 "8cebc65049ff91c411d963ea2304b1a3dd42036f79de2eb3e9834c842f934495"
  license "ISC"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "eigen" => :build
  depends_on "python"
  depends_on "boost"
  depends_on "boost-python3"
  depends_on "qt5"
  depends_on "icestorm"

  # depends_on "cmake" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    system "cmake", "-DARCH=ice40", ".", *std_cmake_args, "-DBoost_NO_BOOST_CMAKE=on", "-DBUILD_TESTS=OFF", "-DICEBOX_ROOT=#{HOMEBREW_PREFIX}/share/icebox"
    system "make", "install"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test nextpnr`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
