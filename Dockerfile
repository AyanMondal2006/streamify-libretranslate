FROM libretranslate/libretranslate:latest

# Environment defaults
ENV LT_HOST=0.0.0.0
ENV LT_PORT=5000
ENV LT_LOAD_ONLY=en,hi

EXPOSE 5000
EXPOSE 10000

# Reset base entrypoint so "sh -c" is executed directly by the shell,
# preventing the base image's internal print_args_env.py from throwing unrecognized argument errors
ENTRYPOINT []

# Automatically bind to Render's $PORT (usually 10000) or default to 5000
CMD ["/bin/sh", "-c", "libretranslate --host 0.0.0.0 --port ${PORT:-5000} --load-only ${LT_LOAD_ONLY:-en,hi}"]
