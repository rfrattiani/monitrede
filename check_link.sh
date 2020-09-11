#!/bin/bash -x
# checa status dos links e troca as prioridades
# raphael.frattiani@ntk.com.br

cont=0
error=0
while true; do
    status=$(curl http://192.168.50.2)

    awk 'BEGIN{if ('$status'>'0.199') exit 2}'
    if [ $? -eq 2 ]; then

        let cont++
        let error++
        sleep 2

        if  [ "$error" -eq "5" ]; then
            let cont++
            let error++
            status=$(curl http://192.168.50.2)
            echo dentro do until

            if [ "$cont" -gt "4" ]; then
                getlevel3=$(/opt/monit/level3_status.sh | grep -v "inc" | awk {'print $5'} | grep '^.')
                getembratel=$(/opt/monit/embratel_status.sh | grep -v "inc" | awk {'print $5'} | grep '^.')

                if [ "$getlevel3" = "Active" ]; then
                    #       /opt/monit/downlevel3.sh
                    echo "Ativando Embratel"
                cont=0
                error=0
                else
                    #/opt/monit/uplevel3.sh
                    echo "Ativando Level 3"
                cont=0
                error=0
                fi
        fi

    fi

    sleep 60

done