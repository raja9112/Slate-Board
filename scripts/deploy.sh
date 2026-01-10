#!/bin/bash

# Deploy script for DigiVault API Documentation to GitHub Pages

echo "🚀 Deploying to GitHub Pages..."
echo ""

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found. Running setup first..."
    echo ""
    ./setup.sh
    echo ""
fi

# Activate virtual environment
source venv/bin/activate

# Deploy to GitHub Pages
echo "📤 Deploying..."
mkdocs gh-deploy

echo ""
if [ $? -eq 0 ]; then
    echo "✅ Deployment successful!"
    echo ""
    echo "🌐 Your documentation is now live on GitHub Pages"
    echo ""
else
    echo "❌ Deployment failed. Please check the errors above."
    exit 1
fi

