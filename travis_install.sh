# Move the food modpack to a subfolder
mkdir tmp1 && mv * tmp1
mv tmp1 food

# Install dependancies
sudo apt-get update
sudo apt-get install -y libirrlicht-dev libbz2-dev \
	libpng12-dev libjpeg-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev \
	libogg-dev libvorbis-dev libopenal-dev libcurl4-gnutls-dev \
	libfreetype6-dev zlib1g-dev libgmp-dev libjsoncpp-dev wget \
	lua5.1 luarocks libzzip-dev luajit
sudo luarocks install luazip
sudo luarocks install luafilesystem
sudo luarocks install luajson

# Get minetest
wget https://www.dropbox.com/s/wtub256856vdclf/minetestserver.zip?dl=1 -O minetestserver.zip
unzip minetestserver.zip -d minetest

# Install the food modpack
cp food minetest/mods -rf

# Install and configure mtpm
git clone https://github.com/rubenwardy/mtpm
cd mtpm
mkdir tmp
./mtpm.lua config mod_location ../minetest/mods/

# Install the food modpack's supported mods
./mtpm.lua install -r ../food/requirements.txt -y

# Configure Minetest
echo "Configuring Minetest"
cd ../minetest
mkdir worlds/world
echo "gameid = minetest" > worlds/world/world.mt
echo "backend = sqlite3" >> worlds/world/world.mt
echo "creative_mode = true" >> worlds/world/world.mt
echo "enable_damage = true" >> worlds/world/world.mt
cd mods
for f in *
		do
	echo "load_mod_$f = true" >> ../worlds/world/world.mt
done

# Install test worldmod
cd ../
mkdir worlds/world/worldmods/
mkdir worlds/world/worldmods/food_test/
echo "minetest.after(0, function()" > worlds/world/worldmods/food_test/init.lua
echo "	print(\"tests complete\")" >> worlds/world/worldmods/food_test/init.lua
echo "	minetest.request_shutdown()" >> worlds/world/worldmods/food_test/init.lua
echo "end)" >> worlds/world/worldmods/food_test/init.lua

# Go pack to the right directory
cd ../food
