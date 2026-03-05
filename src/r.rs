use zed::LanguageServerId;
use zed_extension_api::{self as zed, settings::LspSettings, Result};

struct RExtension;

impl zed::Extension for RExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let r_path = LspSettings::for_worktree("r_langauge_server", worktree)
            .ok()
            .and_then(|s| s.settings)
            .and_then(|s| s.get("r_path").cloned())
            .and_then(|v| v.as_str().map(|s| s.to_string()))
            .unwrap_or("R".to_string());

        let Some(r_exec) = worktree.which(&r_path) else {
            return Err("R not available".to_string());
        };

        Ok(zed::Command {
            command: r_exec.to_string(),
            args: vec![
                "--slave".to_string(),
                "-e".to_string(),
                "languageserver::run()".to_string(),
            ],
            env: Default::default(),
        })
    }
}

zed::register_extension!(RExtension);
