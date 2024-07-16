use zed::LanguageServerId;
use zed_extension_api::{self as zed, Result};

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
        let Some(r_path) = worktree.which("R") else {
            return Err("R not available".to_string());
        };

        let install_packages = r#"
            if (!requireNamespace("languageserver", quietly = TRUE)) {
                install.packages("languageserver", repos = "https://cloud.r-project.org/")
            }
            if (!requireNamespace("lintr", quietly = TRUE)) {
                install.packages("lintr", repos = "https://cloud.r-project.org/")
            }
        "#;

        Ok(zed::Command {
            command: r_path.to_string(),
            args: vec![
                "--slave".to_string(),
                "-e".to_string(),
                format!("{install_packages}\nlanguageserver::run()"),
            ],
            env: Default::default(),
        })
    }
}

zed::register_extension!(RExtension);
