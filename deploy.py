"""This script is used to deploy the documentation to GitHub Pages using the ghp-import package."""

import os
import sys
import shutil
import datetime
import argparse
from ghp_import import ghp_import


class MyProgramArgs(argparse.Namespace):
    """args"""

    local: bool = False
    """Run the deployment locally without pushing to GitHub Pages."""


with open("CNAME", "r", encoding="utf-8") as f:
    CNAME = f.read().strip()

CURRENT_DATE = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
print(f"| Deploying documentation to GitHub Pages at {CURRENT_DATE}...")
print(f"| Custom domain: {CNAME}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Deploy the documentation to GitHub Pages using ghp-import.",
    )

    parser.add_argument(
        "-l",
        "--local",
        action="store_true",
        default=False,
        help="Run the deployment locally without pushing to GitHub Pages.",
    )
    nsp = MyProgramArgs()
    args = parser.parse_args(namespace=nsp)

    print("| Creating temporary deployment directory...")
    if os.path.exists("./deploy"):
        print("| Clearing existed temporary deployment directory...")
        shutil.rmtree("./deploy", ignore_errors=True)

    if not os.path.exists("./build/html"):
        print(
            "| Error: The build directory does not exist. Please run the build command first."
        )
        sys.exit(1)
    if not os.path.exists("./build/html/stable"):
        print(
            "| Error: The stable directory does not exist in the build directory. "
            "Please run the build command first."
        )
        sys.exit(1)

    print("| Copying files from build/html to deploy directory...")

    shutil.copytree("./build/html", "./deploy")

    print("| Moving stable files from deploy/stable to deploy directory...")

    STABLE_SOURCE_DIR = "./deploy/stable"
    STABLE_DEPLOY_DIR = "./deploy"

    stable_files = os.listdir(STABLE_SOURCE_DIR)

    for fname in stable_files:
        shutil.move(os.path.join(STABLE_SOURCE_DIR, fname), STABLE_DEPLOY_DIR)

    print(f"| Moving stable from {STABLE_SOURCE_DIR} to {STABLE_DEPLOY_DIR}...")

    if not args.local:
        ghp_import(
            "./deploy",
            nojekyll=True,
            force=True,
            push=True,
            cname=CNAME,
            mesg=f"ci: deploy to GitHub Pages - {CURRENT_DATE}",
            branch="gh-pages",
        )

    print("| Deployment complete.")
