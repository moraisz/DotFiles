#!/bin/bash

if rfkill list bluetooth 2>/dev/null | grep -qi "no"; then
    # Bluetooth existe e está ativo
    echo '{"text":"","tooltip":"Bluetooth"}'
else
    # Não mostra nada
    echo '{"text":""}'
fi

