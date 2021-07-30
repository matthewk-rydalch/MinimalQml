#ifndef SEQUENCE_H
#define SEQUENCY_H

#include <QObject>
#include <QDebug>

class Sequence : public QObject
{
    Q_OBJECT
public:
    // Sequence();
    bool check{true};

public slots:
    void cppMethod()
    {
        qDebug("C++ method called!");
        cpp_called();
    }
signals:
    void cpp_called();

private:
    bool changed;
};

#endif // SEQUENCE_H
