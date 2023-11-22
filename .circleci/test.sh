 function generate_values_to_override() {
    echo "TESTING TSEING $1 $2"
    PREFIX="docker.io/"
    service=$2
    echo ${service#"$PREFIX"}
    if check_for_image_tag ${2#"$PREFIX"} ${JIRA_STORY}; then
        JIRA_STORY=test-123
        echo $1=$2:$JIRA_STORY
        VALUES_TO_OVERRIDE+=$(echo $1=$2:$JIRA_STORY),
        echo VALUES_TO_OVERRIDE: $VALUES_TO_OVERRIDE
    fi
  }
  function check_for_image_tag(){
                  curl --silent -f --head -lL https://hub.docker.com/v2/repositories/$1/tags/$2/ > /dev/null
                }

  generate_values_to_override ph-ee-g2psandbox.ph-ee-engine.community-app.image docker.io/openmf/community-app