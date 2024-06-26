# Требования к разрабатываемому Dockerfile

## **Docker: Docker-compose и мультирепозиторий**

Цель лабораторной: освоить запуск полноценного веб-приложения из разных репозиториев. Приложение должно содержать фронтенд и бэкэнд части из соответствующих репозиториев. Компоуз-файл должен запускать базу данных для приложения, и обратный прокси nginx

1. Учесть запуск `backend`, `frontend`, `db` и `nginx-proxy`

    ==> Несколько проектов - несколько директорий
    
    ==> `backend` из 5 лабораторной работы
   
    ==> `db` из 5 лабораторной работы
    
    ==> `frontend`
        
        ==> Оформлено в качестве сервера nginx, который отдает статические файлы html, используя образ nginx-proxy
        
    ==> `nginx-proxy`

        ==> Входной сервер nginx, перенаправляющий запросы к frontend / backend

2. Вся конфигурация выполняется через переменные окружения, передающиеся через `env_file` и `environment`

    ==> .env

    ==> <...>.env (специальные файлы с переменными окружения, можно настройть в зависимости от окружения, в лабораторной работае в зависимости от проекта)

3. Точкой входа является только `nginx-proxy`, остальные сервисы не имеют открытых наружу портов

    ==> Конфигурируются сети в docker-compose

4. Должна быть возможность конфигурирования через файлы настроек в виде `volume`

    ==> Конфигурация nginx через nginx.conf, добавляемый как volume (см 2 лабораторную)

5. В каждом репозитории должен быть свой докеркомпоуз, который получает собранные образы зависимостей из реджистри, и пересобирает свой (подход на ваше усмотрение)

    ==> Аналогично 5 лабораторной - подход со сборкой через zsh файл с кэшем

6. Должны быть учтены `project-spaces`, во избежание `orphans`

    ==> Добавлены разные префиксы для отдельных проектов

7. При работе сразу с несколькими файлами docker-compose, они не должны удалять чужие ресурсы

    ==> Разные префиксы для проектов, чтобы они не пересекались + сеть для работы между проектами

8. В docker-compose должен быть сайдкар для lets encrypt

    ==> Использован сайдкар Openssl (см 2 лабораторную)

Примечание:
1. Для сборки образов использовать build.zsh
2. Для запуска каждого из docker-compose использовать deploy.zsh
3. Для остановки каждого из docker-compose использовать down.zsh
