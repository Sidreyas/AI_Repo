# 🛠️ Tools and Setup Guide

This directory contains setup guides and tool recommendations for your AI/ML learning journey.

## 📋 Essential Development Tools

### Code Editors & IDEs
- **VS Code** (Recommended)
  - Extensions: Python, Jupyter, GitLens, Pylance
  - Configuration files provided in this directory
- **PyCharm Community Edition**
  - Full-featured IDE for Python development
- **Jupyter Lab**
  - Interactive development environment
  - Great for data exploration and prototyping

### Version Control
- **Git** - Essential for all development
- **GitHub** - Code hosting and collaboration
- **DVC** - Data version control for ML projects

### Python Environment Management
- **Conda** - Package and environment management
- **Poetry** - Modern Python dependency management
- **pyenv** - Python version management

### Cloud Platforms
- **Google Colab** - Free GPU/TPU access
- **Kaggle Kernels** - Free compute with datasets
- **AWS SageMaker** - Production ML platform
- **Azure ML** - Microsoft's ML platform
- **Hugging Face Spaces** - Model deployment platform

## 🐍 Python Package Ecosystem

### Core Data Science
```bash
numpy>=1.21.0
pandas>=1.3.0
matplotlib>=3.4.0
seaborn>=0.11.0
scikit-learn>=1.0.0
jupyter>=1.0.0
```

### Deep Learning Frameworks
```bash
torch>=1.11.0
tensorflow>=2.8.0
transformers>=4.18.0
accelerate>=0.18.0
datasets>=2.0.0
```

### MLOps & Production
```bash
mlflow>=1.24.0
dvc>=2.10.0
fastapi>=0.75.0
uvicorn>=0.17.0
docker>=5.0.0
pytest>=7.0.0
```

### AI Agents & LLMs
```bash
langchain>=0.1.0
openai>=1.0.0
anthropic>=0.3.0
chromadb>=0.3.0
faiss-cpu>=1.7.0
```

## 🖥️ Development Environment Configurations

### VS Code Settings
```json
{
  "python.defaultInterpreterPath": "./venv/bin/python",
  "python.formatting.provider": "black",
  "python.linting.enabled": true,
  "python.linting.pylintEnabled": true,
  "jupyter.askForKernelRestart": false,
  "git.enableSmartCommit": true
}
```

### Git Configuration
```bash
# Set up global git config
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main

# Useful aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
```

## 🐳 Docker Setup

### Python ML Development Container
```dockerfile
FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /workspace
CMD ["bash"]
```

## 🚀 Quick Setup Scripts

### Linux/macOS Setup
```bash
#!/bin/bash
# setup.sh

# Update system
sudo apt update && sudo apt upgrade -y  # Ubuntu/Debian
# brew update && brew upgrade           # macOS

# Install Python and Git
sudo apt install python3 python3-pip git  # Ubuntu/Debian
# brew install python git                   # macOS

# Install essential Python packages
pip3 install --user pipx
pipx install poetry
pipx install jupyter

# Create project directory
mkdir -p ~/ai-ml-projects
cd ~/ai-ml-projects

echo "✅ Setup complete! Ready to start learning."
```

### Windows Setup (PowerShell)
```powershell
# setup.ps1

# Install Chocolatey (package manager)
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install essential tools
choco install python git vscode -y

# Install Python packages
pip install jupyter numpy pandas matplotlib seaborn scikit-learn

# Create project directory
New-Item -ItemType Directory -Path "$env:USERPROFILE\ai-ml-projects"
Set-Location "$env:USERPROFILE\ai-ml-projects"

Write-Host "✅ Setup complete! Ready to start learning." -ForegroundColor Green
```

## 🔧 Troubleshooting Common Issues

### Python Environment Issues
```bash
# Fix: "pip: command not found"
python -m ensurepip --upgrade

# Fix: Permission denied errors
pip install --user package_name

# Fix: Package conflicts
pip install --upgrade pip
pip install package_name --force-reinstall
```

### Jupyter Issues
```bash
# Fix: Kernel not found
python -m ipykernel install --user --name=myenv

# Fix: Extensions not loading
jupyter lab build

# Fix: Can't connect to kernel
jupyter lab --generate-config
# Then edit ~/.jupyter/jupyter_lab_config.py
```

### GPU/CUDA Issues
```bash
# Check CUDA installation
nvidia-smi
nvcc --version

# Install PyTorch with CUDA
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Verify GPU access in Python
python -c "import torch; print(torch.cuda.is_available())"
```

## 📱 Mobile Development (Optional)

### For iOS Development
- **Xcode** - Required for iOS deployment
- **Swift for TensorFlow** - ML on iOS
- **Core ML** - Apple's ML framework

### For Android Development
- **Android Studio** - Android development IDE
- **TensorFlow Lite** - ML on Android
- **ML Kit** - Google's mobile ML SDK

## 🌐 Browser-Based Tools

### Online IDEs
- **GitHub Codespaces** - Cloud development environment
- **GitPod** - Browser-based IDE
- **Replit** - Collaborative coding platform

### Data Science Platforms
- **Kaggle** - Datasets and competitions
- **Google Colab** - Free Jupyter notebooks with GPU
- **Paperspace** - Cloud GPU instances

## 📊 Monitoring & Logging Tools

### Development
- **TensorBoard** - Visualization for TensorFlow
- **Weights & Biases** - Experiment tracking
- **MLflow** - ML lifecycle management

### Production
- **Prometheus** - Monitoring and alerting
- **Grafana** - Metrics visualization
- **ELK Stack** - Logging and analytics

---

## 🚀 Quick Start Checklist

- [ ] Install Python 3.8+
- [ ] Set up Git and GitHub account
- [ ] Install VS Code with Python extensions
- [ ] Create virtual environment
- [ ] Install core packages (numpy, pandas, sklearn)
- [ ] Test Jupyter notebook functionality
- [ ] Clone this repository
- [ ] Run environment verification script

**Need help?** Check the troubleshooting section or ask in [community discussions](../../discussions)!
