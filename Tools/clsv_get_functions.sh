#!/bin/bash

declare -a queuedDirs
declare -a funcNames
declare -a funcPaths
declare -i funcCount
declare -i dirCount
declare -a funcPrefixes
declare -a pathPrefixes

funcPrefix="rpcl"
pathPrefix="rpmod_client\\code"
funcCount=0
dirCount=0

cd C:/Projects/armarpmod/Source/client/

queuedDirs[$dirCount]="./code"
funcPrefixes[$dirCount]=$funcPrefix
pathPrefixes[$dirCount]=$pathPrefix
dirCount=($dirCount+1)

for ((i=0; i<${#queuedDirs[@]}; i++)); do
    _array=(${queuedDirs[$i]}/*)

    for ((j=0; j<${#_array[@]}; j++)); do
        _namePrefix="${funcPrefixes[$i]}"
        _pathPrefix="${pathPrefixes[$i]}"
        _fullPath="${_array[$j]}"
        _file="${_array[$j]##*/}"
        _dir="${_fullPath:0:${#_fullPath} - ${#_file}}"
        _base="${_file%.[^.]*}"
        _ext="${_file:${#_base} + 1}"

        if [ -z $_ext ]; then
            if [ -d "$_fullPath" ]; then
                echo "It's a directory!"
                queuedDirs[$dirCount]="${_fullPath}"
                funcPrefixes[$dirCount]="${funcPrefixes[$i]}${_base^}"
                pathPrefixes[$dirCount]="${pathPrefixes[$i]}\\${_base}"
                dirCount=($dirCount+1)
            fi
        else
            if [ $_ext = "sqf" ]; then
                funcNames[$funcCount]="${funcPrefixes[$i]}${_base^}"
                funcPaths[$funcCount]="${pathPrefixes[$i]}\\${_file}"
                funcCount=($funcCount+1)
            fi
        fi

        echo "----------------------------------------------------------"
        echo "NamePrefix: $_namePrefix"
        echo "PathPrefix: $_pathPrefix"
        echo "Path: $_fullPath"
        echo "File: $_file"
        echo "Dir: $_dir"
        echo "Base: $_base"
        echo "----------------------------------------------------------"
    done
done

for ((i=0; i<${#funcNames[@]}; i++)); do
    echo "['${funcNames[$i]}', '${funcPaths[$i]}', false],"
done