# boost_patch_warnings

A repo that contains archives for the boost patches

Do not use this repo alone, use the master repo
https://github.com/ivsgroup/hunter_master

# Comment créer une version 

Exemple avec boost 1.64.0

#### 1/ Adapter et exécuter le script make_boost_1_64_patched.sh
#### 2/ Aller sur github et créer une release de boost :

* Aller ici : https://github.com/ivsgroup/boost_patch_warnings/releases
* Clic sur "Draft a new release"
* Donner le nom de tag : 1_64_0-patchivs
* Commentaire "boost 1.64.0 with warning patches"
* Uploader le fichier "boost_1_64_0-patchivs.tar.bz2" dans cette release
* Cliquer sur publish release

### 3/ Faire une release de hunter
* Calculer le sha1 du fichier boost_1_64_0-patchivs.tar.bz2

```bash
sha1sum boost_1_64_0-patchivs.tar.bz2  # ou sha1sum
bf4e443e2d0cc1e947e61748e5a23e8a1b04e46a  boost_1_64_0-patchivs.tar.bz2
```
* Dans le repo hunter (i.e `hunter_master/hunter`), éditer le fichier 
`hunter_master/hunter/cmake/projects/Boost/hunter.cmake`
* Ajouter le contenu ci-dessous, en mettant l'url d'archive donnée par github et le sha1 calculé précédemment.

```
# silence msvc level 4 warning inside exception/exception.hpp and optional/optional.hpp
# see patch here : https://raw.githubusercontent.com/ivsgroup/boost_patch_warnings/ivs/boost_patch_ivs.patch
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.64.0-patchivs"
    URL
    "https://github.com/ivsgroup/boost_patch_warnings/releases/download/1_64_0-patchivs/boost_1_64_0-patchivs.tar.bz2"
    SHA1
    bf4e443e2d0cc1e947e61748e5a23e8a1b04e46a
)
```

* Committer dans le repo hunter (sur la branche ivs) et pusher les modifs 
* Aller dans le repo hunter sur github sur la branche ivs : https://github.com/ivsgroup/hunter/tree/ivs
* Cliquer sur "releases" pour en créer une
* Cliquer sur "Draft a new release"
* Choisir la branche "ivs" (dans "Target"), et créer un tag qui contient "ivs" :
  par exemple `v0.18.15-ivs-2`
  Ajouter un commentaire qui explique ce que ça fait
  Par exemple :
```
Update hunter version : This release is based on hunter official tag v0.18.15 and adds patches against msvc warnings for opencv, boost, and gtest. It also updates boost to 1.64.0-patchivs
```

