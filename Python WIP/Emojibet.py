import tkinter as tk

def translate_text():
    user_input = entry.get()
    translated_text = ' '.join(f":regional_indicator_{char.lower()}:" if char.isalnum() else char for char in user_input)
    
    # Update the output text field
    output_entry.config(state=tk.NORMAL)  # Enable editing temporarily
    output_entry.delete(0, tk.END)
    output_entry.insert(0, translated_text)
    output_entry.config(state=tk.NORMAL)  # Keep it editable for easy selection

# Create the UI window
root = tk.Tk()
root.title("Character Translator")

tk.Label(root, text="Enter text:").pack(pady=5)

entry = tk.Entry(root)
entry.pack(pady=5)

translate_button = tk.Button(root, text="Translate", command=translate_text)
translate_button.pack(pady=5)

tk.Label(root, text="Translated text:").pack(pady=5)

output_entry = tk.Entry(root)  # Now fully selectable
output_entry.pack(pady=5)

root.mainloop()