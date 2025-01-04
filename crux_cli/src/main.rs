use anyhow::Result;
use args::{Commands, DoctorArgs};
use clap::Parser;

use args::Cli;

mod args;
mod codegen;
mod config;
mod diff;
mod doctor;
mod template;
mod workspace;

#[tokio::main]
async fn main() -> Result<()> {
    env_logger::init();

    let cli = Cli::parse();
    match &cli.command {
        Some(Commands::Doctor(DoctorArgs {
            fix: _,
            include_source_code,
            template_dir,
            path,
        })) => doctor::doctor(
            template_dir,
            path.as_deref(),
            cli.verbose,
            *include_source_code,
        ),
        Some(Commands::Codegen(args)) => codegen::codegen(args),
        None => Ok(()),
    }
}
