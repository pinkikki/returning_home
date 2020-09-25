#! /bin/bash -eu

set -o pipefail

curl -X POST \
--header "Authorization: key=${SERVER_KEY}" \
--header "project_id: key=${SENDER_KEY}" \
--header Content-Type:"application/json" \
https://fcm.googleapis.com/fcm/send \
-d @- << EOF
{
  "notification": {
    "body": "this2 is a body",
    "title": "this is a title"
  },
  "priority": "high",
  "content_available": true,
  "data": {
    "click_action": "FLUTTER_NOTIFICATION_CLICK",
    "id": "1",
    "message" : "hello",
    "metadata" : "hello meta",
    "status": "done",
  },
  "to": "/topics/all"
}
EOF
