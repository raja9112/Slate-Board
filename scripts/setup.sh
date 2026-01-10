#!/bin/bash

# Setup script for DigiVault API Documentation
# This script sets up a Python virtual environment and installs all dependencies

echo "🚀 Setting up DigiVault API Documentation..."
echo ""

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3 first."
    echo "   Visit: https://www.python.org/downloads/"
    exit 1
fi

echo "✅ Python 3 found: $(python3 --version)"
echo ""

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
    echo "✅ Virtual environment created"
else
    echo "✅ Virtual environment already exists"
fi

echo ""

# Activate virtual environment
echo "🔌 Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip --quiet

# Install dependencies
echo "📥 Installing dependencies..."
pip install -r requirements.txt -vv \
    --index-url=https://pkgproxy-uat.coinswitch.co/pypi/simple


echo ""
echo "✅ Setup complete!"
echo ""
echo "📚 To start the documentation server, run:"
echo "   source venv/bin/activate"
echo "   mkdocs serve"
echo ""
echo "   Then open: http://localhost:8000"
echo ""
echo "🎉 Happy documenting!"

