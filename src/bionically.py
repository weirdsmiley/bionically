#!/usr/bin/env python3
from urllib.parse import quote
import config
import markdownify
import requests
import vim

def convert_to_payload(Text):
    return "content=" + quote(Text) + "&response_type=html&request_type=html&fixation=1&saccade=10"

def init():
    Text = '\n'.join(vim.current.buffer[:])
    if len(Text) == 0:
        return

    payload = convert_to_payload(Text)

    response = requests.request("POST", config.url, data=payload,
            headers=config.headers)

    result = markdownify.markdownify(response.text, heading_style="ATX")

    vim.current.buffer[:] = result.lstrip().rstrip().split("\n")
    vim.command("highlight BionicallyGroup cterm=bold")
    # Either start with '^**' or ' **'
    vim.command("match BionicallyGroup /^\*\*\w*\*\*\| \*\*\w*\*\*/")
    vim.command("set conceallevel=3")
    vim.command("set concealcursor=nvc")
    vim.command("syn match BionicallyNonPrinting /[\*]/ conceal")
