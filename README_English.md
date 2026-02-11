# National Chung Cheng University (CCU) Thesis LaTeX Template

[![License](https://img.shields.io/github/license/anlit75/ccu-thesis-latex-template)](LICENSE)
[![GitHub release](https://img.shields.io/github/v/release/anlit75/ccu-thesis-latex-template)](https://github.com/anlit75/ccu-thesis-latex-template/releases)
[![Build Status](https://github.com/anlit75/ccu-thesis-latex-template/actions/workflows/build.yml/badge.svg)](https://github.com/anlit75/ccu-thesis-latex-template/actions)
<!-- [![Open in Overleaf](https://img.shields.io/badge/Overleaf-Open%20in%20Overleaf-47ba40?style=flat&logo=overleaf)](https://www.overleaf.com/docs?snip_uri=https://github.com/anlit75/ccu-thesis-latex-template/archive/refs/heads/main.zip) -->

An out-of-the-box CCU Thesis LaTeX Template integrated with Docker and GitHub Codespaces, offering a zero-config writing environment with strict formatting compliance and automated PDF backups.

## Table of Contents
- [💻 Online Demo](#-online-demo)
- [⚡ Get The Template](#-get-the-template)
- [🚀 Quick Start](#-quick-start)
- [🐳 Local DevContainer](#-local-devcontainer)
- [☁️ Auto Build & Backup](#️-auto-build--backup)
- [📂 Template Structure](#-template-structure)
- [📖 User Guide](#-user-guide)
- [🎨 Template Demonstration](#-template-demonstration)
- [🤝 Acknowledgement](#-acknowledgement)
- [⚠️ Disclaimer](#️-disclaimer)
- [📄 License](#-license)

## 💻 Online Demo
If you just want to see how the environment looks or test the compilation results, you can quickly launch it by clicking the button below:\
\
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/anlit75/ccu-thesis-latex-template)

> [!CAUTION]\
> *This mode cannot directly save progress, please do not use it for formal writing.*

## ⚡ Get The Template

Click the green **`[Use this template]`** button above and select **Private** to create your thesis repository.

> [!WARNING]\
> It is recommended not to directly Fork this repository!\
> Theses should remain confidential, and Forked repositories are public by default (unless you intend to contribute code).

## 🚀 Quick Start

**Suitable for:** Users who do not want to install any software, have limited computer performance, or simply want a quick preview.

This will launch a full GitHub Codespaces environment in your browser with **no setup required**.

1. Click the green **`Code`** button at the top right of the page > switch to the **`Codespaces`** tab.
2. Click **`Create codespace on branch-name`**.
3. Wait for the browser to load the environment (approx. 10-15 minutes for the first time).
4. **Done!**

> [!TIP]\
> Open the `main.tex` file and press `Ctrl+S` to trigger compilation automatically.\
> Or click the "TeX" icon on the left > `Build LaTeX project`.\
> \
> Once compiled, the PDF file will automatically appear in the file explorer on the right.\
> Press `ctrl+alt+j` within a `*.tex` file to jump to the corresponding location in the PDF.

> [!NOTE]\
> You can now skip `⚙️ Local Installation`. Proceed to the [User Guide](#-user-guide) to start writing your thesis.

> [!WARNING]\
> Free accounts have a monthly GitHub Codespaces usage quota of approximately 120 hours.\
> Please refer to the [Official GitHub Documentation](https://docs.github.com/en/billing/concepts/product-billing/github-codespaces) for actual usage limits and more information.

## 🐳 Local DevContainer

**Suitable for:** Users who require **long-term offline writing** or want to work offline on their own computer and are accustomed to local VS Code.

#### Docker Environment Setup

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop); restart your computer after installation.
2. Install VS Code along with the `Remote Explorer`, `Dev Containers`, and `Docker (optional)` extensions.

#### Launch Steps

1. `git clone` your thesis repository.
2. Open the repository folder with VS Code.
3. Click the **"Reopen in Container"** prompt in the bottom right corner (or press `F1` and search for `Dev Containers: Reopen in Container`).
4. Wait for the container to start; the environment will be configured automatically (approx. 10-15 minutes for the first time).
5. **Done!**

<details>
<summary><strong>If the above steps do not work, manually create the Docker Container (Click to expand)</strong></summary>

Open VS Code in the root directory of the thesis template, and enter the following command in the terminal to create a Docker Container :

```bash
# --name thesis : Specify the container name as thesis (can be changed by yourself)
docker run -itd --name thesis -v .:/home/thesis anlit/thesistex:latest
```

Next, in the `Remote Explorer` extension, you will see the newly created container as shown in the following image.
Right-click on the `thesis` folder and select `Open in Container in Current Window` to enter the container environment.

<div style="text-align: center;">
    <img src="https://github.com/anlit75/CCU-Thesis-LaTeX-Template/blob/assets/figures/RemoteExplorer.png?raw=true" alt="Remote Explorer"> <br>
    Remote Explorer - Dev Container <br><br>
    <img src="https://github.com/anlit75/CCU-Thesis-LaTeX-Template/blob/assets/figures/attach.png?raw=true" alt="Open in Container in Current Window"> <br>
    Open in Container in Current Window <br><br>
</div>

</details>

> [!NOTE]\
> Proceed to the [User Guide](#-user-guide) to start writing your thesis.

## ☁️ Auto Build & Backup
The system automatically compiles your thesis in the cloud whenever you **push** changes to GitHub, providing an **additional PDF backup**.

1. Click the **`Actions`** tab at the top of the repository.
2. Click the latest workflow run (usually displayed as the commit message).
3. Scroll down to the **`Artifacts`** section and click `PDF` to download.

> [!NOTE]\
> **Retention Period**: The cloud-generated PDF files are only retained for **5 days**.

## 📂 Template Structure

```
Template Structure
├── main.tex                            // Main document
├── main.pdf                            // [Automatically generated] Compiled PDF of the main document
├── frontpages
│   ├── abstract.tex                    // Chinese/English Abstract
│   ├── acknowledgement.tex             // Acknowledgement
│   ├── denotation.tex                  // List of Symbols
│   └── verification.pdf                // Thesis Validation Form (PDF)
├── sections
│   ├── introduction.tex                // Introduction
│   ├── related_work.tex                // Related Work
│   ├── method.tex                      // Methodology
│   ├── experiments.tex                 // Results/Experiments
│   └── conclusion.tex                  // Conclusion
├── backpages
│   ├── appendix.tex                    // Appendix
│   └── reference.bib                   // Bibliography database
├── figures
│   ├── watermark.jpg                   // Watermark
│   └── ...
├── ccusetup.tex                        // Template configurations
└── ccuthesis.cls                       // Template class file

```

> [!NOTE]\
> Please write content in the corresponding `.tex` files.\
> To add or remove chapters, create/remove `.tex` files in the `sections` folder and use the `\input{./path/to/texfile}` syntax in `main.tex` to include or exclude them.

## 📖 User Guide

For detailed instructions on using the template, please refer to the [Wiki Page](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki).
Please read in the following order and make configuration adjustments accordingly :

1. [Editing Thesis Configurations](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/Thesis-Configurations-English)
2. [User Guide](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/User-Guide-English)
3. [LaTeX Basic Syntax](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/wiki/LaTeX-Basic-Syntax-English)

## 🎨 Template Demonstration
The sample PDF file for the template can be downloaded from [Releases](https://github.com/anlit75/CCU-Thesis-LaTeX-Template/releases).

## 🤝 Acknowledgement

Huge thanks to the following template authors for their contributions.
Their work has provided valuable references and has contributed to the successful completion of this template :
- [Hsins/NTU-Thesis-LaTeX-Template](https://github.com/Hsins/NTU-Thesis-LaTeX-Template)
- [hasanabs/nsysu-thesis-latex-template](https://github.com/hasanabs/nsysu-thesis-latex-template)
- [joeyuping/ccu-thesis-latextemplate](https://github.com/joeyuping/ccu-thesis-latextemplate)

> [!IMPORTANT]\
> Special thanks to [joeyuping](https://github.com/joeyuping) for his contributions, which have greatly enhanced the completeness of this template!

## ⚠️ Disclaimer

This template is an unofficial version, and the format may contain errors. It is provided for reference only, and users should use it at their own risk.

It is recommended that users make adjustments according to the requirements of their department.
If there are any problem, please feel free to create the issues or send an email to the [author's email](mailto:anson40512@gmail.com).

## 📄 License

[MIT License](LICENSE)

Copyright (c) 2024 Ting-An Cheng
