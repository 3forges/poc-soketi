#!/bin/bash

# 2041118954
# 5236069846

cat <<EOF >./PAYLOAD_FILE.json
{ 
    "message": {
        "chat": {
            "id": "2041118954",
            "first_name": "jb",
            "text": "BOBO C JB TU VOIS MON MSG LA salut c'est le message que je veux envoyer",
            "reply_to_message": "alors ça c'est le reply to message va savoir..."
        }
    } 
}
EOF
export PAYLOAD=$(cat ./PAYLOAD_FILE.json)


curl -iv \
     -X POST \
     -H "Content-Type: application/json" \
     -H "Accept: application/json" \
     -d "$PAYLOAD" \
     https://intergram-16vq16x31-jean-baptiste-lasselle.vercel.app/hook













cat <<EOF >./PAYLOAD_FILE2.json
{ 
    "message": {
        "chat": {
            "id": "5236069846",
            "first_name": "jb",
            "text": "BOBO C JB TU VOIS MON MSG LA salut c'est le message que je veux envoyer"
        }
    } 
}
EOF

export PAYLOAD2=$(cat ./PAYLOAD_FILE2.json)
curl -iv \
     -X POST \
     -H "Content-Type: application/json" \
     -H "Accept: application/json" \
     -d "$PAYLOAD2" \
     https://intergram-16vq16x31-jean-baptiste-lasselle.vercel.app/hook

