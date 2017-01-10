class TerminalParrot < Formula
  desc "Party Parrot for your terminal"
  homepage "http://cultofthepartyparrot.com/"
  url "https://github.com/jmhobbs/terminal-parrot/archive/1.0.1.tar.gz"
  sha256 "11377c31e14d21f40a6d307dd14356642e88113a2a540c7d1160baca9dd07f56"

  depends_on "go" => :build

  def install
    gopath = buildpath/"gopath"

    ENV["GOPATH"] = gopath
    ENV.prepend_create_path "PATH", gopath/"bin"

    system "go", "get", "-u", "github.com/nsf/termbox-go"
    system "go", "build", "-o", "parrot", "parrot.go", "draw.go", "data.go"

    bin.install "parrot"
  end

  test do
    system "#{bin}/parrot", "-loops", "1"
  end
end
