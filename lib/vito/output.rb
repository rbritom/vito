module Vito
  class ConnectionOutput
    def initialize(stdin, stdout, stderr, thread)
      @stdout = stdout
      @stderr = stderr
      @thread = thread.value
    end

    def success?
      @thread.exitstatus == 0
    end

    def result
      if success?
        @result ||= @stdout
          .read
          .gsub(/(\n|\s){1,}\Z/, "")
      else
        @result ||= @stderr.read
      end
    end
  end
end
