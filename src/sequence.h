#ifndef SEQUENCE_H
#define SEQUENCY_H

#include <QObject>
#include <QDebug>

class Sequence : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool check READ checker WRITE setCheck NOTIFY checkChanged) //This allows the value check to be read and written to in qml.
    //The functions checker and setCheck must be set.  They are called when attempting to read or write to check.
    // notify function (checkChanged) must be called anywhere that check would be changed in cpp.  This singal emission happens manually on the cpp side.
public:
    // Sequence();
    bool check{true};
    bool checker() const {return check;};
    void setCheck(bool val){check = val; checkChanged();}; //Must put the notify function in the write function to see the change.

public slots:
    void cppMethod()
    {
        qDebug("C++ method called!");
        cpp_called();
    }
signals:
    void cpp_called();
    void checkChanged();

private:
    bool changed;
};

#endif // SEQUENCE_H
