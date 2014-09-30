module MapcodeHelper
  def mapbox_js_url
    "https://api.tiles.mapbox.com/mapbox.js/v1.6.4/mapbox.js"
  end

  def mapbox_css_url
    "https://api.tiles.mapbox.com/mapbox.js/v1.6.4/mapbox.css"
  end

  def mapbox_js_api
     content_tag(:script,:type => "text/javascript",:src => mapbox_js_url) do
     end
  end

  def mapbox_css_api
    stylesheet_link_tag( mapbox_css_url )
  end
end
