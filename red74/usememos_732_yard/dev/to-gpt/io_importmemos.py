#
# 
#
# import memos to web backend using api.
# usage:
#     python3 io_importmemos.py


import os
import json
import requests

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

def import_memo(m):
    
    # new timestamps...
    body = {
        "content": m.get("content", ""),
        "visibility": m.get("visibility", "PRIVATE"),
        "tags": m.get("tags", []),
    }

    # retain exported timestamps.
    body = {
        "content": m.get("content", ""),
        "visibility": m.get("visibility", "PRIVATE"),
        "tags": m.get("tags", []),
        "createTime": m.get("createTime"),
        "updateTime": m.get("updateTime"),
        "displayTime": m.get("displayTime"),
    }

    r = requests.post(f"{BASE_URL}/api/v1/memos", headers=headers, json=body)
    r.raise_for_status()
    return r.json()

if __name__ == "__main__":
    #
    # file with exported memos...
    #
    with open("memos_export2.json", "r", encoding="utf-8") as f:
        memos = json.load(f)

    print(f"Importing {len(memos)} memos...")

    for m in memos:
        result = import_memo(m)
        print("Imported:", result.get("name"))

    print("Done.")
