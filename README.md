# covid_tracker

A new Flutter project.

This app uses the available API endpoints for Covid-19 Data India.

For Covid-19 cases in India:
- https://api.rootnet.in/covid19-in/stats/latest

For Covid-19 Vaccination data in India:
- National Latest: https://india-covid19vaccine.github.io/api/national_latest.json
- State-wise latest: https://india-covid19vaccine.github.io/api/state_latest.json

## Files & Folder Structure

### Assets

- assets
- - fonts
- - images

### lib (Dart files)

- lib
- - pages
- - - faq-page.dart
- - - state-statistics-page.dart
- - - state-vaccines-stats-page.dart
- - panels
- - - country-wide-panel.dart
- - - country-wide-vaccination-panel.dart
- - - info-panel.dart
- data-source.dart
- home.dart
- main.dart

main.dart
: It contains the main method and is the starting poin of the application.

home.dart
: Contains the scaffold widget and is statefull with all other important widgets to be added here.

data-source.dart
: Contains the static data like quote, color and faq questions.

faq-page.dart
: Contains listview of the faq questions and answers.

state-statistics-page.dart
: Displays the page with state-wise covid-19 cases data.

state-vaccines-stats-page.dart
: Displays the page with state-wise covid-19 vaccinations data.

country-wide-panel.dart
: Displays a panel in home screen containing all India covid cases.

country-wide-vaccination-panel.dart
: Displays a panel in home screen containing all India covid vaccinations.

info-panel.dart
: Contains link to FAQs, Donations and Myth Buster pages.
