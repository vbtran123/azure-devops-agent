dt=$(date '+%Y%m%d%H%M');
echo "dt: $dt"
echo "token: $AZP_TOKEN"
echo "url: $AZP_URL"
echo "project: $AZP_PROJECT_NAME"
echo "pool: $AZP_POOL"

./devops-runner/config.sh --unattended \
  --url "${AZP_URL}" \
  --auth "PAT" --token "${AZP_TOKEN}" \
  --projectName "${AZP_PROJECT_NAME}" \
  --pool "${AZP_POOL}" \
  --agent "agent-$dt" \
  --replace \
  --acceptTeeEula & wait $!

./devops-runner/run.sh "$@" & wait $!
