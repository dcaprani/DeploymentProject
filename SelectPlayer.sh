#!/usr/bin/bash
cat <<FINISH | mysql -uroot -ppassword
GRANT ALL PRIVILEGES ON TTCPlayerTTCPlayer.* TO dbtestuser@localhost IDENTIFIED BY 'dbpassword';
USE TTCPlayer
select * from Player;
FINISH

