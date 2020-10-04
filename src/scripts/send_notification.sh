#!/bin/bash

Send_notification() {
  if [ -z "${MM_WEBHOOK}" ]; then
    if [ -z "${WEBHOOK_URL}" ]; then
      echo "NO MATTERMOST WEBHOOK SET"
      echo "Please input your MM_WEBHOOK value either in the settings for this project, or as a parameter for this orb."
      exit 1
    else
      MM_WEBHOOK=${WEBHOOK_URL}
    fi
  fi

  STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" -X POST -H 'Content-type: application/json' \
    --data \
    "{
      \"Organization\": \"${CIRCLE_PROJECT_USERNAME}\",
      \"Repository\": \"${CIRCLE_PROJECT_REPONAME}\",
      \"RepositoryURL\": \"${CIRCLE_REPOSITORY_URL}\",
      \"Username\": \"${CIRCLE_USERNAME}\",
      \"WorkflowID\":\"${CIRCLE_WORKFLOW_ID}\", \
      \"JobName\":\"${CIRCLE_JOB}\", \
      \"CircleBuildNumber\": ${CIRCLE_BUILD_NUM},
      \"CircleBuildURL\": \"${CIRCLE_BUILD_URL}\",
      \"Branch\": \"${CIRCLE_BRANCH}\",
      \"Tag\":\"${CIRCLE_TAG}\", \
      \"Commit\":\"${CIRCLE_SHA1}\", \
      \"AssociatedPullRequests\": \"${CIRCLE_PULL_REQUESTS}\",
      \"IsFailed\": ${MM_BUILD_IS_FAILED},
      \"IsWaitingApproval\": ${IS_WAITING_APPROVAL},
      \"Message\": \"${MM_MESSAGE}\"
    }" "${MM_WEBHOOK}")

  if [ "$STATUS" -ne "200" ]; then
    echo "Notification not sent due to an error. Status: $STATUS. Please check the webhook URL"
    exit 1
  fi

  echo "Notification sent!"
  exit 0
}

Send_notification
