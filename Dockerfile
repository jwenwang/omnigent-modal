FROM ghcr.io/omnigent-ai/omnigent-server:latest

USER root
RUN set -eux; \
    python -m pip install --no-cache-dir modal \
    || (python -m ensurepip --upgrade && python -m pip install --no-cache-dir modal) \
    || (pip install --no-cache-dir uv && uv pip install --python "$(command -v python)" modal); \
    python -c "import modal, omnigent; print('modal OK', modal.__version__)"
