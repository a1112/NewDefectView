#ifndef CMD_H
#define CMD_H
#include<QtCore>

class OS : public QObject
{
    Q_OBJECT
public:
    explicit OS(QObject *parent = nullptr);
    Q_INVOKABLE void system(QString text);
    Q_INVOKABLE void moveFile(QString from, QString to);
private:
    QProcess *process;
};

#endif // CMD_H
