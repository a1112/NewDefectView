#include "../h/os.h"
#include <iostream>

OS::OS(QObject *parent) : QObject(parent){
    process=new QProcess(this);
}

void OS::system(QString text)
{
    std::cout<<"run: ";
    std::cout<<text.toStdString();
    process->startDetached(text);
}
