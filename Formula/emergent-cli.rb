class EmergentCli < Formula
  desc "Command-line interface for the Emergent Knowledge Base platform"
  homepage "https://github.com/Emergent-Comapny/emergent"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Emergent-Comapny/emergent/releases/download/cli-v0.2.2/emergent-cli-darwin-arm64.tar.gz"
      sha256 "1fe9e9b58c3cbdeba28aff0575abb9916621841c986c5d7576f9b40dbfa98fa7"
    else
      url "https://github.com/Emergent-Comapny/emergent/releases/download/cli-v0.2.2/emergent-cli-darwin-amd64.tar.gz"
      sha256 "2885f098b25776c37c08c7d205d086f4281efab9495c0614c57616d0d0f66c24"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Emergent-Comapny/emergent/releases/download/cli-v0.2.2/emergent-cli-linux-arm64.tar.gz"
      sha256 "92a0b18425fe7f629953c84dc8a901e56f9adcc11c2d0f6447bbdbc01d676d11"
    else
      url "https://github.com/Emergent-Comapny/emergent/releases/download/cli-v0.2.2/emergent-cli-linux-amd64.tar.gz"
      sha256 "79e066ef747f77496643cdeb7b69fecf3a2f31cb631fa6d178e3f76c1cbb591b"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "emergent-cli-darwin-arm64" => "emergent"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "emergent-cli-darwin-amd64" => "emergent"
    elsif OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      bin.install "emergent-cli-linux-arm64" => "emergent"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "emergent-cli-linux-amd64" => "emergent"
    else
      bin.install "emergent"
    end
    
    (bash_completion/"emergent").write Utils.safe_popen_read("#{bin}/emergent", "completion", "bash")
    (zsh_completion/"_emergent").write Utils.safe_popen_read("#{bin}/emergent", "completion", "zsh")
    (fish_completion/"emergent.fish").write Utils.safe_popen_read("#{bin}/emergent", "completion", "fish")
  end

  test do
    assert_match "Emergent CLI", shell_output("#{bin}/emergent version")
  end
end
