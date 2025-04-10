# MCP Obsidian Docker

This is a containerized version of [MCP Obsidian](https://github.com/MarkusPfundstein/mcp-obsidian), a server that interacts with Obsidian via the Local REST API community plugin.

## Prerequisites

1. Docker and Docker Compose installed
2. Obsidian with the [Local REST API plugin](https://github.com/coddingtonbear/obsidian-local-rest-api) installed and configured
3. API key from the Local REST API plugin

## API Key Configuration

### Getting Your API Key

1. Open Obsidian
2. Go to Settings (gear icon in the bottom left)
3. Select "Community Plugins" in the left sidebar
4. Find "Local REST API" in your list of installed plugins
5. Click the settings gear icon (⚙️) next to the plugin
6. Look for the "API Key" field - this is your authentication key

### Setting Up the API Key

1. Create your environment file by copying the example:
   ```bash
   cp .env.example .env
   ```

2. Edit the `.env` file:
   ```bash
   # Open with your preferred editor
   nano .env
   # or
   vim .env
   # or any text editor
   ```

3. Replace the placeholder with your actual API key:
   ```bash
   # Before:
   OBSIDIAN_API_KEY=your_api_key_here

   # After (example - use your actual key):
   OBSIDIAN_API_KEY=1234abcd5678efgh
   ```

### Security Notes

- The `.env` file is listed in `.gitignore` to prevent accidental commits
- Never share your API key or commit it to version control
- If you need to change your API key:
  1. Generate a new key in Obsidian
  2. Update your `.env` file
  3. Restart the container: `docker-compose restart`

## Setup

1. Clone this repository
2. Configure API key as described above
3. Build and start the container:
   ```bash
   docker-compose up -d
   ```

## Usage

The MCP Obsidian server will be available at port 27124. Make sure this port matches the one configured in your Obsidian Local REST API plugin.

### Verifying the Setup

1. Check if the container is running:
   ```bash
   docker-compose ps
   ```

2. Check the logs for any issues:
   ```bash
   docker-compose logs -f
   ```

3. If you see authentication errors, verify your API key is correctly set in the `.env` file

### Common Issues

1. **Authentication Failed**: Double-check your API key in both Obsidian plugin settings and `.env` file
2. **Connection Refused**: Ensure Obsidian is running and the Local REST API plugin is enabled
3. **Port Conflict**: If port 27124 is already in use, you can modify the port mapping in `docker-compose.yml`

## Logs

Logs are stored in the `./logs` directory, which is mounted as a volume in the container.

## Environment Variables

- `OBSIDIAN_API_KEY`: Your Obsidian Local REST API plugin API key (required)

## License

This project is licensed under the MIT License - see the original [MCP Obsidian repository](https://github.com/MarkusPfundstein/mcp-obsidian) for details. 