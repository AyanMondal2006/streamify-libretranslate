FROM libretranslate/libretranslate:latest

# Add LibreTranslate's virtual environment to PATH
ENV PATH="/app/venv/bin:$PATH"

# Environment defaults
ENV LT_HOST=0.0.0.0
ENV LT_PORT=5000
ENV LT_LOAD_ONLY=en,hi

EXPOSE 5000
EXPOSE 10000

# Reset base entrypoint to prevent argument conflicts with cloud providers
ENTRYPOINT []

# Launch using full path to /app/venv/bin/libretranslate, binding dynamically to $PORT (e.g. Render 10000)
CMD ["/bin/sh", "-c", "/app/venv/bin/libretranslate --host 0.0.0.0 --port ${PORT:-5000} --load-only ${LT_LOAD_ONLY:-en,hi}"]
