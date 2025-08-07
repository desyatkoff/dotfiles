# Desyatkoff Dotfiles

<img
    src="assets/demo_13.png"
    align="right"
    width="500"
/>

* Операционная система: [`Arch Linux`](https://archlinux.org)
* Оболочка терминала: [`Zsh`](https://www.zsh.org)
* Текстовый редактор: [`Helix`](https://helix-editor.com)
* Оконный композитор: [`Hyprland`](https://hypr.land)
* Тема: [`Catppuccin Mocha`](https://catppuccin.com)
* Иконки: [`Papirus Dark`](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
* Терминал: [`Kitty`](https://sw.kovidgoyal.net/kitty/)
* Статус бар: [`Waybar`](https://github.com/Alexays/Waybar)
* Лаунчер: [`Rofi`](https://github.com/davatorium/rofi)
* Док панель: [`Hydock`](https://github.com/desyatkoff/hydock)

<br />

<p align="center">
    &ensp;<a href="#описание"><kbd>&ensp;<br />&ensp;&ensp;Описание&ensp;&ensp;<br />&ensp;</kbd></a>&ensp;
    &ensp;<a href="#особенности"><kbd>&ensp;<br />&ensp;&ensp;Особенности&ensp;&ensp;<br />&ensp;</kbd></a>&ensp;
    &ensp;<a href="#установка"><kbd>&ensp;<br />&ensp;&ensp;Установка&ensp;&ensp;<br />&ensp;</kbd></a>&ensp;
    &ensp;<a href="#сочетания-клавиш"><kbd>&ensp;<br />&ensp;&ensp;Сочетания клавиш&ensp;&ensp;<br />&ensp;</kbd></a>&ensp;
    &ensp;<a href="#демо"><kbd>&ensp;<br />&ensp;&ensp;Демо&ensp;&ensp;<br />&ensp;</kbd></a>&ensp;
</p>

## Описание

Этот репозиторий содержит мои дотфайлы которые я сам лично использую. Наверно не лучший райс потому что я не про, но по крайней мере это не какой-то фиговый Windows и к тому же хорошо подходит для эффективной работы

README сейчас доступен на двух языках:
* [`English`](README.en.md)
* [`Русский`](README.ru.md)

## Особенности

* Простота и легковесность (~900 МБ использования ОЗУ на старте)
* Плавные анимации
* Красивая цветовая палитра Catppuccin в вариации Mocha (нет, шутники, не "Моча", а "Мока")
* Модульная структура
* Полезные сочетания клавиш
* Удобный процесс установки
* Право на использование той самой фразы - "I use Arch btw" :)

## Установка

Выберите ваш предпочтительный способ установки:

* `git clone`ировать репозиторий и запустить установщик
    ```Shell
    git clone https://github.com/desyatkoff/dotfiles.git && cd dotfiles/ && bash ./install.sh
    ```
* `curl`ом запустить установщик
    ```Shell
    bash <(curl -fsSL https://raw.githubusercontent.com/desyatkoff/dotfiles/main/install.sh)
    ```

Рекомендуется перезагрузить компьютер по окончании процесса установки

## Сочетания клавиш

* `Super` + `Enter` -> Запустить Kitty
* `Super` + `E` -> Запустить Thunar
* `Super` + `B` -> Запустить Firefox
* `Super` + `Shift` + `B` -> Запустить Firefox (приватное окно)
* `Super` + `Q` -> Закрыть активное окно
* `Super` + `Shift` + `Q` -> Закрыть активное окно (принудительно)
* `Super` + `L` -> Экран блокировки
* `Super` + `F` -> Включить/Выключить плавающий режим для активного окна
* `Super` + `Shift` + `F` -> Включить/Выключить полноэкранный режим для активного окна
* `Super` + `J` -> Переключить режим разделения
* `Super` + `N` -> Включить/Выключить панель SwayNC
* `Alt` + `Tab` -> Переместиться между окнами
* `Super` + `G` -> Включить/Выключить "Игровой режим" (меньше украшалок и красивостей => больше производительности)
* `Super` + `Print Screen` -> Начать/Остановить запись экрана
* `Print Screen` -> Сделать скриншот
* `Super` + `V` -> Открыть буфер обмена
* `Super` + `Alt` + `W` -> Открыть выбиралку обоев
* `Super` + `Space` -> Запустить Rofi
* `Super` + `W` -> Включить/Выключить Waybar
* `Super` + `P` -> Запустить экранную пипетку
* `Super` + `D` -> Включить/Выключить Hydock
* `Super` + `←` / `→` / `↑` / `↓` -> Переместить фокус
* `Super` + `Shift` + `←` / `→` / `↑` / `↓` -> Переместить окно
* `Super` + `Control` + `←` / `→` / `↑` / `↓` -> Масштабировать окно
* `Super` + `1` / `2` / `3` / `4` / `5` / `6` / `7` / `8` / `9` / `0` -> Перейти в воркспейс
* `Super` + `Shift` + `1` / `2` / `3` / `4` / `5` / `6` / `7` / `8` / `9` / `0` -> Переместить активное окно в воркспейс
* `Super` + `S` -> Перейти в скрытый воркспейс
* `Super` + `Shift` + `S` -> Переместить активное окно в скрытый воркспейс
* Смотрите [`~/.config/hypr/hyprland/binds.conf`](home/.config/hypr/hyprland/binds.conf) чтобы узнать больше

## Демо

<p align="center">
    <img src="assets/demo_1.png" width="500" />
    <img src="assets/demo_2.png" width="500" />
    <img src="assets/demo_3.png" width="500" />
    <img src="assets/demo_4.png" width="500" />
    <img src="assets/demo_5.png" width="500" />
    <img src="assets/demo_6.png" width="500" />
    <img src="assets/demo_7.png" width="500" />
    <img src="assets/demo_8.png" width="500" />
    <img src="assets/demo_9.png" width="500" />
    <img src="assets/demo_10.png" width="500" />
    <img src="assets/demo_11.png" width="500" />
    <img src="assets/demo_12.png" width="500" />
    <img src="assets/demo_13.png" width="500" />
    <img src="assets/demo_14.png" width="500" />
    <img src="assets/demo_15.png" width="500" />
    <img src="assets/demo_16.png" width="500" />
    <img src="assets/demo_17.png" width="500" />
</p>
