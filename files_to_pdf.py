# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "pillow",
# ]
# ///

from PIL import Image

def pngs_to_pdf(output_pdf_path, png_paths):
    # Load all images
    images = [Image.open(png).convert("RGB") for png in png_paths]

    # Save all images into a single PDF
    if images:
        images[0].save(output_pdf_path, save_all=True, append_images=images[1:])

# Example usage
if __name__ == "__main__":
    import sys

    pngs_to_pdf(sys.argv[1], sys.argv[2:])
