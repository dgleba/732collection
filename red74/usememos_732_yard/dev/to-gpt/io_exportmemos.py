
# export memos from web backend using api.
# usage:
#    source ~/venv/bin/activate; python3 io_exportmemos.py

import os
import json
import requests

#from dotenv import load_dotenv
# load_dotenv()  # loads .env from current directory
# BASE_URL = os.getenv("MEMOS_BASE_URL")
# TOKEN = os.getenv("MEMOS_TOKENPASS")


def load_env(path=".env"):
    env = {}
    with open(path, "r") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            key, value = line.split("=", 1)
            env[key.strip()] = value.strip()
    return env

env = load_env()

BASE_URL = env["MEMOS_BASE_URL"]
TOKEN = env["MEMOS_TOKENPASS"]


headers = {
    "Authorization": f"Bearer {TOKEN}",
    "Content-Type": "application/json",
}

def fetch_all_memos(page_size=100):
    memos = []
    next_page_token = ""

    while True:
        params = {"pageSize": page_size}
        if next_page_token:
            params["pageToken"] = next_page_token

        r = requests.get(f"{BASE_URL}/api/v1/memos", headers=headers, params=params)
        r.raise_for_status()

        data = r.json()
        memos.extend(data.get("memos", []))
        next_page_token = data.get("nextPageToken", "")

        if not next_page_token:
            break

    return memos


if __name__ == "__main__":
    all_memos = fetch_all_memos()

    #
    # file with exported memos...
    #
    with open("memos_export.json", "w", encoding="utf-8") as f:
        json.dump(all_memos, f, ensure_ascii=False, indent=2)

    print(f"Exported {len(all_memos)} memos to memos_export.json")
