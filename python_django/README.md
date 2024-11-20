# Python/Django Task

## Features:

- User can upload a file
- User can list all uploaded files
- User can retrieve specific file by id
- User can filter files by 
- Validation against malicious files (a file with an extension that is different from the actual file content)
- File size validation (max 10 MB)
- api swagger docs
- docker support

## Design note:

File category was added as a separate database field and gets populated on save (by guessing the type) in order to avoid making more expensive queries (direct field search vs __endswith)

## How to run

simply `docker-compose up --build`

## Run tests

- if docker container is up: `docker exec -it file_uploader_app bash -c "python manage.py test"`
- from local venv directly: `python manage.py test` but make sure to `pip install -r requirements.txt` first
