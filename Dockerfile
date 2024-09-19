FROM python:3.9-slim

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN apt-get -y update &&  \
    mkdir -p /usr/src && \
    python3 -m venv $VIRTUAL_ENV && \
    pip install --no-cache-dir --upgrade pip==24.2 && \
    rm -rf /var/lib/apt/lists/*

COPY wsgi.py requirements.txt /usr/src/

WORKDIR /usr/src

COPY backend ./backend

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:app"]