# dating

date calculation tool

**dating** is a computational tool for date-related data.

## features

> [!NOTE]
> this project is bare-bones, and considered finished. there are no further updates in plan.

- easy to use command line interface
- change the present date to aid with your calculations
- get days since a specific date
- get the date before/after an amount of days

## how to use

> [!WARNING]
> the release only offers an executable compiled for Ubuntu. if you are not on the same distro or operating system, please refer to the [compiling it yourself](#compiling-it-yourself) guide.

1. go to [releases](https://github.com/theluqmn/dating/releases/latest), download the latest release.
2. navigate to the directory of the executable and simply run `./main`.

### compiling it yourself

the following are the steps for Ubuntu.

1. install `gnucobol` using your package manager (download gnucobol).
2. clone this repository.
3. run `cobc src/main.cbl` in the project directory.
4. run `./main` to run the program.

## how this works

this is a simple CLI-based date calculator. you can change the current date to help out with the computation.

## to-do

- [x] figure out the objective and scope
- [x] basic cobol config
- [x] setup for date handling
- [x] CLI handler
- [x] set a date as present (default: current date)
- [x] calculate the date for # days in the future and past
- [x] calculate the # days since the present day

## extras

previously, i started [doos](https://github.com/theluqmn/doos) - a to-do list manager, to learn how to work with dates. after a while, i realise that its somewhat too complex for the sole objective, hence i moved to this project instead. i intended this to be a simple, one-night thing (i did the calculation things next morning).

this project is licensed under the [MIT license](https://github.com/theluqmn/dating/blob/main/LICENSE).
