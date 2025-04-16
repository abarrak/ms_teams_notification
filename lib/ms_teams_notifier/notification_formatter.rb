require 'erb'
require 'active_support/core_ext/object/blank'

module MsTeamsNotifier
  class Formatter

    def initialize fields
      @fields = fields
    end

    def formlate_meessage message, fields_values: nil
      ERB.new(
        <<~HTML
          <%= message %>


          <u>More Details:</u>
          <br>
          <ul style="color: #400707">
            <% @fields.each do |f| %>
            <li><%= f #>: <%= fields_values[f] %>.</li>
            <% end %>
          </ul>
        HTML
      ).result(binding)
    end

  end
end
