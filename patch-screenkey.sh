# move screenkey bar to bottom
sudo sed -i 's/self.screen_height - window_height * 2/self.screen_height - window_height/g' /usr/lib/python2.7/dist-packages/Screenkey/screenkey.py

