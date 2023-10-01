#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QLineEdit>

#include <QWidget>

class MainWindow : public QWidget {
    Q_OBJECT

public:
    MainWindow(QWidget *parent = 0);

private slots:
    void startStreaming();
    void stopStreaming();

private:
    // Add UI components here, e.g., QLineEdit for user input and QPushButton for actions
    QLineEdit *serverLineEdit;
    QLineEdit *portLineEdit;
    QLineEdit *userLineEdit;
    QLineEdit *passwordLineEdit;
    QLineEdit *mountPointLineEdit;  // Add this line
};

#endif // MAINWINDOW_H

