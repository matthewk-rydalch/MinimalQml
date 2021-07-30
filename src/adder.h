#ifndef ADDER_H
#define ADDER_H

#include <QObject>
#include <iostream>

class Adder : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int overflowValue READ readOverflowValue WRITE writeOverflowValue NOTIFY overflowValueChanged)
    //The functions readOverflowValue and writeOverflowValue must be set if you want to read and write.  They are called when attempting to read or write to overflowValue from qml.
    // notify function (checkChanged) must be called anywhere that check would be changed in cpp.  This singal emission happens manually on the cpp side.

public:
    int readOverflowValue() {return overflowValue;};
    void writeOverflowValue(int newValue) {overflowValue = newValue; overflowValueChanged();}; //Must put the notify function in the write function to see the change.

    int sum{0};
    int overflowValue{5};

public slots:
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
    void overflow();
    void overflowValueChanged();
};

#endif // ADDER_H
