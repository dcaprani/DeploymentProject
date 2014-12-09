#!/usr/bin/bash
cat <<FINISH | mysql -uroot -ppassword
USE TTCPlayer
select * from Player;
FINISH

