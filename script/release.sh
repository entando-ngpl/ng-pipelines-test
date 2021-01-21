TMPDIR="/tmp"
git fetch --tag
# checkout milestones branch
# TODO create a dedicated milestone branch
if [ -z "$(git branch --list milestones 2> /dev/null)" ]; then
  git co -b milestones
else
  git co milestones
fi

# set version
lastTag=$( git tag -l | tail -1 )
IFS='.' read -r X Y Z <<< "$lastTag"
X="${X//v/}"    # tag version to pom version
Z=$((Z+1))
mvn versions:set -DnewVersion="$X.$Y.$Z" > "$TMPDIR/mvn-version.log"
echo "Version updated"
# compile
mvn compile > "$TMPDIR/mvn-compile.log" || {
  cat "$TMPDIR/mvn-compile.log"
  exit $FILENO
}
# commit
git add .
git commit -m "v$X.$Y.$Z"
# tag
git tag "v$X.$Y.$Z"
# push
git push --set-upstream origin milestones --force
git push --tags
