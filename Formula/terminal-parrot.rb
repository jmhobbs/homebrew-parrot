class TerminalParrot < Formula
  desc "Party Parrot for your terminal"
  homepage "https://cultofthepartyparrot.com/"
  url "https://github.com/jmhobbs/terminal-parrot/archive/refs/tags/1.2.1.tar.gz"
  sha256 "bfa921f6263627488ae498e60bf7f8cbb22054956336f5339319f0ff83a275b6"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"parrot", "."
    pkgetc.install Dir["animations/*"]
    ohai "Additional animations can be installed in #{pkgetc}/animations"
    ohai "The command installed is `parrot`"
    ohai "PARTY ON!"
  end

  test do
    system bin/"parrot", "-loops", "1"
  end
end
