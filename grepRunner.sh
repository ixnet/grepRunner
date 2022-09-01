#!/bin/bash

declare -A regex
regex[SQLi_NodeJS]="^.*models\.sequelize\.query(.*)"
for i in "${!regex[@]}"
do
	echo  "Grepping for ${i}:"
	elcommand="grep -rnw \"${1}\" -e \""${regex["$i"]}"\" --color ${2}"
	echo $elcommand
	eval $elcommand
	echo "---------------------------------------------------------------------------------"
done

declare -A regex_file
regex_file[SQL_dotnet]="regexes4runner/SQLdotnet.txt"
regex_file[SQL_Java]="regexes4runner/SQLjava.txt"
regex_file[XSS_suspiciousJS]="regexes4runner/XSSsusJS.txt"
regex_file[HTML_dotnet]="regexes4runner/HTMLdotnet.txt"
regex_file[Cookie_dotnet]="regexes4runner/Cookiedotnet.txt"
regex_file[Serialization_dotnet]="regexes4runner/Serialdotnet.txt"
regex_file[Crypto_dotnet]="regexes4runner/Cryptodotnet.txt"
regex_file[IO_java]="regexes4runner/IOjava.txt"
regex_file[Servlets_java]="regexes4runner/Servletsjava.txt"
regex_file[SSTI]="regexes4runner/SSTI.txt"
regex_file[SSTI]="regexes4runner/FileUpload.txt"
for i in "${!regex_file[@]}"
do
	echo  "Grepping for ${i}:"
    elcommand="grep -rnw \"${1}\" --color ${2} -f \""${regex_file["$i"]}"\""
    echo $elcommand
	eval $elcommand
	echo "---------------------------------------------------------------------------------"
done

