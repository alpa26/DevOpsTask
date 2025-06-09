pipeline {
    agent any

    stages {
        stage('Информация об использовании диска') {
            steps {
                script {
                    echo '=== Информация о состоянии жестких дисков ==='
                    sh '''
                        echo "Состояние дисков:"
                        df -h

                        echo "\\nDetailed mount usage:"
                        lsblk
                    '''
                }
            }
        }

        stage('Самый прожорливый процесс') {
            steps {
                script {
                    echo '=== Топ потребления памяти==='
                    sh '''
                        echo "Процесс занимающий наибольший объем памяти в данный момент:"
                        ps aux --sort=-%mem | head -n 2
                    '''
                }
            }
        }
    }
}