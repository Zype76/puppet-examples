Adding an example module. 

The template can be keyed off of local facts. On linux hosts, this is in  /etc/facter/facts.d/

Example:
vi /etc/facter/facts.d/benderis.txt

Content added:
bender=great

To properly execute this, set the module path to the directory of the parent init.pp file: 
sudo puppet apply --modulepath=$(pwd) init.pp 
