#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>
#include <QTimer>

class Counter : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString display READ display WRITE setDisplay NOTIFY displayChanged)

public:
    explicit Counter(QObject *parent = nullptr);
    ~Counter();
    QString display();
signals:
    void displayChanged();
public slots:
    void setDisplay(QString display);
    void start();
    void stop();
    void reset();
    void timeout();
private:
    QString m_display;
    QTimer* m_timer;
    int m_hours, m_minutes, m_seconds;
};

#endif // COUNTER_H
