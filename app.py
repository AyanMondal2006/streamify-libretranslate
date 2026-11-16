"""
LibreTranslate Service Entrypoint
Compatible with local execution and cloud platforms (Hugging Face Spaces, Render, Docker, etc.)
"""
import os
import sys

def run():
    host = os.getenv("HOST", "0.0.0.0")
    # Hugging Face Spaces provides port 7860; default to 5000 otherwise
    default_port = "7860" if os.getenv("SPACE_ID") else "5000"
    port = os.getenv("PORT", default_port)
    load_only = os.getenv("LT_LOAD_ONLY", "en,hi")

    # Pass configuration arguments directly to LibreTranslate runtime
    sys.argv = [
        "libretranslate",
        "--host", str(host),
        "--port", str(port)
    ]

    if load_only:
        sys.argv.extend(["--load-only", load_only])

    print(f"Starting LibreTranslate on http://{host}:{port} with models: {load_only}")
    
    from libretranslate.main import main
    main()

if __name__ == "__main__":
    run()
