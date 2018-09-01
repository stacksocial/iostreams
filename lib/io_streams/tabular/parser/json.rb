require 'json'
module IOStreams
  module Tabular
    module Parser
      # For parsing a single line of JSON at a time
      class Json < Base
        def parse(row)
          # return if row.blank?
          raise(Tabular::Errors::TypeMismatch, "Format is :json. Invalid input: #{row.class.name}") unless row.is_a?(String)

          JSON.parse(row)
        end

        # Return the supplied array as a single line JSON string.
        def render(row, header)
          hash = header.to_hash(row)
          hash.to_json
        end

        def requires_header?
          false
        end
      end
    end
  end
end