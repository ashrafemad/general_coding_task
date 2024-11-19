import filetype
from filetype.types.archive import Pdf


def get_file_category(file):
    category = "Other"
    if filetype.image_match(file):
        category = "Image"
    elif filetype.video_match(file):
        category = "Video"
    elif filetype.document_match(file) or filetype.match(file, [Pdf()]):
        category = "Document"
    elif filetype.font_match(file):
        category = "Font"
    elif filetype.application_match(file):
        category = "Application"
    elif filetype.audio_match(file):
        category = "Audio"
    elif filetype.archive_match(file):
        category = "Archive"
    return category
