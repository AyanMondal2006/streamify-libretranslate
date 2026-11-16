FROM libretranslate/libretranslate:latest

# Configure environment defaults
ENV LT_HOST=0.0.0.0
ENV LT_PORT=5000
ENV LT_LOAD_ONLY=en,hi

EXPOSE 5000

# Base image already sets ENTRYPOINT ["libretranslate"]
# CMD passes the default flags to the entrypoint
CMD ["--host", "0.0.0.0", "--port", "5000", "--load-only", "en,hi"]
