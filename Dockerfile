FROM ghcr.io/osgeo/gdal:ubuntu-small-3.12.0
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apt-get update
RUN apt-get install -y libspatialindex-dev unar bc python3-pip wget

RUN mkdir /code
ADD . /code/

WORKDIR /code
RUN uv sync --locked
CMD uv run server.py

EXPOSE 8080
EXPOSE 8443
