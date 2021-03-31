# CaveBan

Gra stworzona w ramach konkursu [Motorola Science Cup](https://science-cup.pl/). Napisana bazowo na platformę windows, ale jest również dostępna dla macOS oraz Linux. Do jej stworzenia użyty został silnk Godot 3.2.3

## Stack
- GDScript
- [Silent Wolf](https://silentwolf.com/)

## Wymagania

- Karta graficzna wspierająca OpenGL ES 3.0 + 5MB VRAM
- Minimum 35 MB Pamięci Ram


### Sprawdzane na

- Windows 10 Pro 20H2 (19042.804), Windows 10 Dev (21343.1000), Windows 10 Pro 1909 (18363.1440)
- macOS Big Sur 11.2.3 (20D91)
- Fedora 33.20210308.0 (Silverblue)

## Instalacja
1. Pobrać repozytorium
2. Wypakować repozytorium
3. Wejść do folderu i kliknąć prawym przyciskiem myszy na plik **project.godot**
4. Wybrać opcję otwórz za pomocą wybranego programu
5. Wybrać folder **Silnik** a w nim **Godot_v3.2.3-stable_win64**
6. Właśnie otwarty został projekt gry CaveBan

## Poruszanie się w projekcie:
W górnej części edytora projektu znajduje się panel który pozwala nam przełączać między różnymi trybami edycji. Gdy użytkownik wybierze zakładkę **Script** otworzy się jeden ze skryptów zarządzających projektem. 

Możemy się poruszać między nimi wybierając odpowiednie skrypty z lewej strony edytora. W edytorze można również poruszać się między scenami. Robi się to wybierając odpowiednie pliki z rozszerzeniem **.tscn** z systemu plików edytora w lewym dolnym rogu edytora


## Moduły  
- Folder **Silnik** zawierający silnik gry Godot 
- Folder **addons** zawiera addon [Silent Wolf](https://silentwolf.com) 
- Folder **assets** zawiera materiały jak muzyka i dźwięki, czcionki oraz textury 
-  Folder **scenes** to folder zawierający sceny, jest on podzielony na: 
--  **Autoload** - sceny i skrypty globalne potrzebne do poprawnego działania większości scen 
--  **LevelsCreator** - Komponenty takie jak przyciski używane np. w Menu czy obiekty nie wykorzystane ale przeznaczone do tworzenia poziomów w grze 
--  **LevelsDone** - Zawiera sceny z poziomami podzielonymi na poziomy trudności 
--  **MainMenu** - Zawiera on sceny takie jak wybór poziomu trudności, Leaderboard, opcje a także scenę pauzy zawierającą również skrypt zapisywania
--  **player** - zawierający scenę gracza a także jego skrypt

## Exportowanie
Aby poprawnie wyexportować projekt należy wejść w zakładkę **Edytor** w górnej części ekranu. Następnie wybrać zakładkę **Ustawienia edytora**, w tej zakładce należy wybrać zakładkę **Windows** w zakładce **Export**