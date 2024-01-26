# MacPorts

https://guide.macports.org

sudo port install python310 py310-pip

port select --summary
sudo port select --set python3 python310
sudo port select --set pip pip310

sudo port install ffmpeg

sudo port install ruby-install
ruby-install ruby 3.1.3

echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.bash_profile
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.bash_profile
echo "chruby ruby-3.1.3" >> ~/.bash_profile # run 'chruby' to see actual version