JIRA_STORY=test-123
function get_services_from_file() {
                file=$1
                while IFS= read -r line; do
                  echo "Processing line: $line"
                  generate_values_to_override "$line"
                done < "$file"
              }

              function generate_values_to_override() {
                echo "generate_values_to_override with $1 $2"
                PREFIX="docker.io/"
                SERVICE=${2#"$PREFIX"}
                if check_for_image_tag ${SERVICE} ${JIRA_STORY}; then
                    echo "$1=$2:$JIRA_STORY"
                    VALUES_TO_OVERRIDE+=$(echo "$1=$2:$JIRA_STORY"),
                    echo VALUES_TO_OVERRIDE: $VALUES_TO_OVERRIDE
                fi
              }
              function check_for_image_tag(){
                echo "checking for service with image tag $1 $2"
                curl --silent -f --head -lL https://hub.docker.com/v2/repositories/$1/tags/$2/ > /dev/null
              }

  generate_values_to_override ph-ee-g2psandbox.ph-ee-engine.importer_rdbms.image docker.io/openmf/ph-ee-importer-rdbms
  generate_values_to_override ph-ee-g2psandbox.ph-ee-engine.channel.image docker.io/openmf/ph-ee-connector-channel