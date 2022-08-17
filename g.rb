# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class G < Formula
  desc "Golang Version Manager"
  homepage "https://github.com/voidint/g"
  url "https://github.com/voidint/g/releases/download/v1.4.0/g1.4.0.darwin-arm64.tar.gz"
  sha256 "636919cdb4ac865bcfff16be11c786550df5986dec190396745bb834676465de"
  license "MIT"
  head "https://github.com/JS-mark/homebrew-g.git", branch: "main"
  # 按照版本存放
  version "1.4.0"
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    bin.install "g"
  end

  def caveats
    <<~EOS
      # 建议安装前清空`GOROOT`、`GOBIN`等环境变量
      $ curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash
      $ echo "unalias g" >> ~/.bashrc # 可选。若其他程序（如'git'）使用了'g'作为别名。
      $ source ~/.bashrc # 或者 source ~/.zshrc

      $ ~/.bashrc
      # export GOROOT="${HOME}/.g/go"
      # export PATH="${HOME}/.g/go/bin:$PATH"
      # export G_MIRROR=https://golang.google.cn/dl/
    EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test g`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # system "false"
    system bin/"g", "-v"
  end
end
