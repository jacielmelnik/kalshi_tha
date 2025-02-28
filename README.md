# kalshi_tha

This project is the Take Home Assignment for Kalshi Senior Flutter Developer position.

|Enter values | Result healthy | Result average | Result unhealthy| 
|-|-|-|-|
|![image](https://github.com/user-attachments/assets/47c7503d-5bba-4fc6-9969-38ecae35c637) | ![image](https://github.com/user-attachments/assets/cd65fe6a-c4d8-4ff7-b9bc-d8d706bac84e) | ![image](https://github.com/user-attachments/assets/76d9b785-1f9a-471c-92a2-2fa03cd4165e)| ![image](https://github.com/user-attachments/assets/6a59d34d-22e0-473a-8b56-1c5884df9b57) 

It was set to be used on mobile devices, both Android and iOS.

## Overview

This project calculates the overall score for a given annual income and monthly cost. The results will be provided as healthy, average or unhealthy.

## Modules

This project includes two main modules:

- **Enter values**
- **Results**

It also includes auxiliary classes such as:

- *Formatter*: responsible for ensuring value formatting;
- *Theme Constants*: responsible for centralizing several shared constants that relate to themes and widget setup;

> __Architecture__: By splitting the project into modules we remove a lot of coupling, ensuring greater scalability. Keeping auxiliary classes can also help both in division of responsibility as well as code readability.

### Module Structure

Every module is divided in 3 main classes:

<img width="243" alt="image" src="https://github.com/user-attachments/assets/0076cd74-2109-47f6-8462-3bec7ba781b0" />

- *Screen*: responsible to present the UI and;
- *Bloc*: responsible for the business logic;
- *Constants*: responsible for Strings and other constant values;

The module also includes a folder for it's unique widgets.
>If a widget would be shared between two or more modules, it should be moved to the shared widget folder.
>
> <img width="235" alt="image" src="https://github.com/user-attachments/assets/18fffe5b-0feb-4843-a39f-f27cc84383de" />

> __Architecture__: By splitting the modules in 3 files we reduce a lot of coupling, as it helps to keep the reponsibilities of every class separeted. Following the Clean Architecture principles, the visibility of the module classes are
> **Screen > Bloc > Constants**
>
> For this project there was still no need to add Routes or Repositories, but as soon as the navigations starts to get more complex, those must be included as module class files.

---

## Enter Values

This module is responsible for handling the user input values. It contains two `EnterValueTextFields` and a "Continue" `CtaButton`.

The `TextFields` are formatted when the user types a value. The formatting includes:

- Adding a `,` to separate the values at every 3 digits;
- Removing leftmost zeros;
- Ensuring only digits can be typed;
- Ensuring only digits can be pasted;

The "Continue" button will check if the previous `TextFields` were filled before moving to the next screen. If any field is not filled, a `SnackBar` will be shown with a brief explanation and the `Focus` will shift to the proper `EnterValueTextField`.

Once the values are properly filled, the module will process them and navigate to the **Results Module**.

## Results

This module is responsible for calculating the user's score as healthy, average or unhealthy. It does so, using the given parameters `annualIncome` and `monthlyCosts`.

The `ResultsBloc` will calculate the score immediatelly after the screen is opened by multiplying the 8% tax cost with the `annualIncome` and the `monthlyCosts` by 12 (months in a year). With this data the function will divide the annual total costs by the `annualIncome` and the result will be a `ResultStatus` object.

> The `ResultStatus` object is an `enum` that represents the 3 possible scores states (healthy, average or unhealthy) and will define most of the `ResultScreen` behavior. The functions that will consume the `ResultStatus` are:
> ```dart
> _getSegmentColorForIndex(){...}
> _getCardTitleByResultStatus(){...}
> _getCardSubtitleByResultStatus(){...}
> ```

With a `ResultState` set, the `ResultScreen` will render a `ResultProgressBar` as well as the proper texts to inform the user about its financial status.

---

## Tests

This project includes a test layer that verify both module and the widget bevahior.

<img width="340" alt="image" src="https://github.com/user-attachments/assets/ed085d35-9af3-4a24-92e5-16d23a07b902" />

The test files are split, in almost every case, in two files:

- *Test File*: responsible for definig the tests steps;
- *Robot File*: responsible for executing the testing functions;

> __Architecture__: by splitting in two classes we can reuse most of the robot methods while keeping the test files readable and clean.
