# Streamify Translation Service

A self-hosted, lightweight Machine Translation microservice powered by **LibreTranslate** and **CTranslate2**, delivering fast neural translation between English and Hindi (`en` ↔ `hi`).

---

## Folder Structure

```
streamify-translation/
├── .venv/                      # Python 3.14 virtual environment & installed packages
├── scripts/                    # Convenience launch and management scripts
│   ├── start.bat               # Double-click batch script for Windows cmd
│   ├── start.ps1               # PowerShell foreground startup script
│   ├── start_background.ps1    # Silent background process starter (no open window)
│   └── stop_background.ps1     # Stops background process
├── .env.example                # Template for configuration environment variables
├── .gitignore                  # Git exclusions (.venv, caches, temporary files)
├── app.py                      # Python entrypoint (Hugging Face / custom cloud hosts)
├── Dockerfile                  # Container build recipe
├── docker-compose.yml          # Multi-container orchestration definition
├── requirements.txt            # Python dependencies
└── README.md                   # Project documentation
```

---

## Quick Start (Local)

### 1. Run in Foreground
```powershell
.\scripts\start.ps1
```
Or double-click `scripts\start.bat`.

### 2. Run Silently in Background
```powershell
.\scripts\start_background.ps1
```
To stop the background process:
```powershell
.\scripts\stop_background.ps1
```

---

## API Endpoints

- **Translation:** `POST /translate`
  ```bash
  curl -X POST "http://127.0.0.1:5000/translate" \
       -H "Content-Type: application/json" \
       -d '{"q": "Hello world", "source": "en", "target": "hi"}'
  ```
- **Languages:** `GET /languages`
- **Interactive Swagger Docs:** [http://127.0.0.1:5000/docs](http://127.0.0.1:5000/docs)
