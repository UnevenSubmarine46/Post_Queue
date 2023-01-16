#!/bin/bash

#Скрипт очистки почтовой очереди конкретного пользователя 




#Вводим ящик пользователя 
echo "Введите ящик пользователя"
read email

#Получаем id сообщений в очереди  и записываем в временный файл
/opt/zimbra/common/sbin/postqueue -p | grep "$email" |cut -d " " -f1 | cut -d "*" -f1 > /script/tmpsb/mail2.txt 


#Присваиваем 
idlist=/script/tmpsb/mail2.txt


#Проходимся циклом и удаляем сообщения из очереди
for a in $(cat $idlist)

    do
        /opt/zimbra/common/sbin/postsuper -d $a



   done

#После завершения скрипта - выводим статистику почтовой очереди
/opt/zimbra/libexec/zmqstat
