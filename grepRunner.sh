#!/bin/bash
lang=""
if [ -z "$3" ]; then
	echo "Launch in FULL mode"
	lang="FULL"
else 
	echo "Only grepping for '$3'"
	lang="$3"
fi

declare -A regex
regex[SQLi_NodeJS_FULL]="^.*models\.sequelize\.query(.*)"

for i in "${!regex[@]}"
	do
		if [[ "$i" == *"${lang}"* ]]; then
			echo  "Grepping for ${i}:"
			elcommand="grep -rnw \"${1}\" -e \""${regex["$i"]}"\" --color ${2}"
			echo $elcommand
			eval $elcommand
			echo "---------------------------------------------------------------------------------"	
		fi
	done

declare -A regex_file
regex_file[SQL_dotnet_FULL]="regexes4runner/SQLdotnet.txt"
regex_file[SQL_Java_FULL]="regexes4runner/SQLjava.txt"
regex_file[XSS_suspiciousJS_FULL]="regexes4runner/XSSsusJS.txt"
regex_file[HTML_dotnet_FULL]="regexes4runner/HTMLdotnet.txt"
regex_file[Cookie_dotnet_FULL]="regexes4runner/Cookiedotnet.txt"
regex_file[Serialization_FULL]="regexes4runner/Serialization.txt"
regex_file[Crypto_dotnet_FULL]="regexes4runner/Cryptodotnet.txt"
regex_file[IO_Java_FULL]="regexes4runner/IOjava.txt"
regex_file[Servlets_Java_FULL]="regexes4runner/Servletsjava.txt"
regex_file[SSTI_FULL]="regexes4runner/SSTI.txt"
regex_file[FileUpload_FULL]="regexes4runner/FileUpload.txt"
regex_file[SSRF_FULL]="regexes4runner/SSRF.txt"
regex_file[XXE_FULL]="regexes4runner/XXE.txt"

for i in "${!regex_file[@]}"
	do
		if [[ "$i" == *"${lang}"* ]]; then
			echo  "Grepping for ${i}:"
			elcommand="grep -rnw \"${1}\" --color ${2} -f \""${regex_file["$i"]}"\""
			echo $elcommand
			eval $elcommand
			echo "---------------------------------------------------------------------------------"
		fi
	done
