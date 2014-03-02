# Edited from https://gist.github.com/avsm/6757425
# (see post at: http://anil.recoil.org/2013/09/30/travis-and-ocaml.html)

OPAM_DEPENDS="mirage"

case "$OCAML_VERSION,$OPAM_VERSION" in
4.01.0,1.1.0) ppa=avsm/ocaml41+opam11 ;;
*) echo Unknown $OCAML_VERSION,$OPAM_VERSION; exit 1 ;;
esac

# set up machine
echo "yes" | sudo add-apt-repository ppa:$ppa
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam
export OPAMYES=1
export OPAMVERBOSE=1
opam init
opam install ${OPAM_DEPENDS}
eval `opam config env`

# Print info on system
echo OCaml version
ocaml -version
echo OPAM versions
opam --version
opam --git-version
echo Mirage version
mirage --version

# run the commands to build from here
mirage configure --unix
mirage build

mirage clean
mirage configure --xen
mirage build
