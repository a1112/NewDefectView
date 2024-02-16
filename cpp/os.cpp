#include "../h/os.h"
#include <iostream>
#include <QFile>

OS::OS(QObject *parent) : QObject(parent){
    process=new QProcess(this);
}

void OS::system(QString text)
{
    std::cout<<"run: ";
    std::cout<<text.toStdString();
    process->startDetached(text);
}

void OS::moveFile(QString from, QString to)
{
    QDebug deb= qDebug();
    deb<<"mv";
    deb<<from;
    deb<<to;
    if (QFile::rename(from, to)) {
        qDebug() << "File renamed successfully.";
    } else {
        qDebug() << "Failed to rename file.";
    }

}
