import pytesseract
from PIL import Image
from pdf2image import convert_from_path




pdf_path = 'C:/Users/vveda/OneDrive/Documents/pdf_to__doc/report.pdf'
images = convert_from_path(pdf_path)

for i, image in enumerate(images):
    image.save(f'page_{i + 1}.png', 'PNG')

pdf_image = Image.open('C:/Users/vveda/OneDrive/Documents/pdf_to__doc/page_1.png')
extracted_text = pytesseract.image_to_string(pdf_image)





print(extracted_text)
