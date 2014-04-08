#!/bin/sh
echo "This will create a tar-ball suitable to upload to the toolshed."

if [ -f "data_manager/data_manager_blastdb/make_data_manager_blastdb.sh" ]
then
echo "Good, in the expected directory"
else
echo "ERROR. Run this from the GitHub repository root directory."
exit 1
fi

if [ -f "data_manager_blastdb.tar.gz" ]
then
echo "ERROR. File ncbi_blast_plus.tar.gz already exists."
exit 1
fi

#Create tar file with core XML wrappers
if [ -f "data_manager_blastdb.tar" ]
then
rm data_manager_blastdb.tar
fi

#Create tar file (-cf then -rf to add to it)
tar -rf  data_manager_blastdb.tar test-data/cog.out
tar -rf  data_manager_blastdb.tar test-data/pataa.out
tar -rf  data_manager_blastdb.tar test-data/patnt.out
tar -rf  data_manager_blastdb.tar tool-data/blastdb.loc.sample
tar -rf  data_manager_blastdb.tar tool-data/blastdb_p.loc.sample
tar -rf  data_manager_blastdb.tar tool-data/blastdb_d.loc.sample
tar -rf  data_manager_blastdb.tar tool-data/tool_data_table_conf.xml.sample
tar -rf  data_manager_blastdb.tar data_manager/data_manager_blastdb/data_manager_conf.xml
tar -rf  data_manager_blastdb.tar data_manager/data_manager_blastdb/README
tar -rf  data_manager_blastdb.tar data_manager/data_manager_blastdb/tool_dependencies.xml
tar -rf  data_manager_blastdb.tar data_manager/data_manager_blastdb/blastdb.xml
tar -rf  data_manager_blastdb.tar data_manager/data_manager_blastdb/fetch_blast_db.py


#Zip the tar file
gzip data_manager_blastdb.tar

#Check the output
echo "Expect a tar-ball 12 files, have:"
tar -tzf data_manager_blastdb.tar.gz | wc -l
