name: Build and Deploy

on:
  push:
    branches:
      - main  # Change this to your main branch

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Install Node.js
      uses: actions/setup-node@v3
      with:
        node-version: 14

    - name: Install dependencies
      run: npm install

    - name: Build project
      run: npm run build

  deploy:
    runs-on: ubuntu-latest
    needs: build
    steps:
    - name: Deploy to GitHub Pages
      uses: JamesIves/github-pages-deploy-action@4.2.3
      with:
        branch: gh-pages  # Change this to your target branch
        folder: dist      # Change this to the folder where your build artifacts are

