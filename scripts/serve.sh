#!/bin/bash

# Quick serve script for DigiVault API Documentation

echo "🚀 Starting documentation server..."
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

# Check if mkdocs is installed
if ! command -v mkdocs &> /dev/null; then
    echo "❌ MkDocs not installed. Running setup..."
    echo ""
    pip install -r requirements.txt -vv \
    --index-url=https://pkgproxy-uat.coinswitch.co/pypi/simple

    echo ""
fi

# Start the server
echo "✅ Starting server on http://localhost:8000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

mkdocs serve

