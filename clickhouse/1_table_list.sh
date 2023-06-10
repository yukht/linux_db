#!/bin/bash

read -p "Enter Database name: " db_name
read -p "Enter filename to export list of tables: " tables_list_filename
echo -e "\nDatabase: ${db_name}"
clickhouse-client -h 127.0.0.1 -u superuser --password mYpasswoRd3 \
--query="SHOW TABLES IN ${db_name};" >> ./${tables_list_filename}

exit 0
