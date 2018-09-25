version=


usage()
{
    echo "usage: build_docker [-v version ]"
}

while [ "$1" != "" ]; do
    case $1 in
        -v | --version )           shift
                                version=$1
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done



if [ $version = "" ]; then
  echo "version: $version"
  echo "exit"
fi

echo "### Writing File ###"
echo "Version: $version"
echo $version > version.txt
echo "### Docker Build ###"
docker build -t keycloak-theme ./

echo "### Docker Tag: matsbecker/aareon:keycloak-theme-v$version ###"
docker tag keycloak-theme matsbecker/aareon:keycloak-theme-v$version

echo "### Docker Push: matsbecker/appnode:nodev$version ###"
docker push matsbecker/aareon:keycloak-theme-v$version