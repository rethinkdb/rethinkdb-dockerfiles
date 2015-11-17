# rethinkdb-dockerfiles

Dockerfiles for past and present versions of RethinkDB.

## Documentation

https://github.com/docker-library/docs/blob/master/rethinkdb/README.md

## Procedure for updating

After creating a commit for the new release package using `./cut-new-release.sh`:

   ```bash
   # example
   ./cut-new-release.sh 1.16.1
   
   # if package version includes a suffix like "+1",
   # pass that suffix as the second argument
   ./cut-new-release.sh 1.16.2 +1 
   ```

Note the hash of the commit and push it to GitHub.

Once the commit is pushed, go to https://github.com/docker-library/official-images/edit/master/library/rethinkdb
and put together a pull request that includes all the new tags, using the
`jessie` dockerfiles. The new point release should be added as a tag, and
tags for the minor and major versions should be either created or updated
to point to the new Dockerfile, as well as the "latest" tag.

Once the pull request for the new image is accepted by the upstream Docker
library, this should be announced in Slack and/or IRC (and maybe Twitter).
