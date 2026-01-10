#!/bin/bash

# Build script for DigiVault API Documentation

echo "🏗️  Building documentation..."
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

# Build the documentation
echo "📦 Building static site..."
mkdocs build

echo ""
if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "📂 Static files are in the 'site/' directory"
    echo "   You can deploy these files to any web server"
    echo ""
else
    echo "❌ Build failed. Please check the errors above."
    exit 1
fi

