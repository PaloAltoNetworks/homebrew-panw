class Cortexcli < Formula
  # A brief description of your binary
  desc "Unified CLI for Workloads, APIs and Code scanning"
  # The homepage for your project
  homepage "https://github.com/PaloAltoNetworks/cortexcli"
  
  version_str = "v0.15.0"
  
  # The version number of your binary
  version version_str
  
  # Homebrew will automatically select the correct block based on the user's system.
  on_macos do
    if Hardware::CPU.arm?
      # Apple Silicon (M1, M2, etc.)
      url "https://github.com/PaloAltoNetworks/cortexcli/releases/download/#{version_str}/cortexcli-#{version_str}-arm64.tar.gz"
      sha256 "cd2630f6d691ea018f8da569ced38413b359bef603e7964df100237dd5920a04"
    elsif Hardware::CPU.intel?
      # Intel Macs
      url "https://github.com/PaloAltoNetworks/cortexcli/releases/download/#{version_str}/cortexcli-#{version_str}-x86_64.tar.gz"
      sha256 "3561ff2b9271c15b2391a0d7d8d00c98be9fd6a15272d82829fadb6cbf0da1a8"
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
    assert_match version_str, shell_output("#{bin}/cortexcli --version")
  end
end