# CircleCI Orb - Mattermost-plugin-notify

[![CircleCI Build Status](https://circleci.com/gh/nathanaelhoun/circleci-orb-mattermost-plugin-notify.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/nathanaelhoun/circleci-orb-mattermost-plugin-notify)
[![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/nathanaelhoun/mattermost-plugin-notify)](https://circleci.com/orbs/registry/orb/nathanaelhoun/mattermost-plugin-notify)
[![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/nathanaelhoun/circleci-orb-mattermost-plugin-notify/master/LICENSE)
[![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)
[![Mattermost Community Channel](https://img.shields.io/badge/Mattermost%20Community-~Plugin%3A%20CircleCI-blue)](https://community.mattermost.com/core/channels/plugin-circleci)

Send notifications to the [Mattermost Plugin for CircleCI](https://github.com/mattermost/mattermost-plugin-circleci).

## How to use + Features

[Mattermost-plugin-notify Orb Registry Page](https://circleci.com/orbs/registry/orb/nathanaelhoun/mattermost-plugin-notify) - The official registry page of this orb for all versions, executors, commands, and jobs described.

[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.

[Mattermost Plugin Docs](https://mattermost.gitbook.io/circle-ci-plugin/user-guide/webhooks-notifications) - To setup and use the corresponding Mattermost Plugin.

## Dependencies / Requirements

### Bash Shell

Because these scripts use bash-specific features, Bash is required. Bash is the default shell used on CircleCI and the Orb will be compatible with most images. If using an Alpine base image, you will need to call apk add bash before calling this Orb, or create a derivative base image that calls RUN apk add bash. If Bash is not available, an error message will be logged and the task will fail.

### cURL

cURL is used to post the Webhook data and must be installed in the container to function properly.

### How to Contribute

[Github Issues](https://github.com/nathanaelhoun/circleci-orb-mattermost-plugin-notify/issues) and [Pull Requests](https://github.com/nathanaelhoun/circleci-orb-mattermost-plugin-notify/pulls) are welcomed in this repository!

## License

This repository is under the [MIT License](./LICENSE)
