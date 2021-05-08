FROM python:3.9-buster


WORKDIR /opt/blask

RUN ["pip", "install", "virtualenv"]

RUN ["python", "-m", "virtualenv", "venv"]

RUN ["pip", "install", "blask"]

RUN ["pip", "install", "gunicorn"]

ENV BLASK_SETTINGS settings

EXPOSE 8000

VOLUME /opt/blask

COPY . /opt/blask


CMD ["gunicorn", "-b", "0.0.0.0:8000","--workers", "4", "main"]