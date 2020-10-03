#!/bin/bash

Send_notification() {
  if [ -z "${WEBHOOK_URL}" ]; then
    # Provide error if no webhook is set and error. Otherwise continue
    echo "NO MATTERMOST WEBHOOK SET"
    echo "Please input your MM_WEBHOOK value either in the settings for this project, or as a parameter for this orb."
    exit 1
  fi

  curl -X POST -H 'Content-type: application/json' \
    --data \
    "{
      \"Organization\": \"${CIRCLE_PROJECT_USERNAME}\",
      \"Repository\": \"${CIRCLE_PROJECT_REPONAME}\",
      \"RepositoryURL\": \"${CIRCLE_REPOSITORY_URL}\",
      \"Username\": \"${CIRCLE_USERNAME}\",
      \"WorkflowID\":\"${CIRCLE_WORKFLOW_ID}\", \
      \"PipelineNumber\": \"${CIRCLE_PIPELINE_NUMBER}\", \
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
    }" "${WEBHOOK_URL}"

  echo "Notification sent"
}

Send_notification
