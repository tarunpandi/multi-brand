#!/bin/bash

# EDS Multi-Brand Documentation Setup Script
# This script helps set up the documentation environment

set -e

echo "🚀 Setting up EDS Multi-Brand Documentation..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js version 18 or higher."
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version 18 or higher is required. Current version: $(node -v)"
    exit 1
fi

echo "✅ Node.js version: $(node -v)"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

# Create necessary directories if they don't exist
echo "📁 Creating necessary directories..."
mkdir -p static/img
mkdir -p src/components

# Copy favicon if it doesn't exist
if [ ! -f "static/favicon.ico" ]; then
    echo "📄 Copying favicon..."
    cp ../favicon.ico static/favicon.ico 2>/dev/null || echo "⚠️  Could not copy favicon"
fi

# Create a basic .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "⚙️  Creating .env file..."
    cat > .env << EOF
# Documentation environment variables
NODE_ENV=development
PORT=3030
EOF
fi

echo ""
echo "🎉 Documentation setup complete!"
echo ""
echo "Next steps:"
echo "1. Start the documentation server: npm start"
echo "2. Open http://localhost:3030 in your browser"
echo "3. Edit docs/docs/intro.md to customize the content"
echo ""
echo "📚 Documentation will run on port 3030 (main app on port 3000)"
echo "For more information, see the README.md file in this directory." 