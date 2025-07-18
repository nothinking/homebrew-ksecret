# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ksecret < Formula
  desc ""
  homepage ""
  url "https://github.com/nothinking/homebrew-ksecret/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "d136010431ba06d45f140515bd6fcd6badea546830fdbcb1c6d7e15a07e319db"
  license ""

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install 'sh/ksecret.sh' => 'ksecret'
    bin.install 'sh/ksecret-status.sh' => 'ksecret-status'
    bin.install 'sh/ksecret-search.sh' => 'ksecret-search'
    bin.install 'sh/ksecret-update.sh' => 'ksecret-update'
    bin.install 'sh/ksecret-copy.sh' => 'ksecret-copy'
    bin.install 'sh/ksecret-delete.sh' => 'ksecret-delete'
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ksecret`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
