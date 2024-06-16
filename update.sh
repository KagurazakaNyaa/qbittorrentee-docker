#!/bin/bash
version=$(curl --silent -H "Authorization: Bearer ${GITHUB_TOKEN}" "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
currentversion=$(cat currentversion)
echo "currentversion:$currentversion version:$version"
echo "$version" >currentversion
if [[ "$currentversion" == "$version" ]]; then
    exit
fi
sed -i 's/^ENV RELEASE_TAG.*$/ENV RELEASE_TAG '"$version"'/i' Dockerfile
git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git add currentversion Dockerfile
git commit -a -m "Auto Update to qBittorrent-Enhanced-Edition $version"
git tag -f "$version"
git push
git push origin --tags -f
