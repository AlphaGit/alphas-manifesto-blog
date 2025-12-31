# Developer Guide for AI Agents - Alpha's Manifesto Blog

This document provides comprehensive guidelines for AI agents working on Alpha's Manifesto blog. It covers setup, development workflows, testing, and visual design principles.

## Project Overview

**Alpha's Manifesto** is a personal technical blog powered by Jekyll 3.8, a static site generator written in Ruby. The blog covers topics in AI, software engineering, book reviews, and technical tutorials.

### Tech Stack
- **Static Site Generator**: Jekyll 3.8
- **Template Language**: Liquid (Jekyll's templating system)
- **Styling**: SCSS/Sass
- **Content Format**: Markdown with YAML front matter
- **Containerization**: Docker with docker-compose
- **CI/CD**: GitHub Actions
- **Deployment**: GitHub Pages (via CNAME: blog.alphasmanifesto.com)

### Key Jekyll Plugins
- `jekyll-paginate`: Pagination support for blog posts
- `jekyll-sitemap`: Automatic sitemap generation
- `jekyll-gist`: Embed GitHub gists
- `jekyll-seo-tag`: SEO meta tags
- `jekyll-feed`: RSS/Atom feed generation
- `jekyll-include-cache`: Performance optimization for includes

## Repository Structure

```text
alphas-manifesto-blog/
├── _config.yml              # Jekyll configuration
├── _posts/                  # Blog posts organized by year
│   ├── 2006/
│   ├── 2007/
│   ├── ...
│   └── 2025/
├── _drafts/                 # Draft posts (not published)
├── _layouts/                # Page layout templates
│   ├── default.html
│   ├── home.html
│   ├── page.html
│   └── post.html
├── _includes/               # Reusable HTML components
│   ├── head.html
│   ├── header.html
│   ├── left-sidebar.html
│   ├── post-metadata.html
│   ├── post-main-image.html
│   ├── pagination.html
│   ├── disqus-comments.html
│   └── google-analytics.html
├── _sass/                   # SCSS stylesheets
│   ├── site.scss
│   ├── monokai.scss
│   └── monokai-custom.scss
├── assets/                  # Static assets (images, CSS, JS)
│   ├── alpha/               # Logo and branding assets
│   ├── css/
│   └── [post-specific-folders]/
├── _data/                   # Data files (YAML, JSON, CSV)
│   └── navigation.yml
├── docker-compose.yml       # Docker orchestration
├── jekyll.Dockerfile        # Docker image for Jekyll
├── .github/workflows/       # CI/CD pipelines
│   └── main.yml
├── index.html               # Homepage
├── categories.html          # Categories page
├── 404.html                 # Custom 404 page
└── README.md                # Project readme (currently empty)
```

### Important Directories

- **`_posts/YEAR/`**: All published blog posts, organized by year. File naming: `YYYY-MM-DD-slug.md`
- **`_drafts/`**: Unpublished draft posts (no date in filename required)
- **`assets/`**: All static files. Images for specific posts often have their own subdirectories named after the post date (e.g., `assets/2024-03-10-ai-search-has-made-me-more-human/`)
- **`_layouts/`**: HTML templates that define page structure
- **`_includes/`**: Reusable HTML components that can be included in layouts

## Local Development Setup

### Prerequisites
- Docker and docker-compose installed on your system

### Running Locally

1. **Start the development server**:
   ```bash
   docker-compose up
   ```
   This will:
   - Build the Jekyll Docker image (first time only)
   - Install all required Jekyll plugins
   - Start Jekyll with `--watch` and `--incremental` flags
   - Serve the site at `http://localhost:4000`

2. **Access the site**:
   Open your browser to `http://localhost:4000`

3. **Auto-reload**:
   Jekyll watches for file changes and automatically rebuilds the site. You may need to refresh your browser to see changes.

4. **Stop the server**:
   Press `Ctrl+C` in the terminal, or run:
   ```bash
   docker-compose down
   ```

### Alternative: Local Jekyll Installation

If you have Ruby installed locally, you can run Jekyll without Docker:

```bash
# Install dependencies
gem install jekyll bundler
gem install jekyll-sitemap jekyll-paginate jekyll-gist jekyll-feed jekyll-include-cache jekyll-seo-tag

# Serve the site
jekyll serve --watch --incremental
```

## Creating New Blog Posts

### Post File Structure

All posts must be placed in `_posts/YEAR/` with the filename format: `YYYY-MM-DD-slug.md`

Example: `_posts/2025/2025-12-31-my-new-post.md`

### Front Matter Template

Every post must include YAML front matter at the top:

```yaml
---
title: Your Post Title Here
subtitle: A brief subtitle or tagline
categories:
  - Category1
  - Category2
tags:
  - tag1
  - tag2
  - tag3
header:
  image: assets/path/to/header-image.png
  image_description: Alt text for the header image
description: A concise meta description for SEO (appears in search results)
excerpt_separator: <!--more-->
---
```

### Front Matter Fields

- **title** (required): The main title of the post
- **subtitle** (optional): A subtitle that appears below the title
- **categories** (optional): High-level categorization (e.g., AI, Programming, Book Review)
- **tags** (optional): Specific topics covered in the post
- **header.image** (optional): Path to header image (relative to site root)
- **header.image_description** (optional): Alt text for accessibility
- **description** (required): Meta description for SEO and social sharing
- **excerpt_separator** (required): Use `<!--more-->` to mark where the excerpt ends

### Post Content Structure

```markdown
---
[Front matter as shown above]
---

Opening paragraph that serves as a hook. This appears before the excerpt separator.

<!--more-->

## Main Content Section

Your main content goes here. Use proper markdown formatting:

- Headings: `##` for main sections, `###` for subsections (note: `#` is reserved for the main title of the page, generated from front matter)
- Code blocks: Use triple backticks with language identifier
- Images: `![Alt text](path/to/image.png)`
- Links: `[Link text](https://example.com)`

### Subsection

More content...

## Conclusion

Wrap up your thoughts.
```

### Adding Images

1. **Create a post-specific directory** (recommended for posts with multiple images):
   ```bash
   mkdir -p assets/YYYY-MM-DD-post-slug/
   ```

2. **Place images in the directory**:
   - Use descriptive filenames (e.g., `architecture-diagram.png`)
   - Prefer web-optimized formats: WebP, PNG, or JPEG
   - Optimize images before adding them (compress, resize appropriately)

3. **Reference in markdown**:
   ```markdown
   ![Architecture diagram showing the system components]({{ site.baseurl }}/assets/2025-12-31-post-slug/architecture-diagram.png)
   ```

4. **For single images**, you can place them directly in the `assets/` root directory

### Draft Posts

To create a draft post that won't be published:

1. Create the file in `_drafts/` directory
2. No date prefix required in filename: `my-draft-post.md`
3. Preview drafts locally by running:
   ```bash
   jekyll serve --watch --incremental --drafts
   ```

## Testing Changes

### 1. Visual Verification

After starting the development server (`docker-compose up`), verify:

- **Homepage** (`http://localhost:4000`): Check that latest posts appear correctly
- **Post page** (`http://localhost:4000/YYYY/MM/DD/slug/`): Verify post renders properly
- **Categories** (`http://localhost:4000/categories.html`): Ensure categories are correct
- **Pagination**: Navigate through paginated posts (if applicable)

### 2. Content Verification Checklist

For each new or modified post, verify:

- [ ] Title and subtitle display correctly
- [ ] Header image loads and has proper alt text
- [ ] Excerpt appears correctly on homepage (content before `<!--more-->`)
- [ ] All images load correctly
- [ ] Code blocks have proper syntax highlighting
- [ ] Links are working (both internal and external)
- [ ] Categories and tags are assigned correctly
- [ ] Post metadata (date, read time, author) displays properly
- [ ] Disqus comments section loads (if enabled)
- [ ] Social sharing buttons work

### 3. Responsive Design Testing

Test the site at different viewport sizes:

- **Mobile** (320px - 767px): Navigation, images, and text should adapt
- **Tablet** (768px - 1023px): Sidebar and content layout
- **Desktop** (1024px+): Full layout with sidebar

### 4. Build Validation

Check for Jekyll build errors:

```bash
# In the docker-compose terminal output, look for:
# - "Server running..." (successful build)
# - Any error messages or warnings
# - "Regenerating..." messages when files change
```

Common build issues:
- Invalid YAML front matter (indentation, syntax)
- Missing or incorrect file paths for images
- Liquid template errors
- Invalid date format in filenames

### 5. Link Verification

For important posts, manually check:
- All external links are valid
- Internal links use correct paths
- Anchor links work properly

## Verifying Results

### Pre-Commit Verification

Before committing changes, verify:

1. **Build succeeds without errors**:
   ```bash
   docker-compose up
   # Check terminal output for successful build
   ```

2. **Visual inspection**:
   - Browse to the affected pages
   - Check in different browsers if possible (Chrome, Firefox, Safari)
   - Test on mobile device or use browser dev tools (F12 → Toggle device toolbar)

3. **Content accuracy**:
   - Proofread the post content
   - Verify all images display correctly
   - Check that code examples are properly formatted
   - Ensure links are working

4. **SEO elements**:
   - Title is descriptive and under 60 characters
   - Description is compelling and under 160 characters
   - Header image exists and is appropriate
   - Proper heading hierarchy (H1 → H2 → H3)

### Post-Deployment Verification

After deploying to GitHub Pages:

1. **Wait for deployment** (usually 2-5 minutes after push to main)
2. **Check live site**: Visit `https://blog.alphasmanifesto.com`
3. **Verify the post appears**: Navigate to the specific post URL
4. **Test social sharing**: Check Open Graph tags using:
   - [Twitter Card Validator](https://cards-dev.twitter.com/validator)
   - [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)
5. **Check RSS feed**: Verify post appears in `https://blog.alphasmanifesto.com/feed.xml`

## Visual Design Guidelines

### Overall Design Philosophy

Alpha's Manifesto uses a **clean, minimalist design** with a focus on readability. The design emphasizes:

- High-contrast text for readability
- Generous whitespace
- Clear typography hierarchy
- Monospace font theme (technical/coding aesthetic)

### Color Scheme

- **Background**: White/light gray
- **Text**: Dark gray/black (high contrast)
- **Links**: Blue with underline
- **Code blocks**: Monokai color scheme (dark background, syntax highlighting)
- **Accents**: Minimal use of color for emphasis

### Typography

- **Body text**: Serif or sans-serif, optimized for reading
- **Code**: Monospace font (consistent with Monokai theme)
- **Headings**: Bold, clear hierarchy (H1 > H2 > H3)

### Layout Components

1. **Left Sidebar** (`_includes/left-sidebar.html`):
   - Logo (Alpha figure)
   - Author bio
   - Navigation links
   - Social media links
   - Widgets (defined in `_config.yml`)

2. **Main Content Area**:
   - Full-width post content
   - Responsive: sidebar collapses on mobile

3. **Post Header**:
   - Title (H1)
   - Subtitle (if present)
   - Header image (if specified)
   - Metadata (date, read time, categories)

4. **Post Footer**:
   - Tags
   - Social sharing buttons
   - Disqus comments

### Visual Best Practices

#### Images

- **Aspect ratios**: Prefer 16:9 or 4:3 for header images
- **Resolution**: High enough for retina displays (2x), but optimized for web
- **File size**: Compress images to < 500KB when possible
- **Alt text**: Always provide descriptive alt text for accessibility
- **Captions**: Use markdown images with descriptive text

Example:
```markdown
![Detailed architectural diagram showing the three-tier system with database, API server, and frontend client](assets/2025-12-31-architecture/system-diagram.png)
```

#### Code Blocks

- **Syntax highlighting**: Always specify language for code blocks
- **Line length**: Keep code lines under 80-100 characters when possible
- **Formatting**: Use consistent indentation

Example:
````markdown
```python
def calculate_fibonacci(n):
    """Calculate the nth Fibonacci number."""
    if n <= 1:
        return n
    return calculate_fibonacci(n-1) + calculate_fibonacci(n-2)
```
````

#### Headings Hierarchy

- **H1**: Post title (automatic from front matter) - only one per page
- **H2**: Main sections of the post
- **H3**: Subsections
- **H4**: Rarely used, for deeply nested content

Never skip heading levels (e.g., don't go from H2 to H4).

#### Lists and Formatting

- Use **bullet points** for unordered lists
- Use **numbered lists** for sequential steps
- Use **bold** for emphasis (sparingly)
- Use **italics** for subtle emphasis or foreign words
- Use **blockquotes** (`>`) for quotes or callouts

#### Embedded Content

- **Twitter embeds**: Use official Twitter embed code (as shown in recent posts)
- **YouTube videos**: Use responsive iframe embeds
- **GitHub gists**: Use `{% gist username/gist_id %}` tag (requires jekyll-gist plugin)

### Responsive Design Considerations

When adding new layouts or styles:

- **Mobile-first**: Design for mobile, then enhance for larger screens
- **Touch targets**: Ensure buttons/links are at least 44x44px on mobile
- **Font sizes**: Readable on small screens (minimum 16px for body text)
- **Images**: Use responsive images that scale appropriately
- **Navigation**: Ensure sidebar navigation is accessible on mobile (hamburger menu or similar)

## Custom SCSS Styling

If you need to modify styles:

1. **Edit existing SCSS**:
   - `_sass/site.scss`: Main site styles
   - `_sass/monokai.scss`: Code syntax highlighting (Monokai theme)
   - `_sass/monokai-custom.scss`: Custom overrides for Monokai

2. **Jekyll compiles SCSS automatically** when the site builds

3. **Test style changes**:
   - Refresh browser after Jekyll rebuilds
   - Use browser DevTools (F12) to inspect elements
   - Verify changes across different screen sizes

## Working with Includes

Includes are reusable HTML components. Common use cases:

### Modifying Existing Includes

1. Open the include file in `_includes/`
2. Make your changes
3. Jekyll will rebuild automatically
4. Refresh browser to see changes

### Creating New Includes

1. Create a new file in `_includes/` (e.g., `_includes/custom-component.html`)
2. Add your HTML/Liquid code
3. Include it in a layout or post:
   ```liquid
   {% include custom-component.html %}
   ```

### Passing Parameters to Includes

Example:
```liquid
{% include custom-component.html title="My Title" color="blue" %}
```

In the include file:
```html
<div style="color: {{ include.color }}">
  <h2>{{ include.title }}</h2>
</div>
```

## CI/CD Pipeline

### GitHub Actions Workflow

The repository uses GitHub Actions for automated testing on pull requests.

**Workflow file**: `.github/workflows/main.yml`

**What it does**:
- Triggers on all pull requests
- Runs `jekyll-seo-ai-action` (custom action by AlphaGit)
- Uses OpenAI API to analyze and suggest SEO improvements
- Posts suggestions as PR comments

**Important**: This workflow requires:
- `OPENAI_API_KEY` secret configured in GitHub repository settings
- `GITHUB_TOKEN` (automatically provided by GitHub Actions)

### Making Changes to CI/CD

If you need to modify the workflow:

1. Edit `.github/workflows/main.yml`
2. Test changes by creating a pull request
3. Monitor the Actions tab in GitHub to see results

## Git Workflow

### Branch Strategy

- **Main branch**: Production-ready code, deployed to GitHub Pages
- **Feature branches**: Named `claude/feature-name-sessionId` for AI agent work
- **Pull requests**: Required for merging to main (triggers CI/CD)

### Commit Messages

Use clear, descriptive commit messages:

```text
Add new post about Rust micrograd implementation

- Created post file with front matter
- Added diagrams to assets/2025-03-02-alphas-micrograd-rust/
- Optimized images for web
```

### Typical Workflow

1. **Create/checkout feature branch**:
   ```bash
   git checkout -b claude/add-new-post-abc123
   ```

2. **Make changes** (create post, add images, etc.)

3. **Test locally** using `docker-compose up`

4. **Commit changes**:
   ```bash
   git add _posts/2025/2025-12-31-new-post.md
   git add assets/2025-12-31-new-post/
   git commit -m "Add new post about X"
   ```

5. **Push to remote**:
   ```bash
   git push -u origin claude/add-new-post-abc123
   ```

6. **Create pull request** on GitHub

7. **Review CI/CD results** and address any issues

8. **Merge to main** after approval

## Common Tasks Reference

### Add a New Blog Post

1. Create file: `_posts/YEAR/YYYY-MM-DD-post-slug.md`
2. Add front matter with all required fields
3. Write content in Markdown
4. Add images to `assets/YYYY-MM-DD-post-slug/` (if needed)
5. Test locally: `docker-compose up` and visit `http://localhost:4000`
6. Verify post appears on homepage and renders correctly
7. Commit and push changes

### Add a New Draft

1. Create file: `_drafts/post-slug.md` (no date prefix)
2. Add front matter
3. Write content
4. Preview with: `jekyll serve --drafts`
5. When ready to publish, move to `_posts/YEAR/` with date prefix

### Update Site Configuration

1. Edit `_config.yml`
2. Restart Jekyll server (changes to `_config.yml` require restart)
3. Verify changes

### Add a New Page (Not a Post)

1. Create file in root: `new-page.html` or `new-page.md`
2. Add front matter with `layout: page`
3. Add content
4. Link to it from navigation (edit `_data/navigation.yml` if needed)

### Modify Site Styles

1. Edit SCSS files in `_sass/`
2. Jekyll rebuilds automatically
3. Refresh browser to see changes
4. Use browser DevTools to debug

### Add a New Jekyll Plugin

1. Edit `jekyll.Dockerfile`:
   ```dockerfile
   RUN gem install jekyll-sitemap jekyll-paginate ... new-plugin-name
   ```
2. Edit `_config.yml`:
   ```yaml
   plugins:
     - new-plugin-name
   ```
3. Rebuild Docker image:
   ```bash
   docker-compose down
   docker-compose build
   docker-compose up
   ```

## Troubleshooting

### Jekyll Won't Build

**Symptoms**: Error messages in terminal, site not loading

**Solutions**:
- Check YAML front matter syntax (indentation, colons, quotes)
- Verify file paths for images are correct
- Look for Liquid template errors in layouts/includes
- Check that date in filename matches date in front matter
- Rebuild Docker image: `docker-compose build --no-cache`

### Images Not Loading

**Symptoms**: Broken image icons on site

**Solutions**:
- Verify image file exists at the specified path
- Check that path is relative to site root, not post file
- Ensure image filename matches exactly (case-sensitive)
- Clear browser cache and hard reload (Ctrl+Shift+R)

### Styles Not Updating

**Symptoms**: CSS changes don't appear

**Solutions**:
- Wait for Jekyll to rebuild (watch terminal for "Regenerating..." message)
- Hard reload browser (Ctrl+Shift+R)
- Clear browser cache
- Check for SCSS syntax errors in terminal output

### Docker Issues

**Symptoms**: Container won't start, port conflicts

**Solutions**:
- Check if port 4000 is already in use: `lsof -i :4000`
- Stop other processes using port 4000
- Restart Docker daemon
- Rebuild container: `docker-compose down && docker-compose up --build`

### Site Not Deploying to GitHub Pages

**Symptoms**: Changes pushed but not visible on live site

**Solutions**:
- Wait 2-5 minutes for GitHub Pages to rebuild
- Check GitHub repository Settings → Pages for deployment status
- Look for build errors in repository's Actions tab
- Verify CNAME file exists and contains correct domain
- Check that changes were merged to main branch (not a feature branch)

## Additional Resources

- **Jekyll Documentation**: [https://jekyllrb.com/docs/](https://jekyllrb.com/docs/)
- **Liquid Template Language**: [https://shopify.github.io/liquid/](https://shopify.github.io/liquid/)
- **Markdown Guide**: [https://www.markdownguide.org/](https://www.markdownguide.org/)
- **GitHub Pages Docs**: [https://docs.github.com/en/pages](https://docs.github.com/en/pages)
- **Jekyll Theme Development**: [https://jekyllrb.com/docs/themes/](https://jekyllrb.com/docs/themes/)

## Quick Reference Commands

```bash
# Start local development server
docker-compose up

# Stop server
docker-compose down

# Rebuild Docker image
docker-compose build --no-cache

# Serve with drafts visible
jekyll serve --watch --incremental --drafts

# Check Jekyll version
jekyll --version

# Build site without serving (output to _site/)
jekyll build
```

## Notes for AI Agents

### Best Practices

1. **Always test locally** before committing changes
2. **Verify images load** and are optimized for web
3. **Check responsive design** at multiple screen sizes
4. **Use semantic HTML** in includes and layouts
5. **Follow established patterns** from existing posts
6. **Maintain consistency** in file naming, directory structure, and formatting
7. **Optimize for performance**: compress images, minimize dependencies
8. **Think accessibility**: alt text, semantic markup, keyboard navigation

### Common Mistakes to Avoid

1. **Incorrect file paths**: Always use paths relative to site root
2. **Missing front matter fields**: Ensure all required fields are present
3. **Skipping local testing**: Always verify changes work before pushing
4. **Large image files**: Compress and optimize images before adding
5. **Breaking changes to layouts**: Test thoroughly when modifying shared components
6. **Inconsistent formatting**: Follow existing code style and conventions
7. **Hardcoded URLs**: Use Liquid variables and filters for site URLs

### When in Doubt

1. **Look at existing posts** for examples
2. **Check the official Jekyll docs** for Liquid syntax
3. **Test incrementally**: Make small changes and verify before continuing
4. **Use git to revert**: If something breaks, you can always revert changes
5. **Ask for clarification**: Better to ask than make incorrect assumptions

---

**Document Version**: 1.0
**Last Updated**: 2025-12-31
**Maintained By**: AlphaGit (with AI agent assistance)
