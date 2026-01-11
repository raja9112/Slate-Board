# 📚 DigiVault API Documentation

> **A Beautiful, Modern API Documentation Website** built with MkDocs Material

This project creates a stunning, professional API documentation website that you can customize for any API. It uses simple text files (Markdown) to generate a complete, interactive website with search, dark mode, code examples, and more!

---

## 🎯 What is This Project?

Think of this as a **website builder specifically for API documentation**. Instead of writing HTML and CSS, you write simple text files (called Markdown files), and this tool automatically converts them into a beautiful website.

### What Can You Do With It?

- ✅ **Create beautiful documentation** for your API
- ✅ **Write in simple Markdown** (like writing a text message with formatting)
- ✅ **See changes instantly** while you edit
- ✅ **Publish to the internet** for free (GitHub Pages)
- ✅ **Dark/Light mode** automatically
- ✅ **Mobile-friendly** design
- ✅ **Search functionality** built-in
- ✅ **Code examples** with syntax highlighting
- ✅ **No coding required** to write content!

---

## 🖼️ What It Looks Like

Imagine a modern, professional website with:
- A **clean header** at the top with your logo and search
- A **sidebar menu** on the left to navigate
- **Beautiful content** in the center with code examples
- **HTTP method badges** like `GET`, `POST`, `PUT`, `DELETE`
- **Dark mode toggle** for nighttime reading
- **Fully responsive** - works on phones, tablets, and computers

---

## 📦 What's Inside This Project?

```
Slate-Board/                    # Main project folder
│
├── docs/                       # 📝 All your content goes here
│   ├── index.md               # Homepage (what people see first)
│   ├── quickstart.md          # Getting started guide
│   ├── authentication.md      # How to authenticate
│   ├── contacts.md            # Example API endpoint docs
│   ├── ... (more pages)
│   │
│   ├── assets/                # 🖼️ Images and logos
│   │   ├── digivault-logo.svg
│   │   └── ... (language icons)
│   │
│   └── stylesheets/           # 🎨 Custom styling
│       ├── header-styles.css  # Header design
│       └── method-badges.css  # HTTP method badges
│
├── overrides/                  # 🔧 Advanced customization
│   └── main.html              # Custom HTML template
│
├── scripts/                    # 🚀 Helpful automation scripts
│   ├── setup.sh               # One-time setup
│   ├── serve.sh               # Start local preview
│   ├── build.sh               # Create final website
│   └── deploy.sh              # Publish to internet
│
├── mkdocs.yml                  # ⚙️ Configuration file (settings)
├── requirements.txt            # 📋 List of needed software
├── venv/                       # 🐍 Python environment (auto-created)
└── README.md                   # 📖 This file!
```

---

## 🚀 Getting Started (Complete Beginner's Guide)

### Step 1: Check if You Have Python

**What is Python?** It's a programming language. Think of it as the engine that powers this project.

**How to check:**

1. Open **Terminal** (Mac) or **Command Prompt** (Windows)
2. Type this and press Enter:
   ```bash
   python3 --version
   ```
3. If you see something like `Python 3.x.x`, you're good! ✅
4. If you get an error, you need to install Python first ⬇️

**Don't have Python?**
- **Mac/Linux**: Usually comes pre-installed
- **Windows**: Download from [python.org](https://www.python.org/downloads/)
  - ⚠️ **IMPORTANT**: Check the box "Add Python to PATH" during installation!

---

### Step 2: One-Time Setup

This step installs everything the project needs. You only do this **once**.

**How to do it:**

1. Open **Terminal** (Mac) or **Command Prompt** (Windows)
2. Navigate to the project folder:
   ```bash
   cd /path/to/Slate-Board
   ```
   
   **💡 Tip**: You can drag the folder into Terminal to get the path automatically!

3. Make the setup script executable (Mac/Linux only):
   ```bash
   chmod +x scripts/setup.sh scripts/serve.sh scripts/build.sh scripts/deploy.sh
   ```

4. Run the setup:
   ```bash
   ./scripts/setup.sh
   ```
   
   **Windows users**:
   ```bash
   python -m venv venv
   venv\Scripts\activate
   pip install -r requirements.txt
   ```

**What happens during setup?**
- ✅ Creates a "virtual environment" (isolated workspace)
- ✅ Downloads and installs MkDocs and all plugins
- ✅ Takes 1-2 minutes depending on internet speed

**You'll see**: Lots of text scrolling by. This is normal! Wait until you see "Setup complete!"

---

### Step 3: Start the Preview Server

This shows you your website **LIVE** on your computer. Every time you save a file, the website updates automatically!

**How to start it:**

```bash
./scripts/serve.sh
```

**Windows users**:
```bash
venv\Scripts\activate
mkdocs serve
```

**What you'll see:**
```
✅ Starting server on http://localhost:8000
Press Ctrl+C to stop the server
```

**Now open your web browser** and go to:
```
http://localhost:8000
```

**🎉 You should see your documentation website!**

**💡 Keep this terminal window open** while you work. Press `Ctrl+C` to stop the server when done.

---

## ✏️ How to Edit Your Documentation

### The Magic of Markdown

You write in **Markdown** - it's like writing a text message with simple formatting.

**Examples:**

```markdown
# This is a Big Heading

## This is a Smaller Heading

This is regular text. You can make text **bold** or *italic*.

- This is a bullet point
- Another bullet point
  - Indented bullet point

1. This is a numbered list
2. Second item

[This is a link](https://example.com)

![This is an image](path/to/image.png)
```

### Where to Edit

All your content is in the `docs/` folder:

```
docs/
├── index.md          ← Homepage
├── quickstart.md     ← Getting started
├── authentication.md ← Auth guide
├── contacts.md       ← Example API docs
└── ... more pages
```

### How to Edit a Page

1. **Open any `.md` file** in a text editor (VS Code, Sublime, Notepad++, even Notepad!)
2. **Make your changes** using Markdown
3. **Save the file**
4. **Switch to your browser** - the page updates automatically! ✨

**No need to restart anything!** Just save and refresh.

---

## 📝 Creating a New Page

### Step 1: Create the File

1. Go to the `docs/` folder
2. Create a new file: `my-new-page.md`
3. Add content:
   ```markdown
   # My New Page
   
   This is my awesome new page!
   
   ## Section 1
   
   Some content here...
   ```

### Step 2: Add to Navigation

Open `mkdocs.yml` and find the `nav:` section:

```yaml
nav:
  - Home: index.md
  - Guides:
      - Quickstart: quickstart.md
      - My New Page: my-new-page.md  # ← Add this line
```

**💡 Indentation matters!** Use spaces, not tabs. Copy the pattern above.

### Step 3: Save and Check

Save `mkdocs.yml` and check your browser. You should see "My New Page" in the sidebar! 🎉

---

## 🎨 Special Features You Can Use

### 1. Code Examples with Multiple Languages

Show the same example in different programming languages:

```markdown
=== "Python"
    ```python
    print("Hello, World!")
    ```

=== "JavaScript"
    ```javascript
    console.log("Hello, World!");
    ```

=== "PHP"
    ```php
    echo "Hello, World!";
    ```
```

### 2. HTTP Method Badges

Show API endpoints with colored badges:

```markdown
<span class="method-badge method-get">GET</span> `/api/users`

<span class="method-badge method-post">POST</span> `/api/users`

<span class="method-badge method-put">PUT</span> `/api/users/:id`

<span class="method-badge method-delete">DELETE</span> `/api/users/:id`
```

**Colors:**
- `method-get` = Green (GET requests)
- `method-post` = Blue (POST requests)
- `method-put` = Yellow (PUT requests)
- `method-delete` = Red (DELETE requests)

### 3. Information Boxes

Create colored boxes for important information:

```markdown
!!! note
    This is a note box (blue)

!!! tip
    This is a tip box (green)

!!! warning
    This is a warning box (orange)

!!! danger
    This is a danger box (red)

!!! info
    This is an info box (blue)
```

### 4. Tables

Create beautiful tables:

```markdown
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Row 1    | Data     | More     |
| Row 2    | Data     | More     |
```

### 5. Adding Images

**From your assets folder:**
```markdown
![Logo](assets/logo.png)
```

**With custom size (HTML):**
```html
<img src="assets/logo.png" alt="Logo" width="200">
```

**Centered image:**
```html
<div style="text-align: center;">
  <img src="assets/logo.png" alt="Logo" width="200">
</div>
```

### 6. Buttons

Create clickable buttons:

```markdown
[Click Me](https://example.com){ .md-button }

[Primary Button](page.md){ .md-button .md-button--primary }
```

### 7. Grid Cards (Like on Homepage)

Create a grid of cards:

```markdown
<div class="grid cards" markdown>

-   :material-star: **Feature 1**
    
    ---
    
    Description of feature 1
    
    [Learn more →](link.md)

-   :material-heart: **Feature 2**
    
    ---
    
    Description of feature 2
    
    [Learn more →](link.md)

</div>
```

---

## 🎨 Customization Guide

### Change the Site Name

Open `mkdocs.yml`:

```yaml
site_name: DigiVault API Documentation  # ← Change this
site_description: Your description here  # ← And this
site_author: Your Name                   # ← And this
```

### Change the Logo

1. Put your logo file in `docs/assets/`
2. Open `mkdocs.yml`:
   ```yaml
   theme:
     logo: assets/your-logo.svg  # ← Change this
     favicon: favicon.ico        # ← And this for browser tab icon
   ```

### Change Colors

Open `docs/stylesheets/header-styles.css` and look for color values. Colors are in different formats:

- **HEX**: `#526cfe` (blue)
- **RGB**: `rgb(82, 108, 254)`
- **OKLCH**: `oklch(70.5% .015 286.067)` (modern format)

**Example - Change primary blue:**

Find: `#526cfe`  
Replace with: `#your-color`

**💡 Use a color picker tool** to find the hex code of any color!

### Change Fonts

Open `mkdocs.yml`:

```yaml
theme:
  font:
    text: Inter        # ← Main text font
    code: Fira Code    # ← Code font
```

**Popular font options:**
- Text: `Roboto`, `Open Sans`, `Lato`, `Poppins`, `Inter`
- Code: `Roboto Mono`, `Source Code Pro`, `JetBrains Mono`, `Fira Code`

---

## 🌐 Publishing Your Website (Making It Live on the Internet)

You have **3 options** to publish your documentation:

### Option 1: GitHub Pages (FREE & Recommended)

**What is it?** Free website hosting from GitHub. Perfect for documentation!

**Prerequisites:**
- A GitHub account (free at [github.com](https://github.com))
- Your project in a GitHub repository

**How to publish:**

1. Make sure you're in the project folder
2. Run the deploy script:
   ```bash
   ./scripts/deploy.sh
   ```

3. Wait 1-2 minutes

4. Your site will be live at:
   ```
   https://your-username.github.io/repository-name/
   ```

**That's it!** Every time you run the deploy script, your website updates.

**💡 Tip**: You can set up a custom domain later (like `docs.yoursite.com`)

---

### Option 2: Netlify (FREE)

**What is it?** Modern hosting platform with automatic deployments.

**How to do it:**

1. **Build your site:**
   ```bash
   ./scripts/build.sh
   ```
   This creates a `site/` folder with all your website files.

2. **Go to [netlify.com](https://netlify.com)** and sign up (free)

3. **Drag and drop** the `site/` folder onto Netlify

4. **Your site is live!** You get a URL like `your-site.netlify.app`

**For automatic deployments:**
- Connect your GitHub repository
- Set build command: `mkdocs build`
- Set publish directory: `site`
- Netlify will rebuild your site automatically when you push changes!

---

### Option 3: Vercel (FREE)

**What is it?** Another modern hosting platform (made by Next.js creators).

**How to do it:**

1. **Build your site:**
   ```bash
   ./scripts/build.sh
   ```

2. **Go to [vercel.com](https://vercel.com)** and sign up (free)

3. **Import your GitHub repository**

4. **Set framework preset**: Other

5. **Set build command**: `mkdocs build`

6. **Set output directory**: `site`

7. **Deploy!** Your site goes live at `your-site.vercel.app`

---

## 🛠️ Advanced Features

### Custom Domain

If you own a domain (like `docs.mysite.com`):

**For GitHub Pages:**
1. Go to repository settings
2. Find "GitHub Pages" section
3. Add your custom domain
4. Update DNS records at your domain provider

**For Netlify/Vercel:**
1. Go to domain settings in their dashboard
2. Add your custom domain
3. Follow their DNS instructions

---

### Search Engine Optimization (SEO)

Make your docs appear in Google search results:

1. Open `mkdocs.yml`
2. Fill in all metadata:
   ```yaml
   site_name: Your API Name
   site_description: A clear, detailed description of your API
   site_author: Your Company Name
   site_url: https://your-actual-domain.com
   ```

3. Add `robots.txt` (create `docs/robots.txt`):
   ```
   User-agent: *
   Allow: /
   
   Sitemap: https://your-site.com/sitemap.xml
   ```

4. Submit your sitemap to Google Search Console

---

### Analytics

Track how many people visit your docs:

1. Get a tracking ID from:
   - Google Analytics (free)
   - Plausible (privacy-focused)
   - Fathom (privacy-focused)

2. Open `mkdocs.yml`:
   ```yaml
   extra:
     analytics:
       provider: google
       property: G-XXXXXXXXXX  # Your tracking ID
   ```

---

## 📖 Complete Markdown Cheatsheet

### Headers

```markdown
# H1 - Biggest heading
## H2 - Second level
### H3 - Third level
#### H4 - Fourth level
##### H5 - Fifth level
###### H6 - Smallest heading
```

### Text Formatting

```markdown
**Bold text**
*Italic text*
***Bold and italic***
~~Strikethrough~~
`Inline code`
```

### Lists

```markdown
**Unordered list:**
- Item 1
- Item 2
  - Nested item
  - Another nested

**Ordered list:**
1. First
2. Second
   1. Nested
   2. Another
```

### Links

```markdown
[Link text](https://url.com)
[Link with title](https://url.com "Hover text")
[Internal link](page.md)
[Link to heading](page.md#heading-id)
```

### Images

```markdown
![Alt text](path/to/image.png)
![With title](image.png "Hover text")
```

### Code Blocks

````markdown
```python
def hello():
    print("Hello, World!")
```

```javascript
function hello() {
    console.log("Hello, World!");
}
```
````

### Blockquotes

```markdown
> This is a quote
> It can span multiple lines
```

### Horizontal Line

```markdown
---
or
***
or
___
```

### Task Lists

```markdown
- [x] Completed task
- [ ] Incomplete task
- [ ] Another task
```

---

## ⚙️ Configuration Reference

The `mkdocs.yml` file controls everything. Here's what each section does:

### Site Information

```yaml
site_name: Your Site Name        # Shows in browser tab
site_description: Description    # For search engines
site_author: Author Name         # Your name/company
site_url: https://your-site.com  # Your website URL
```

### Repository Links (Optional)

```yaml
repo_name: username/repo         # Shows repo name
repo_url: https://github.com/... # Link to GitHub
edit_uri: edit/main/docs/        # "Edit this page" links
```

### Theme Settings

```yaml
theme:
  name: material                 # Don't change this
  custom_dir: overrides          # Custom HTML templates
  logo: assets/logo.svg          # Your logo
  favicon: favicon.ico           # Browser tab icon
  
  palette:
    # Light mode colors
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: custom
      accent: emerald
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    
    # Dark mode colors
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: custom
      accent: emerald
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  
  font:
    text: Inter                  # Main font
    code: Fira Code              # Code font
  
  features:
    - navigation.instant         # Fast page loads
    - navigation.sections        # Group pages in sidebar
    - navigation.expand          # Expand sidebar groups
    - navigation.top             # Back to top button
    - search.suggest             # Search suggestions
    - search.highlight           # Highlight search results
    - content.code.copy          # Copy code button
```

### Plugins

```yaml
plugins:
  - search:                      # Search functionality
      separator: ...             # How to split words
  - minify:                      # Compress files
      minify_html: true
      minify_css: true
      minify_js: true
```

### Navigation

```yaml
nav:
  - Home: index.md
  - Guides:
      - Quickstart: quickstart.md
      - Auth: authentication.md
  - Resources:
      - Contacts: contacts.md
      - Messages: messages.md
```

**Rules:**
- Use **2 spaces** for indentation (not tabs!)
- Items with children (like "Guides") need a colon
- Items without children need the file path

---

## 🐛 Troubleshooting

### Problem: Server won't start

**Solution:**
```bash
# Reinstall everything
./scripts/setup.sh

# Or manually:
source venv/bin/activate  # Mac/Linux
pip install -r requirements.txt
```

### Problem: Changes not showing

**Solutions:**
1. **Hard refresh browser**: 
   - Mac: `Cmd + Shift + R`
   - Windows: `Ctrl + Shift + R`

2. **Restart server**:
   - Press `Ctrl + C` in terminal
   - Run `./scripts/serve.sh` again

3. **Clear browser cache**

### Problem: Build errors

**Common causes:**
1. **Syntax error in Markdown**
   - Check for missing closing tags
   - Check for wrong indentation in YAML/lists

2. **Missing file**
   - If you linked to `page.md`, make sure `docs/page.md` exists

3. **Invalid YAML in mkdocs.yml**
   - Use a YAML validator: [yamllint.com](http://www.yamllint.com/)
   - Check indentation (use spaces, not tabs)

### Problem: Images not showing

**Solutions:**
1. **Check file path**:
   - From `docs/index.md`: use `assets/logo.png`
   - From `docs/guides/page.md`: use `../assets/logo.png`

2. **Check file exists**: Make sure image is actually in `docs/assets/`

3. **Check file name**: Linux/Mac are case-sensitive! `Logo.png` ≠ `logo.png`

### Problem: Deployment failed

**For GitHub Pages:**
1. Check you're on the right branch
2. Make sure you committed all changes first
3. Check repository settings allow GitHub Pages

**For Netlify/Vercel:**
1. Check build command is correct: `mkdocs build`
2. Check output directory is correct: `site`
3. Check build logs for specific errors

### Problem: Python not found

**Solution:**
```bash
# Try python3 instead of python
python3 --version

# If still not found, install Python:
# Mac: brew install python3
# Windows: Download from python.org
```

---

## 💡 Pro Tips & Best Practices

### Writing Documentation

1. **Keep it simple**: Write like you're explaining to a friend
2. **Use examples**: Show, don't just tell
3. **Be consistent**: Use the same terms throughout
4. **Add screenshots**: Visual aids help a lot
5. **Test your examples**: Make sure code actually works
6. **Link related pages**: Help users navigate
7. **Use formatting**: Headers, lists, bold - make it scannable

### Organizing Pages

1. **Start with a table of contents** on long pages
2. **One topic per page**: Don't mix unrelated things
3. **Use meaningful file names**: `user-authentication.md` not `page3.md`
4. **Group related pages** in the navigation
5. **Keep hierarchy shallow**: Don't nest more than 2-3 levels

### Code Examples

1. **Show multiple languages** when possible
2. **Use realistic examples**: Real names, not `foo` and `bar`
3. **Include comments**: Explain what code does
4. **Show complete examples**: Don't leave out imports
5. **Highlight important lines**: Use comments to point out key parts

### Performance

1. **Optimize images**: Compress before adding
2. **Use SVG for logos**: They scale perfectly
3. **Don't commit node_modules or venv**: Use `.gitignore`
4. **Minimize custom CSS**: Use theme features first

### Maintenance

1. **Test locally before deploying**: Always preview first
2. **Keep dependencies updated**: Run `pip install --upgrade` occasionally
3. **Back up your content**: Use Git, commit often
4. **Document your customizations**: Leave comments in CSS/HTML
5. **Review analytics**: See what pages are popular

---

## 📚 Additional Resources

### Learning Markdown
- [Markdown Guide](https://www.markdownguide.org/)
- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- Practice: [StackEdit](https://stackedit.io/) (online editor)

### MkDocs Documentation
- [MkDocs Official Docs](https://www.mkdocs.org/)
- [Material Theme Docs](https://squidfunk.github.io/mkdocs-material/)
- [Material Theme Reference](https://squidfunk.github.io/mkdocs-material/reference/)

### Design Inspiration
- [Stripe API Docs](https://stripe.com/docs/api)
- [Twilio Docs](https://www.twilio.com/docs)
- [GitHub Docs](https://docs.github.com/)

### Tools
- **Text Editors**: VS Code, Sublime Text, Atom
- **Image Editing**: Figma, Canva (for banners)
- **Icons**: Material Icons, Font Awesome
- **Color Pickers**: [Coolors](https://coolors.co/), [ColorHunt](https://colorhunt.co/)
- **Screenshots**: Snagit, ShareX, built-in tools

---

## 🤝 Getting Help

### If You're Stuck

1. **Check this README**: Most answers are here
2. **Check the MkDocs docs**: [mkdocs.org](https://www.mkdocs.org/)
3. **Check Material theme docs**: [squidfunk.github.io/mkdocs-material](https://squidfunk.github.io/mkdocs-material/)
4. **Search GitHub issues**: Someone probably had the same problem
5. **Ask on Stack Overflow**: Tag with `mkdocs` and `mkdocs-material`

### Before Asking for Help

Please provide:
- What you're trying to do
- What you expected to happen
- What actually happened
- Error messages (copy the full text)
- Your operating system
- Python version (`python3 --version`)
- Steps to reproduce the problem

---

## 📄 Project Information

### Technology Stack

- **MkDocs**: Static site generator
- **Material for MkDocs**: Modern theme with tons of features
- **Python**: Powers the build system
- **Markdown**: Simple content format
- **CSS**: Custom styling
- **JavaScript**: Interactive features

### Browser Support

- ✅ Chrome/Edge (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Mobile browsers
- ⚠️ Internet Explorer: Not supported

### License

Copyright © 2025 DigiVault. All rights reserved.

Feel free to use this project as a template for your own documentation!

---

## 🎓 Summary: Your Quick Reference

### First Time Setup
```bash
./scripts/setup.sh
```

### Start Working
```bash
./scripts/serve.sh
# Open http://localhost:8000
```

### Edit Content
1. Edit any file in `docs/` folder
2. Save
3. See changes in browser instantly

### Add New Page
1. Create `docs/new-page.md`
2. Add to `mkdocs.yml` under `nav:`
3. Save and preview

### Build for Production
```bash
./scripts/build.sh
# Creates 'site/' folder
```

### Deploy to Web
```bash
./scripts/deploy.sh
# Publishes to GitHub Pages
```

---

## 🎉 You're Ready!

You now know everything you need to create, edit, customize, and publish beautiful API documentation!

**Remember:**
- 📝 Write in Markdown (super simple)
- 👀 Preview changes instantly
- 🚀 Deploy with one command
- 💡 Check this README when stuck
- 🎨 Customize to match your brand

**Happy documenting!** 🚀📚✨

---

**Questions? Something unclear?** This README should help anyone, even complete beginners, understand and use this project. If anything is confusing, let me know!
