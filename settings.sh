echo "America/Mexico_City" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

sudo apt-get update
sudo apt-get upgrade -y 
sudo apt-get install -y openjdk-7-jdk

##### R 

sudo apt-get install -y build-essential libpq-dev liblapack3 libblas3 libmysql++-dev sqlite3 fort77 gnuplot-x11 gfortran texinfo liblapack-dev liblapack3gf texi2html libglpk-dev
sudo apt-get build-dep -y r-base

cd
wget -c http://cran.r-project.org/src/base/R-latest.tar.gz

tar zxvf R-latest.tar.gz
cd "$(ls -dt R-*/ | head -1 )"
nohup ./configure --enable-memory-profiling --enable-R-shlib --with-blas --with-lapack --with-system-zlib --with-system-bzlib --with-system-xz --with-tcltk --with-cairo --with-libpng --with-jpeglib --with-libtiff
nohup make
nohup sudo make install

##### Mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee      /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-10gen

##### Ruby
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements
rvm install 1.9.1-dev
rvm rubygems current
nohup gem install rails
gem install mongo
gem install tweetstream

# Añadir las lineas a .bashrc: [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
