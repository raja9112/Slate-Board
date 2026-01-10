# Slate-Board API Documention Framework

Modern, beautiful API documentation powered by MkDocs Material with custom styling.

## 🚀 Quick Start

### First Time Setup

```bash
./setup.sh          # Mac/Linux
# or
scripts\setup.bat   # Windows
```

### Start Development Server

```bash
./serve.sh          # Mac/Linux
# or
scripts\serve.bat   # Windows
```

Open `http://localhost:8000` in your browser.

### Build for Production

```bash
./build.sh          # Mac/Linux
```

This creates a `site/` folder with all static files ready to deploy.

### Deploy to GitHub Pages

```bash
./deploy.sh         # Mac/Linux
```

---

## 📂 Project Structure

```
digivault-documentation/
├── docs/                       # 📝 Content (Markdown files)
│   ├── index.md               # Homepage
│   ├── quickstart.md          # Getting started
│   ├── authentication.md      # Auth guide
│   ├── contacts.md            # API endpoints
│   ├── ... (other pages)
│   ├── assets/                # Images and media
│   │   └── digivault-logo.svg
│   └── stylesheets/           # Custom CSS
│       ├── method-badges.css  # API method styling
│       └── header-styles.css  # Header customization
│
├── overrides/                  # 🎨 Custom templates
│   └── main.html              # Main template override
│
├── _next/static/css/           # Original Tailwind CSS
│   └── 714180f250899703.css   # From mirrored site
│
├── scripts/                    # 🔧 Build & deploy scripts
│   ├── setup.sh / setup.bat   # Installation
│   ├── serve.sh / serve.bat   # Development
│   ├── build.sh               # Production build
│   └── deploy.sh              # GitHub Pages deploy
│
├── mkdocs.yml                  # ⚙️ Configuration
├── requirements.txt            # Python dependencies
├── .gitignore                  # Git ignore rules
└── README.md                   # This file
```

---

## ✏️ Editing Content

All documentation is written in **Markdown** - no HTML knowledge needed!

### Edit a Page

1. Open any `.md` file in `docs/` folder
2. Make your changes
3. Save the file
4. Refresh browser - changes appear instantly!

### Add a New Page

1. Create `docs/new-page.md`
2. Add content in Markdown
3. Update `mkdocs.yml` navigation:
   ```yaml
   nav:
     - Home: index.md
     - Your New Page: new-page.md
   ```

### Markdown Examples

#### Headers
```markdown
# Main Heading
## Sub Heading
### Small Heading
```

#### Code Examples with Tabs
````markdown
=== "cURL"
    ```bash
    curl https://api.example.com
    ```

=== "Python"
    ```python
    import requests
    ```
````

#### API Endpoints
```markdown
<span class="method-badge method-get">GET</span> `/v1/endpoint`
<span class="method-badge method-post">POST</span> `/v1/endpoint`
<span class="method-badge method-put">PUT</span> `/v1/endpoint`
<span class="method-badge method-delete">DELETE</span> `/v1/endpoint`
```

#### Info Boxes
```markdown
!!! note
    Important information

!!! warning
    Be careful!

!!! tip
    Helpful hint
```

---

## 🎨 Customization

### Update Navigation

Edit `mkdocs.yml`:

```yaml
nav:
  - Home: index.md
  - Guides:
      - Quickstart: quickstart.md
      - Authentication: authentication.md
```

### Change Colors

Edit `docs/stylesheets/header-styles.css` or `docs/stylesheets/method-badges.css`

### Update Logo

Replace `docs/assets/digivault-logo.svg` with your logo

---

## 🚀 Deployment

### GitHub Pages

```bash
./deploy.sh
```

Your docs will be live at `https://yourusername.github.io/repository-name/`

### Other Hosting (Netlify, Vercel, etc.)

```bash
./build.sh
```

Upload the `site/` folder to your hosting provider.

**Build settings:**
- Build command: `mkdocs build`
- Publish directory: `site`

---

## 🛠️ Tech Stack

- **MkDocs** - Static site generator
- **Material for MkDocs** - Modern theme
- **TailwindCSS** - Original styling from mirrored site
- **Python** - Build system
- **Markdown** - Content format

---

## 📝 Features

✅ Beautiful UI matching original design  
✅ Dark mode toggle  
✅ Responsive design  
✅ Syntax highlighting  
✅ Search functionality  
✅ Multi-language code tabs  
✅ Clean Markdown editing  
✅ One-command deployment  

---

## 🐛 Troubleshooting

### Server won't start?

```bash
# Reinstall dependencies
./setup.sh
```

### Changes not showing?

- Hard refresh: `Cmd+Shift+R` (Mac) or `Ctrl+Shift+R` (Windows)
- Restart server: `Ctrl+C` then `./serve.sh`

### Build errors?

- Check Markdown syntax
- Ensure all referenced files exist
- Validate `mkdocs.yml` structure

---

## 📄 License

Copyright © 2025 DigiVault. All rights reserved.

---

## 🆘 Support

- [MkDocs Documentation](https://www.mkdocs.org/)
- [Material Theme Docs](https://squidfunk.github.io/mkdocs-material/)
- [Markdown Guide](https://www.markdownguide.org/)
