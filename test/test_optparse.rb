class TestOptparse < MTest::Unit::TestCase
  def setup
    @configuration = {}

    @environments = {
      'production'  => 'https://prod.example',
      'staging'     => 'https://stg.example',
      'development' => 'http://dev.example'
    }

    @o = OptionParser.new

    @o.on "--[no-]cleanup",
          "Remove WAF at end of run." do |cleanup|
      @configuration[:CLEANUP] = cleanup
    end

    @o.on_head "--environment=ENVIRONMENT", @environments.keys,
               "Set the environment you want to work with." do |environment|
      @configuration[:ENVIRONMENT] = environment
    end

    @o.on "--array=ITEMS", Array do |array|
      @configuration[:ARRAY] = array
    end

    @o.on "--integer=INTEGER", Integer do |integer|
      @configuration[:INTEGER] = integer
    end

    @o.on "-X=VALUEX", String do |string|
      @configuration[:X] = string
    end

    @o.on "-y=VALUEY", Integer do |integer|
      @configuration[:Y] = integer
    end

    @o.banner = "Usage: mruby #{__FILE__} [OPTIONS]"
  end

  def test_parse
    @o.parse '--cleanup'

    assert @configuration[:CLEANUP]
  end

  def test_parse_short
    @o.parse '-X', 'foobar'

    assert_equal @configuration[:X], 'foobar'
  end

  def test_parse_short_int
    @o.parse '-y', '5471'

    assert_equal @configuration[:Y], 5471
  end

  def test_parse_no_argument_completion
    assert_raise OptionParser::AmbiguousOption do
      @o.parse '--clean'
    end
  end

  def test_parse_argument_conversion
    @o.parse '--array=1,2,3'

    assert_equal %w[1 2 3], @configuration[:ARRAY]
  end

  def test_parse_argument_validation
    @o.parse '--integer=1'

    assert_equal 1, @configuration[:INTEGER]
  end

  def test_parse_argument_validation_invalid
    assert_raise OptionParser::InvalidArgument do
      @o.parse '--integer=string'
    end
  end

  def test_parse_value_completion
    assert_raise OptionParser::AmbiguousArgument do
      @o.parse '--environment', 'prod'
    end
  end

  def test_record_separator
    assert_equal "\n", @o.record_separator

    @o.record_separator = "\r\n"

    assert_equal "\r\n", @o.record_separator
  end

  def test_to_s
    help = @o.to_s

    assert %r'Usage: '.match(help)
    assert %r'--environment'.match(help)
    assert %r'Set the environment'.match(help)
    assert %r'--\[no-\]cleanup'.match(help)
  end
end

MTest::Unit.new.run if __FILE__ == $0
