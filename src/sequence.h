#ifndef SEQUENCE_H
#define SEQUENCY_H

#include <QObject>
#include <QDebug>
#include <iostream>

class Sequence : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool check READ checker WRITE setCheck NOTIFY checkChanged) //This allows the value check to be read and written to in qml.
    //The functions checker and setCheck must be set.  They are called when attempting to read or write to check.
    // notify function (checkChanged) must be called anywhere that check would be changed in cpp.  This singal emission happens manually on the cpp side.
    Q_PROPERTY(int overflowValue READ readOverflowValue WRITE writeOverflowValue NOTIFY overflowValueChanged)
public:
    // Sequence();
    bool check{true};
    bool checker() const {return check;};
    void setCheck(bool val){check = val; checkChanged();}; //Must put the notify function in the write function to see the change.

    int readOverflowValue() {return overflowValue;};
    void writeOverflowValue(int newValue) {overflowValue = newValue; overflowValueChanged();};

    int sum{0};
    int overflowValue{5};

public slots:
    void cppMethod()
    {
        qDebug("C++ method called!");
        cpp_called();
    }
    void add_to_sum(int color)
    {
        sum = sum + color;
        if(sum > overflowValue)
        {
            sum = 0;
            overflow();
        }
        std::cout << sum << std::endl;
    }
signals:
    void cpp_called();
    void checkChanged();
    void overflow();
    void overflowValueChanged();

private:
    bool changed;
};

#endif // SEQUENCE_H
