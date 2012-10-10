require "boxen/test"
require "boxen/cli"

class BoxenCLITest < Boxen::Test
  def setup
    @config = Boxen::Config.new
    @flags  = Boxen::Flags.new
    @cli    = Boxen::CLI.new(@config, @flags)
  end

  def test_initialize
    config = Boxen::Config.new
    flags  = Boxen::Flags.new

    cli = Boxen::CLI.new config, flags

    assert_equal config, cli.config
    assert_equal flags,  cli.flags

    assert_equal config, cli.runner.config
    assert_equal flags,  cli.runner.flags
  end

  def test_run
    @cli.runner.expects(:run)
    @cli.run
  end
end
