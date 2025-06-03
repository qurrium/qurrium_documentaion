"""Get the version number of QURRIUM_VERSION and versioning the documentation."""

import datetime
import subprocess

from qurry import __version__


if __name__ == "__main__":
    CURRENT_DATE_STRING = datetime.datetime.now().strftime("%Y%m%d")
    QURRIUM_VERSION = ".".join(__version__.split(".")[:3])
    TAG_CHECK = QURRIUM_VERSION + "*"

    print(f"| Current Qurrium version: {__version__}")
    print(f"| Current date string: {CURRENT_DATE_STRING}")
    print(f"| Tagging check by: {TAG_CHECK}")
    LABELS = subprocess.check_output(["git", "tag", "-l", TAG_CHECK]).strip()
    LABELS = LABELS.decode("utf-8")
    LABEL_NUM = 0 if LABELS == "" else len(LABELS.split("\n"))

    if LABEL_NUM > 0:
        print(f"| Found {LABEL_NUM} existing tags: {LABELS}")
    else:
        print(f"| CURRENT_DATE_STRING: {CURRENT_DATE_STRING}, label_num: {LABEL_NUM}")
        print(f"| Version: {QURRIUM_VERSION}")
        print(f"| Release candidate: {LABEL_NUM + 1}")
        subprocess.run(
            [
                "git",
                "tag",
                "-a",
                QURRIUM_VERSION,
                "-m",
                f"chore: Qurrium version now to {QURRIUM_VERSION}",
            ],
            check=True,
        )
        subprocess.run(["git", "push", "origin", QURRIUM_VERSION], check=True)

    print("| Versioning complete.")
