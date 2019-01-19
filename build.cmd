SET CURRENT_DIR=%~dp0
docker run --rm --volume %CURRENT_DIR%:/srv/jekyll -it jekyll/jekyll:3.8 jekyll build