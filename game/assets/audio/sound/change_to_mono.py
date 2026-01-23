import os
import soundfile as sf
import numpy as np

# Folder where this script is located
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

def convert_to_mono(path):
    data, samplerate = sf.read(path)

    # Already mono
    if data.ndim == 1:
        print(f"✓ Already mono: {path}")
        return

    # Mix all channels to mono
    mono = np.mean(data, axis=1)

    # Overwrite original file
    sf.write(path, mono, samplerate)
    print(f"→ Converted to mono: {path}")

for root, _, files in os.walk(BASE_DIR):
    for filename in files:
        if filename.lower().endswith(".wav"):
            filepath = os.path.join(root, filename)
            convert_to_mono(filepath)

print("\n✅ All WAV files converted to mono (overwritten)")
