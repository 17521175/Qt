#include "counter.h"

Counter::Counter(QObject *parent)
    : QObject{parent},
      m_display(QString("00:00:00")),
      m_timer(new QTimer(this)),
      m_hours(0), m_minutes(0), m_seconds(0)
{
    m_timer->setInterval(500);
    connect(m_timer, &QTimer::timeout, this, &Counter::timeout);
}

Counter::~Counter()
{
    m_timer->deleteLater();
}

QString Counter::display()
{
    return m_display;
}

void Counter::setDisplay(QString display)
{
    if (m_display == display) return;
    m_display = display;
    emit displayChanged();
}

void Counter::start()
{
    m_timer->start();
}

void Counter::stop()
{
    m_timer->stop();
}

void Counter::reset()
{
    m_timer->stop();
    m_display = "00:00:00";
    m_hours = 0;
    m_minutes = 0;
    m_seconds = 0;
    emit displayChanged();
}

void Counter::timeout()
{
    m_seconds++;
    if (m_seconds >= 60) {
        m_seconds = 0;
        m_minutes++;
        if (m_minutes >= 60) {
            m_minutes = 0;
            m_hours++;
        }
    }
    QString text;
    m_hours < 10 ? text.append("0" + QString::number(m_hours)) : text.append(QString::number(m_hours));
    text.append(":");
    m_minutes < 10 ? text.append("0" + QString::number(m_minutes)) : text.append(QString::number(m_minutes));
    text.append(":");
    m_seconds < 10 ? text.append("0" + QString::number(m_seconds)) : text.append(QString::number(m_seconds));
    setDisplay(text);
}

