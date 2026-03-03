use zed::LanguageServerId;
use zed_extension_api::{self as zed, Result};

struct RExtension;

impl zed::Extension for RExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let Some(air_path) = worktree.which("air") else {
            return Err("air unavailable - falling back to styler".to_string());
        };
        let Some(r_path) = worktree.which("R") else {
            return Err("R not available".to_string());
        };
        match language_server_id.as_ref() {
            "air" => Ok(zed::Command {
                command: air_path.to_string(),
                args: vec!["language-server".into()],
                env: Default::default(),
            }),
            "r_language_server" => Ok(zed::Command {
                command: r_path.to_string(),
                args: vec![
                    "--slave".to_string(),
                    "-e".to_string(),
                    "languageserver::run()".to_string(),
                ],
                env: Default::default(),
            }),
            id => Err(format!("Unknown language server: {id}")),
        }
    }
}

zed::register_extension!(RExtension);
