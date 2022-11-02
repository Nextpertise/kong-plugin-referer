#!/bin/bash

sudo cp /etc/kong/kong.conf.default /etc/kong/kong.conf

export KONG_DATABASE=off
export KONG_DECLARATIVE_CONFIG=kong.yml
export KONG_PLUGINS=bundled,consumer-referer

luarocks make

kong stop

# kong config -c /etc/kong/kong.conf parse kong.yml
kong start -c /etc/kong/kong.conf

echo ""
echo "----------------------------"
echo ""

# Correct referer
curl http://localhost:8000/fooservice -H 'apikey: qwerty12345676757' -H 'Referer: https://hello.test.com'

echo "\n"
# Wrong referer
curl http://localhost:8000/fooservice -H 'apikey: qwerty12345676757' -H 'Referer: https://hello.test1.com'
echo "\n"
# Wrong apikey
curl http://localhost:8000/fooservice -H 'apikey: qwerty' -H 'Referer: https://hello.test.com'
echo "\n"
