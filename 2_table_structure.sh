#!/bin/bash

read -p "Enter Database name: " db_name
read -p "Enter filename which contains the list of database tables: " tables_filename
read -p "Enter directory to export tables structure: " tables_dir
echo -e "\nDatabase: ${db_name}"
echo -e "\nOutput directory: ${tables_dir}"

if [ ! -d "${tables_dir}" ]; then
  mkdir ${tables_dir}
fi
for x in $(cat ${tables_filename}); do
#  echo "${db_name}.$x";
  clickhouse-client -h 127.0.0.1 -u superuser --password mYpassword3 \
    --query="SHOW CREATE TABLE ${db_name}.$x;" >> ${tables_dir}/$x.sql
done

exit 0
