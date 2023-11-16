export JIRA_STORY=test-123
function docker_tag_exists() {
              curl --silent -f --head -lL https://hub.docker.com/v2/repositories/$1/tags/$2/ > /dev/null
            }
            if docker_tag_exists openmf/community-app ${JIRA_STORY}; then
              TICKET_NO=$(echo $PR_TITLE | cut -d "[" -f2 | cut -d "]" -f1)
              COMMUNITY_APP=$(echo "ph-ee-g2psandbox.ph-ee-engine.community-app:${JIRA_STORY}"),
            fi
            if docker_tag_exists openmf/ph-ee-importer-rdbms ${JIRA_STORY}; then
              IMPORTER_RDBMS=$(echo "ph-ee-g2psandbox.ph-ee-engine.importer_rdbms:${JIRA_STORY}"),
            fi
            if docker_tag_exists openmf/ph-ee-connector-channel ${JIRA_STORY}; then
              CHANNEL=$(echo "ph-ee-g2psandbox.ph-ee-engine.channel:${JIRA_STORY}"),
            fi
            export VALUES_TO_OVERRIDE=$(echo $IMPORTER_RDBMS)$(echo $CHANNEL)

            echo this $VALUES_TO_OVERRIDE