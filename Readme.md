# Usage

## Installation

```bash
chmod +x grepRunner.sh
```
## Parameters

```bash
./grepRunner.sh DIRECTORY_TO_SCAN ADDITIONAL_PARAMETERS_FOR_GREP MODE
```
If MODE is empty, full scan will be executed

Supported mode:
- Java
- dotnet
- NodeJS
- JS
- SSTI
- FileUpload

>Example

```bash
./grepRunner.sh ~/Documents/buggyWebApps/sources/juice-shop/ "--exclude-dir={frontend,node_modules,i18n,build,test,data,.git,.github}" NodeJS
```