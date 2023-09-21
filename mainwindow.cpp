#include "mainwindow.h"
#include <QLabel>
#include <QLineEdit>
#include <QFormLayout>
#include <QPushButton>


MainWindow::MainWindow(QWidget *parent) : QWidget(parent) {
    QFormLayout *layout = new QFormLayout;

    QLineEdit *serverLineEdit = new QLineEdit(this);
    QLineEdit *portLineEdit = new QLineEdit(this);
    QLineEdit *userLineEdit = new QLineEdit(this);
    QLineEdit *passwordLineEdit = new QLineEdit(this);
    passwordLineEdit->setEchoMode(QLineEdit::Password);

    layout->addRow(new QLabel("Icecast Server:"), serverLineEdit);
    layout->addRow(new QLabel("Port:"), portLineEdit);
    layout->addRow(new QLabel("User:"), userLineEdit);
    layout->addRow(new QLabel("Password:"), passwordLineEdit);

    QPushButton *startButton = new QPushButton("Start Streaming", this);
    connect(startButton, &QPushButton::clicked, this, &MainWindow::startStreaming);

    QPushButton *stopButton = new QPushButton("Stop Streaming", this);
    connect(stopButton, &QPushButton::clicked, this, &MainWindow::stopStreaming);

    layout->addRow(startButton, stopButton);

    setLayout(layout);
}


extern "C" {
#include "streamer.h"
}

void MainWindow::startStreaming() {
    // Get values from UI components and pass them to the streaming function
    startStream(
        serverLineEdit->text().toStdString().c_str(),
        portLineEdit->text().toStdString().c_str(),
        userLineEdit->text().toStdString().c_str(),
        passwordLineEdit->text().toStdString().c_str()
    );
}

void MainWindow::stopStreaming() {
    stopStream();
}

