# 🚀 Getting Started Guide

Welcome to your AI/ML learning journey! This guide will help you set up your environment and understand the prerequisites for each module.

## 📋 Prerequisites

### Essential Skills (Required)
- **Programming**: Basic Python knowledge (variables, functions, loops, classes)
- **Mathematics**: High school algebra and basic statistics
- **Computer Literacy**: File management, command line basics
- **English**: Ability to read technical documentation

### Helpful (But Not Required)
- **Linear Algebra**: Vectors, matrices, basic operations
- **Calculus**: Derivatives and gradients (useful for advanced modules)
- **Statistics**: Probability distributions, hypothesis testing
- **Prior ML Exposure**: Any previous machine learning coursework

## 💻 Environment Setup

### Step 1: Install Python

**Option A: Anaconda (Recommended for Beginners)**
```bash
# Download from https://www.anaconda.com/download
# Includes Python, Jupyter, and common data science packages
```

**Option B: Python.org**
```bash
# Download Python 3.8+ from https://www.python.org/downloads/
# Install pip package manager
```

### Step 2: Essential Tools

**Git (Version Control)**
```bash
# Ubuntu/Debian
sudo apt update && sudo apt install git

# macOS (with Homebrew)
brew install git

# Windows: Download from https://git-scm.com/
```

**Code Editor**
- **VS Code** (Recommended): Download from https://code.visualstudio.com/
- **PyCharm Community**: Free IDE for Python
- **Jupyter Notebook**: Comes with Anaconda or install via `pip install jupyter`

### Step 3: Create Learning Environment

```bash
# Clone this repository
git clone <your-repo-url>
cd AI_Github

# Create virtual environment
python -m venv ai_learning_env

# Activate environment
# Linux/macOS:
source ai_learning_env/bin/activate
# Windows:
ai_learning_env\Scripts\activate

# Install base requirements
pip install numpy pandas matplotlib seaborn jupyter notebook
```

## 🎯 Module-Specific Requirements

### Modules 1-2: AI & ML Foundations
```bash
pip install scikit-learn plotly ipywidgets
```

### Module 3: Large Language Models
```bash
pip install torch transformers datasets accelerate
# For GPU support (CUDA):
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
```

### Module 4: RAG Techniques
```bash
pip install langchain chromadb sentence-transformers faiss-cpu
```

### Module 5: Neural Networks from Scratch
```bash
pip install torch matplotlib numpy jupyter
```

### Module 6: Production ML
```bash
pip install mlflow dvc fastapi uvicorn docker
```

### Modules 7-8: AI Agents
```bash
pip install autogen crewai openai anthropic redis
```

## 🧪 Verify Your Setup

Run this Python script to check your environment:

```python
# save as check_setup.py
import sys
print(f"Python version: {sys.version}")

try:
    import numpy as np
    print(f"✅ NumPy {np.__version__}")
except ImportError:
    print("❌ NumPy not installed")

try:
    import pandas as pd
    print(f"✅ Pandas {pd.__version__}")
except ImportError:
    print("❌ Pandas not installed")

try:
    import sklearn
    print(f"✅ Scikit-learn {sklearn.__version__}")
except ImportError:
    print("❌ Scikit-learn not installed")

try:
    import torch
    print(f"✅ PyTorch {torch.__version__}")
    if torch.cuda.is_available():
        print(f"✅ CUDA available: {torch.cuda.get_device_name(0)}")
    else:
        print("⚠️  CUDA not available (CPU only)")
except ImportError:
    print("❌ PyTorch not installed")

print("\n🚀 Setup verification complete!")
```

## 🗂️ Recommended Learning Structure

### Week 1: Environment & Foundations
1. Complete this setup guide
2. Review Python basics if needed
3. Start Module 1: AI For Beginners
4. Set up your learning notebook/journal

### Week 2-3: AI Foundations
1. Complete Module 1 concepts
2. Practice with provided exercises
3. Join community discussions
4. Start planning your first project

### Ongoing: Best Practices
- **Consistent Schedule**: Dedicate 1-2 hours daily
- **Hands-on Practice**: Code along with every example
- **Take Notes**: Document key concepts and insights
- **Ask Questions**: Use GitHub discussions or community forums
- **Build Projects**: Apply what you learn to real problems

## 📚 Learning Resources

### Free Online Courses (Supplements)
- **Khan Academy**: Linear Algebra, Statistics
- **3Blue1Brown**: Neural Networks, Linear Algebra
- **Coursera**: Andrew Ng's ML Course (audit for free)
- **Fast.ai**: Practical Deep Learning

### Books (Optional)
- **"Hands-On Machine Learning"** by Aurélien Géron
- **"Pattern Recognition and Machine Learning"** by Christopher Bishop
- **"Deep Learning"** by Ian Goodfellow (advanced)

### Practice Platforms
- **Kaggle**: Competitions and datasets
- **Google Colab**: Free GPU/TPU access
- **Papers With Code**: Latest research implementations

## 🚨 Common Setup Issues

### Issue: Import Errors
**Solution**: Ensure you're in the correct virtual environment
```bash
which python  # Should point to your virtual environment
pip list      # Check installed packages
```

### Issue: CUDA/GPU Not Working
**Solution**: Verify GPU drivers and PyTorch installation
```python
import torch
print(torch.cuda.is_available())  # Should return True
```

### Issue: Jupyter Kernel Problems
**Solution**: Install kernel in virtual environment
```bash
pip install ipykernel
python -m ipykernel install --user --name=ai_learning_env
```

### Issue: Permission Errors (Linux/macOS)
**Solution**: Don't use sudo with pip, use virtual environments
```bash
# Wrong: sudo pip install package
# Right: pip install package (in virtual environment)
```

## 🎯 Setting Learning Goals

### Short-term Goals (1-2 months)
- [ ] Complete Modules 1-2
- [ ] Build first ML project
- [ ] Understand fundamental concepts
- [ ] Set up development workflow

### Medium-term Goals (3-6 months)
- [ ] Complete Modules 3-5
- [ ] Deploy a model to production
- [ ] Contribute to open-source project
- [ ] Build portfolio of projects

### Long-term Goals (6-12 months)
- [ ] Complete all 8 modules
- [ ] Build and deploy AI agent system
- [ ] Apply for AI/ML roles
- [ ] Mentor other learners

## 🤝 Getting Help

### When You're Stuck
1. **Check Documentation**: Each module has detailed guides
2. **Search Issues**: Someone might have faced the same problem
3. **Ask in Discussions**: Describe what you tried and what happened
4. **Stack Overflow**: For technical programming questions
5. **Discord/Slack**: Join AI/ML learning communities

### How to Ask Good Questions
- **Be Specific**: Include error messages and code snippets
- **Show Your Work**: What have you tried already?
- **Provide Context**: Which module, which exercise?
- **Include Environment**: OS, Python version, package versions

## ✅ Ready to Start?

Once you've completed this setup:

1. **Verify** your environment works with the check script
2. **Read** the [Detailed Roadmap](./ROADMAP.md) to understand the journey
3. **Start** with [Module 1: AI For Beginners](./1.AI-For-Beginners/)
4. **Join** the community and introduce yourself!

---

**Next Steps**: Head to [Module 1: AI For Beginners](./1.AI-For-Beginners/) to begin your learning journey!

**Need Help?** Check out our [community discussions](../../discussions) or create an issue if you encounter problems.

🌟 **Welcome to the future of AI! Let's build something amazing together.**
