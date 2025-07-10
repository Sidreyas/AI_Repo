#!/bin/bash
# Script to refresh VS Code's view of all module directories

echo "🔄 Refreshing VS Code view of all learning modules..."

modules=(
    "2.ML-For-Beginners"
    "3.Hands-On-Large-Language-Models" 
    "4.RAG_Techniques"
    "5.nn-zero-to-hero"
    "6.Made-With-ML"
    "7.ai-agents-for-beginners"
    "8.agents-towards-production"
)

for module in "${modules[@]}"; do
    if [ -d "$module" ]; then
        echo "📁 Processing $module..."
        
        # Create a temporary file to refresh VS Code's view
        touch "$module/.vscode_temp_refresh"
        
        # Verify content is accessible by listing first few items
        echo "   ✅ Content verified: $(ls "$module" | head -3 | tr '\n' ', ')"
        
        # Remove temporary file
        rm -f "$module/.vscode_temp_refresh"
    else
        echo "   ❌ Directory $module not found!"
    fi
done

echo "✅ All modules processed. VS Code should now show all content properly."
echo ""
echo "📋 Summary of all modules:"
for module in "${modules[@]}"; do
    if [ -f "$module/README.md" ]; then
        size=$(wc -l < "$module/README.md")
        echo "   $module: README.md ($size lines)"
    fi
done
