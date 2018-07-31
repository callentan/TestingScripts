#!/bin/bash

git clone -n https://v-xiztan.visualstudio.com/azurecr-test/_git/iis-docker-vsts
expect "Username"
send "v-xiztan\n"
expect "Password"
send "xwquuppck6ahf4zuppk5zz5kiw3j2inevokkb2ouws2ux7be5tmqgit\n"
