# Mastermind

Mastermind is a code-breaking game where a player tries to guess the correct code within a certain number of attempts. This implementation allows the player to either be the code maker or the code breaker.

## Requirements

- Ruby 2.5 or higher

## Installation

Clone the repository and navigate to the project directory:

git clone https://github.com/<your-username>/mastermind.git
cd mastermind

## Running the game

To start the game, run the following command in the terminal:

ruby mastermind.rb

Follow the on-screen instructions to select whether you want to be the code maker or the code breaker.

### Code maker

As the code maker, you will be prompted to input a 4-digit code using numbers between 1 and 6. The computer will then attempt to guess the code within 12 attempts.

### Code breaker

As the code breaker, you will be prompted to input a 4-digit guess using numbers between 1 and 6. You will also have 12 attempts to guess the correct code. The game will provide a hint with each guess, showing an 'o' for each correct digit in the correct position and an 'x' for each correct digit in the incorrect position.

## Gameplay

The game will continue until either the code is successfully guessed or the maximum number of attempts is reached. If the code is successfully guessed, a congratulatory message will be displayed. If the code is not successfully guessed, the correct code will be revealed.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Credits

This project is part of the [Odin Project](https://www.theodinproject.com/), a comprehensive curriculum for learning web development.
