class TerminalParrot < Formula
  desc "Party Parrot for your terminal"
  homepage "http://cultofthepartyparrot.com/"
  url "https://github.com/jmhobbs/terminal-parrot/archive/1.1.0.tar.gz"
  sha256 "beba7a1fb643b72e3d2f23f5371936828653e60c1bb1339cf732026e15b8370d"

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
