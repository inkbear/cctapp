# Developer Notes on CCT Instrument

## CCT Configuration

The CCT that is served by the CCTApp framework needs to neet the requirements of the instrument. This docuemntation specifies those requirements.

### Outline

* Training phase consisting of four trials
* Test phase consisting of 41 trials
* Reliability phase consisting of 14 trials
* The option of presenting these trials in the same orientation or opposite orientation from their presentation in the testing phase

## Test Configuration

* All trials consist of pairs of photographs presented simultaneously at left and right center screen
* Each image is accompanied by an auditory reinforcer repeating the lexicon in infant directed speech followed by an associated sound

## Data Recording

* Data is saved from the CCT instrument back to the CCTApp database as testing proceeds to allow collection of partially completed tests.
* Comma-delimited or Excel output may be exported from the CCTApp.
* Each pair of photographs (each trial) will be associated with a single variable in the data collection (and output file).
* Data collection is more detailed than the original CCT with the following variables and coding:

<br><table>
<tr><th> Touch </th><th> Var_button_pressed </th><th> Var: correct </th><th> Var: trial_part </th><th> Var: target </th><th> Var: distractor </th><th> Var: time_elapsed </th></tr>
</td><td> Correct </td><td> 1 (left) or 2 (right) </td><td> 1 </td><td> train or test or rel </td><td> label of target </td><td> label of distractor </td><td> ms between load and touch </td></tr>
</td><td> Incorrect </td><td> 1 (left) or 2 (right) </td><td> 0 </td><td> train or test or rel </td><td> label of target </td><td> label of distractor </td><td> ms between load and touch </td></tr>
</td><td> Terminated </td><td> 0 (none) </td><td> 0 </td><td> train or test or rel </td><td> label of target </td><td> label of distractor </td><td> ms between load and timeout </td></tr>
</table>
<br>

## Differences From the Original CCT

In the original CCT double-clicking / double-touching the invisible button at the bottom left corner of the screen at any time during testing produces an “EXIT PROGRAM?” dialog box with three buttons: REPEAT, EXIT, and CANCEL. In the CCTApp the CCT indow may be closed to EXIT/CANCEL. A repeat may be done by refreshing the window or re-opening the link. Incomplete tests have data collected and are noted as incomplete.

The coding is desribed above int he Data Recording section with the original coding as:

* A touch to any area designated as the “target” will be coded as “1”.
* A touch to the foil (distractor) will be coded as “0”.
* If a trial is terminated (timed out) and no touch (0 or 1) is recorded, the trial is coded as missing “.”

## Test Flow
The experiment run from the CCTApp does not have an experimentor to guide the session so those prompts have been incorporated in the following flow. All text and audio prompts are int he language of the instrument.

1. Parent opens link and directs childs attention to the screen as per other instructions.
1. The screen displays "Touch Anywhere to Start".
1. Parent touchs the screen and the training phase starts. 
    1. A pair of images are loaded on the screen.
    1. An audio prompt states "Where's the [target_name]? Touch the [target_name]" (e.g. “Where’s the shoe?  Touch the shoe.”).
    1. The timer is started for the trial.
    1. The child may touch the target, the distractor or nothing until the timeout period ends.
        1. If the child touches the target a reinforcement audio is played and the app records the data and moves to the next trail or phase.
        1. If the child touches the distractor the app records the data and moves to the next trial or phase.
            1. The app removes the distractor from the screen.
            1. An audio prompt states "Actually, this is the [target_name]".
            1. The app records the data and moves to the next trial or phase.
        1. If the child does not make a selection and the timeout occurs:
            1. The app removes the distractor from the screen.
            1. An audio prompt states "Here is the [target_name]".
            1. The app records the data and moves to the next trial or phase.
    1. The trials are repeated until the phase ends and the new phase or ending is reached.
1. After the last training trial the test phase displays "Touch Anywhere to Start".
1.1 trials are presented in the same manner as for the training phase above.
1. After the last test trial the reliablity phase displays "Touch Anywhere to Start".
1.1 trials are presented in the same manner as for the training phase above using the trails from the test phase in reversed poistions.
1. At the end of all phases the screen displays "The end. You may close this window".

## Open Items

* If the child accidentally bumps the screen or touches the screen before looking at the images (start over?)

