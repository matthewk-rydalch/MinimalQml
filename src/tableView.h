#include <QObject>
#include <iostream>

class TableView : public QObject
{
    Q_OBJECT
signals:
    Q_SIGNAL void addFieldInQml();
public:
    Q_INVOKABLE bool add_field_to_table_from_cpp()
    {
        std::cout << "adding field to table" << std::endl;
        emit addFieldInQml();
        return true;
    }
protected:
};