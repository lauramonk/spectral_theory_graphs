# Spectral theory for graphs

This is a small project aiming to prove a variety of classical results for the spectral theory of
graphs. The contents are not (at this stage) intended for Mathlib - but they might become in the
future.

The website of the project can be found [here](https://lauramonk.github.io/spectral_theory_graphs/).

We used [The Lean Project Template](https://github.com/leanprover-community/LeanProject) to create
this project.

## Repository Layout

The repository is organized as follows (listing the main folders and files):

- [`.github`](.github) contains GitHub-specific configuration files and workflows.
    - [`workflows`](.github/workflows) contains GitHub Actions workflow files.
        - [`build-project.yml`](.github/workflows/build-project.yml) defines the workflow for building
        the Lean project on pushes, pull requests, and manual triggers. This is a minimalistic build
        workflow which is not necessary if you decide to generate a blueprint (see instructions below)
        and can be manually disabled by clicking on the **Actions** tab, selecting **Build Project**
        in the left sidebar, then clicking the horizontal triple dots (⋯) on the right,
        and choosing **Disable workflow**.
        - [`deploy-pages.yml`](.github/workflows/deploy-pages.yml) defines the workflow for building
        and deploying the GitHub Pages site, including generation of the upstreaming dashboard.
        - [`create-release.yml`](.github/workflows/create-release.yml): defines the workflow for creating a new Git tag and GitHub release when the `lean-toolchain` file is updated in the `main` branch. Ensure the following settings are configured under **Settings > Actions > General > Workflow permissions**: "Read and write permissions" and "Allow GitHub Actions to create and approve pull requests".
        - [`update.yml`](.github/workflows/update.yml) is the dependency
        update workflow to be triggered manually by default. [It's not documented yet, but it will be soon.]
    - [`dependabot.yml`](.github/dependabot.yml) is the configuration file to automate CI dependency updates.
- [`.vscode`](.vscode) contains Visual Studio Code configuration files
    - [`extensions.json`](.vscode/extensions.json) recommends VS Code extensions for the project.
    - [`settings.json`](.vscode/settings.json) defines the project-specific settings for VS Code.
- [`Project`](Project) should contain the Lean code files.
    - [`Mathlib`](Project/Mathlib) should contain `.lean` files with declarations missing from the
    current version of Mathlib.
    - [`Example.lean`](Project/Example.lean) is a sample Lean file.
- [`scripts`](scripts) contains scripts to update Mathlib ensuring that the latest version is
fetched and integrated into the development environment.
- [`website`](website) contains the Jekyll files for the GitHub Pages homepage that displays the
upstreaming dashboard.
- [`.gitignore`](.gitignore) specifies files and folders to be ignored by Git.
and environment.
- [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) should contain the code of conduct for the project.
- [`CONTRIBUTING.md`](CONTRIBUTING.md) should provide the guidelines for contributing to the
project.
- [`lakefile.toml`](lakefile.toml) is the configuration file for the Lake build system used in
Lean projects.
- [`lean-toolchain`](lean-toolchain) specifies the Lean version and toolchain used for the project.
