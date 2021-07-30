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
    }
};

#endif // SEQUENCE_H
