# Prolog: Convert Words to Numbers (Variant 4)

This Prolog program converts English words representing a number (up to "one thousand") into its numerical digit form. For example, it converts "one hundred and twenty three" to `123`.

## Prerequisites

* **SWI-Prolog:** You need to have SWI-Prolog installed on your system. You can download it from [https://www.swi-prolog.org/](https://www.swi-prolog.org/).

## How to Run

1.  **Save the Code:**
    * Save the Prolog code (provided for Variant 4) into a file named `variant4.pl` (or any other name with a `.pl` extension).

2.  **Open SWI-Prolog:**
    * Open your system's terminal or command prompt.
    * Start SWI-Prolog by typing `swipl` and pressing Enter.
        ```bash
        swipl
        ```
    * You should see the SWI-Prolog welcome message and prompt: `?-`

3.  **Navigate to Directory (if needed):**
    * If you didn't start SWI-Prolog from the directory where you saved `variant4.pl`, you'll need to navigate to it. Use the `working_directory/2` predicate. For example, if your file is in `C:\my_prolog_files` on Windows or `/home/user/prolog_files` on Linux:
        ```prolog
        ?- working_directory(_, 'C:/my_prolog_files'). % Windows (use forward slashes)
        % or
        ?- working_directory(_, '/home/user/prolog_files'). % Linux/macOS
        ```

4.  **Consult (Load) the File:**
    * At the Prolog prompt (`?-`), load your Prolog file using the `consult/1` predicate. Make sure to include the single quotes around the filename and the period at the end:
        ```prolog
        ?- consult('variant4.pl').
        ```
    * If successful, Prolog will typically respond with `true.` or show the compilation time.

5.  **Run Queries:**
    * Once the file is loaded, you can query the `to_num/2` predicate.
    * The first argument is the number in words (as a string in double quotes).
    * The second argument is a variable (starting with an uppercase letter) that will hold the numerical result.
    * **Examples:**
        ```prolog
        ?- to_num("ninety nine", N).
        ```
        Expected output: `N = 99.`

        ```prolog
        ?- to_num("one hundred and one", Result).
        ```
        Expected output: `Result = 101.`

        ```prolog
        ?- to_num("five hundred and forty eight", Value).
        ```
        Expected output: `Value = 548.`

        ```prolog
        ?- to_num("one thousand", X).
        ```
        Expected output: `X = 1000.`

6.  **Exiting SWI-Prolog:**
    * To exit SWI-Prolog, type `halt.` at the prompt:
        ```prolog
        ?- halt.
        ```

## Using with VS Code (Recommended for Development)

1.  **Install SWI-Prolog.**
2.  **Install a Prolog Extension in VS Code:**
    * Search for and install an extension like "VSC-Prolog" by Arthur Wang from the VS Code marketplace.
3.  **Open your `.pl` file in VS Code.**
4.  **Load the Document:**
    * Use the command palette (`Ctrl+Shift+P` or `Cmd+Shift+P`) and type `Prolog: load document`.
5.  **Query:**
    * A Prolog terminal should open within VS Code (usually in the "TERMINAL" or "OUTPUT" panel) showing the `?-` prompt.
    * Enter your queries directly there as shown in step 5 above.

