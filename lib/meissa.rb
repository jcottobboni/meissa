require "meissa/engine"

module Meissa
  module Rails
  module Breadcrumbs

    class ActionController::Base

      protected

      def add_breadcrumb(name, url = '')
        @breadcrumbs ||= []
        url = send(url) if url.is_a?(Symbol)
        @breadcrumbs << [name, url]
      end

      def self.add_breadcrumb(name, url, options = {})
        before_filter options do |controller|
          controller.send(:add_breadcrumb, name, url)
        end
      end

    end

    module Helper

      def breadcrumbs(separator = "&rsaquo;")
        raw_breadcrumbs.join(" #{separator} ").html_safe
      end

      def raw_breadcrumbs
        @breadcrumbs.map do |txt, path|
          link_to_unless (path.blank? || current_page?(path)), content_tag(:span, h(txt)), path
        end
      end

    end
  end
  end


  ActionController::Base.send(:include, Rails::Breadcrumbs)
  ActionView::Base.send(:include, Rails::Breadcrumbs::Helper)
end
