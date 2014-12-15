# Leave running in screen
while [[ true ]]; do
  cd /persistent/backups
  wget --mirror "ftp://$USER:$PASS@$HOST"

  cd /persistent/overviewer
  overviewer.py --config=overviewer.conf
  overviewer.py --genpoi --config=overviewer.conf
  sleep 30
done
