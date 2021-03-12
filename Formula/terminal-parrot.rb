class TerminalParrot < Formula
  desc "Party Parrot for your terminal"
  homepage "https://cultofthepartyparrot.com/"
  url "https://github.com/jmhobbs/terminal-parrot/archive/1.1.1.tar.gz"
  sha256 "93acae68396c8cb9e7a7ef4911503f03656e427b5791f4c2e5c9b3f8e56dce8d"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"parrot", "."
  end

  test do
    system bin/"parrot", "-loops", "1"
  end
end
