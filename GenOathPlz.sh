#!/bin/bash
GenOathPlz() {
    [ -z "$OATH_TOOL_TOTP_KEY" ] && \
        >&2 echo $'Fatal error:\n$OATH_TOOL_TOTP_KEY not set. Add to '"$HOME/.bashrc" && \
        return 1
    oathtool -b --totp $OATH_TOOL_TOTP_KEY
}
