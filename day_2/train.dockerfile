# Base image
FROM python:3.12-slim

RUN apt update && \
    apt install --no-install-recommends -y build-essential gcc && \
    apt clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
COPY pyproject.toml pyproject.toml
COPY src/ src/
COPY data/ data/

WORKDIR /
RUN pip install -r requirements.txt --no-cache-dir
RUN pip install . --no-deps --no-cache-dir

```docker
ENTRYPOINT ["python", "-u", "src/day_2_project/train.py"]
```
The `"u"` here makes sure that any output from our script, e.g., any `print(...)` statements, gets
redirected to our terminal. If not included, you would need to use `docker logs` to inspect your run.
