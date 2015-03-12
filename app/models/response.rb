class Response
  attr_accessor :status
  attr_reader :headers, :stream

  def initialize
    @status = 200
    @headers = {}
    @stream = StringIO.new

    @temp
  end
end
