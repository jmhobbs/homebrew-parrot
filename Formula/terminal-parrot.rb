class TerminalParrot < Formula
  desc "Party Parrot for your terminal"
  homepage "https://cultofthepartyparrot.com/"
  url "https://github.com/jmhobbs/terminal-parrot/archive/refs/tags/1.2.0.tar.gz"
  sha256 "fa860eec47f3158c16978d29e34eb0d9f77c733f5792162fb01dc78ed3f5a775"

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
