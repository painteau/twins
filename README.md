# 🌐 Twins - Gemini Server

## ⭐ Features
- 🔐 **Automatic SSL Certificates**: Generates self-signed SSL certificates for secure Gemini communication.
- 📁 **Multi-Domain Support**: Hosts multiple domains with independent configurations.
- 📝 **Dynamic Configuration**: Auto-generates `twins_config.yaml` with domain-specific settings.
- 🎨 **Per-Domain Stylesheets**: Detects and applies custom stylesheets for each domain.
- 🚀 **Lightweight and Fast**: Built with Go for optimal performance.

## 📌 Prerequisites
- Docker installed on your system.
- OpenSSL for local certificate generation.
- Ports **1965** open for Gemini protocol.

## 🐳 Running with Docker (GHCR)
Twins is available on GitHub Container Registry (GHCR):

1️⃣ **Pull the Docker Image**
```bash
docker pull ghcr.io/painteau/twins
```

2️⃣ **Run the Container**
```bash
docker run -d \
  -p 1965:1965 \
  -e DOMAINS="yourdomain.com,anotherdomain.com" \
  -e LANGS="en,fr" \
  -e CACHE=86400 \
  -e LIST=false \
  -v /path/to/your/certs:/home/twins/certs \
  -v /path/to/your/sites:/home/twins/sites \
  --name twins \
  --restart unless-stopped \
  ghcr.io/painteau/twins:latest
```

## ⚙ Configuration

### Domains & Language Configuration
The `DOMAINS` and `LANGS` environment variables must be provided and must have the same number of entries. Each domain in `DOMAINS` should have a corresponding language in `LANGS`, ensuring proper configuration mapping.

### HTTPS serving
Pages are also available via HTTPS on the same port by default.

### Per-Domain Stylesheets
If a `style.css` file is present in the `/home/twins/sites/yourdomain.com/` directory, it will be automatically applied to that specific domain. This allows for customized appearance per domain without manual configuration.
| Option      | Description | Default |
|------------|-------------|---------|
| `DOMAINS`  | Comma-separated list of domains | `""` |
| `LANGS`    | Corresponding languages per domain | `en` |
| `CACHE`    | Cache duration in seconds | `86400` |
| `LIST`     | Enable directory listing | `false` |
| `CERTS_DIR`| Path to SSL certificates | `/home/twins/certs` |
| `SITES_DIR`| Path to hosted sites | `/home/twins/sites` |

## 🔧 Troubleshooting
- **SSL Issues?** Ensure OpenSSL is installed and certificates are correctly generated.
- **Configuration Errors?** Verify `twins_config.yaml` is correctly formatted.
- **Ports Blocked?** Check firewall settings to allow traffic on **port 1965**.

## 🌜 License
This project is licensed under the MIT License.

## ⚠ Security Notice
Ensure that you expose the docker securely and restrict access if necessary when deploying in a production environment.

## 💡 Contributing
1️⃣ **Fork the repository**: [GitHub - Painteau/Twins](https://github.com/painteau/twins)
2️⃣ **Create a new branch**: `git checkout -b feature-branch`
3️⃣ **Commit your changes**: `git commit -m "Your changes"`
4️⃣ **Push to your branch**: `git push origin feature-branch`
5️⃣ **Create a pull request**

For major changes, please open an issue first to discuss the proposed modifications.

