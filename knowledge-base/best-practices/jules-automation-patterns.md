# Jules API & Automation Reference

## Key API Endpoints
- **Base URL:** `https://jules.googleapis.com/v1alpha`
- **Authentication:** Header `X-Goog-Api-Key: <YOUR_API_KEY>`
- **Create Session:** `POST /sessions`
    - Payload:
      ```json
      {
        "prompt": "Fix bug in auth",
        "sourceContext": { "repository": "..." },
        "automationMode": "AUTO_CREATE_PR",
        "requirePlanApproval": false
      }
      ```
    - **Tip:** `automationMode: "AUTO_CREATE_PR"` enables fully autonomous CI/CD integration.

## Automation Patterns
- **No-Approval Mode:** Set `requirePlanApproval: false` for trusted tasks.
- **CI/CD Hook:** Call `/sessions` endpoint from GitHub Actions or GitLab CI to trigger Jules on specific events (e.g., failed tests).
- **Batch Processing:** Use scripts to iterate over a TODO list and spawn multiple sessions (be mindful of rate limits).

## Integration
- Use `commands/start-tasks.ps1` (or updated autonomous version) to bridge local TODOs with Jules.