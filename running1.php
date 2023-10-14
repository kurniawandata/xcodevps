<?php
system("docker run -d --name serverunikport -e ROOT_PASSWORD=unikpass -p unikport:22 -p numberdata:80 --restart=always server")
?>
