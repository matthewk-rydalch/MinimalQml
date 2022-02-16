#include <QObject>
#include <iostream>

class TableView : public QObject
{
    Q_OBJECT
signals:
    Q_SIGNAL void addFieldInQml(int index);
    Q_SIGNAL void shakeThingsUp(int indexPlusSome);
public:
    Q_INVOKABLE bool add_field_to_table_from_cpp()
    {
        index++;
        if(index <= maxIndex)
        {
            emit addFieldInQml(index);
        }
        else
        {
            index = 0;
            emit shakeThingsUp(index+3);
        }
        return true;
    }
protected:
    int index = 0;
    int maxIndex = 5;
};