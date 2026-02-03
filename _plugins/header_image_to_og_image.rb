# frozen_string_literal: true

# This plugin maps header.image to image for jekyll-seo-tag compatibility.
# The jekyll-seo-tag plugin looks for a top-level `image` field to generate
# og:image and twitter:image meta tags, but this site uses `header.image`.
# This hook bridges that gap automatically.

Jekyll::Hooks.register :posts, :pre_render do |post|
  # Skip if image is already set
  next if post.data['image']

  # Check if header.image exists
  header = post.data['header']
  next unless header.is_a?(Hash) && header['image']

  image_path = header['image'].to_s

  # Ensure the path is absolute (required for og:image to work correctly)
  image_path = "/#{image_path}" unless image_path.start_with?('/')

  # Set the image field for jekyll-seo-tag
  post.data['image'] = image_path
end
