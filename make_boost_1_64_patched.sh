if [ ! -d work_folder ]; then
  mkdir work_folder
fi
cd work_folder

wget https://dl.bintray.com/boostorg/release/1.64.0/source/boost_1_64_0.tar.bz2
tar xvf boost_1_64_0.tar.bz2
mv boost_1_64_0 boost_1_64_0-patchivs
cd boost_1_64_0-patchivs
patch -p1 -i  ../../boost_patch_ivs.patch
cd ..
tar -jcvf boost_1_64_0-patchivs.tar.bz2 boost_1_64_0-patchivs

