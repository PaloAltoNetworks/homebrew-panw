versionStr = "v0.13.0"

class CortexCli < Formula
  # A brief description of your binary
  desc "Unified CLI for Workloads, APIs and Code scanning"
  # The homepage for your project
  homepage "https://github.com/PaloAltoNetworks/cortexcli"
  # The version number of your binary
  version versionStr
  
  # Homebrew will automatically select the correct block based on the user's system.
  on_macos do
    if Hardware::CPU.arm?
      # Apple Silicon (M1, M2, etc.)
      url "https://github.com/PaloAltoNetworks/cortexcli/releases/download/#{versionStr}/cortexcli-#{versionStr}-arm64.tar.gz"
      sha256 "<SHA256_CHECKSUM_FOR_THE_ARM_ARCHIVE>"
    elsif Hardware::CPU.intel?
      # Intel Macs
      url "https://github.com/PaloAltoNetworks/cortexcli/releases/download/#{versionStr}/cortexcli-#{versionStr}-x86_64.tar.gz"
      sha256 "<SHA256_CHECKSUM_FOR_THE_INTEL_ARCHIVE>"
    end
  end

  def install
    # This is the key part for a pre-compiled binary.
    # It tells Homebrew to just copy the file to the right place.
    # "cortexcli" should be the name of the executable file inside your archive.
    bin.install "cortexcli"
  end

  # Optional: Add a test to confirm installation was successful
  test do
    # This test will run `cortexcli --version` and check if the output contains the version
    assert_match versionStr, shell_output("#{bin}/cortexcli --version")
  end
ends