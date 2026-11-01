# The Little Elpier: lean-elpi and Python in one image.
#   docker build -t little-elpier .
#   docker run --rm -it -v "$PWD":/book little-elpier
FROM python:3.12-slim
RUN pip install --no-cache-dir "leanelpi>=0.4.1"
WORKDIR /book
COPY elpier.py /usr/local/lib/elpier.py
RUN printf '#!/bin/sh\nexec python3 /usr/local/lib/elpier.py "$@"\n' > /usr/local/bin/elpier \
 && ln -s /usr/local/bin/elpier /usr/local/bin/lean-elpi \
 && chmod +x /usr/local/bin/elpier
CMD ["bash"]
