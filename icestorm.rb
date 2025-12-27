class Icestorm < Formula
  desc "Project IceStorm - Lattice iCE40 FPGAs Bitstream Documentation (Reverse Engineered)"
  homepage "https://github.com/YosysHQ/icestorm"
  url "https://github.com/YosysHQ/icestorm/archive/refs/tags/v1.1.tar.gz"
  sha256 "928dd541d15540a796a3d320122794d8d76acff90783de8c5747f613e474652f"
  license "ISC"

  depends_on "pkg-config" => :build
  depends_on "libftdi"
  depends_on "python"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/icepack", "--help"
  end
  
end
