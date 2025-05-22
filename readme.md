# Prolog: Turning Number Words into Digits!

Ever wanted to tell your computer "one hundred and twenty three" and have it understand `123`? This little Prolog program does just that for numbers up to "one thousand"!

## What You'll Need

* **SWI-Prolog:** This is the magic engine that runs our Prolog code. If you don't have it, you can grab it for free from [https://www.swi-prolog.org/](https://www.swi-prolog.org/).
* **Git:** You'll need Git installed to download the code from the repository. If you don't have it, you can get it from [https://git-scm.com/downloads](https://git-scm.com/downloads).

## Let's Get It Running!

Here's how you can try it out:

1.  **Get the Code (Clone the Repository):**
    * Open your computer's command line or terminal.
    * Navigate to the directory where you want to download the code.
    * Use the `git clone` command to copy the project files to your computer:
        ```bash
        git clone [https://github.com/aayushrautela/ailab7](https://github.com/aayushrautela/ailab7)
        ```
    * This will create a folder named `ailab7` containing the code. Navigate into this folder:
        ```bash
        cd ailab7
        ```

2.  **Wake Up SWI-Prolog:**
    * While you're inside the `ailab7` project folder, type `swipl` in your terminal and hit Enter.
        ```bash
        swipl
        ```
    * You should see a welcome message from SWI-Prolog and its special prompt: `?-` (This means it's ready for your commands!)

3.  **Load Your Code (Consulting):**
    * Now, at the `?-` prompt, tell Prolog to read the `variant4.pl` file.
    * Type this, making sure to use single quotes around the filename and a period at the end:
        ```prolog
        ?- consult('variant4.pl').
        ```
    * If everything goes well, Prolog will usually say `true.` or show how long it took to load.

4.  **Ask Away! (Running Queries):**
    * Great! Your code is loaded. Now you can ask it to convert words to numbers.
    * You'll use the `to_num/2` command.
        * The first part is the number in words (put it in double quotes `"`).
        * The second part is a placeholder (a variable, which in Prolog starts with a capital letter like `N` or `Result`) where Prolog will put the answer.
    * **Try these examples:**
        ```prolog
        ?- to_num("ninety nine", N).
        ```
        Prolog should tell you: `N = 99.`

        ```prolog
        ?- to_num("one hundred and one", Result).
        ```
        And you'll see: `Result = 101.`

        ```prolog
        ?- to_num("five hundred and forty eight", Value).
        ```
        You should get: `Value = 548.`

        ```prolog
        ?- to_num("one thousand", X).
        ```
        The answer: `X = 1000.`

5.  **All Done? Saying Goodbye to SWI-Prolog:**
    * When you're finished, you can close SWI-Prolog by typing `halt.` at the prompt:
        ```prolog
        ?- halt.
        ```

## Prefer VS Code? Here's a Tip!

If you like using Visual Studio Code for your coding:

1.  Make sure **SWI-Prolog** and **Git** are installed (from the steps above).
2.  **Clone the repository** as described in Step 1 of "Let's Get It Running!".
3.  Open the cloned `ailab7` folder in VS Code.
4.  In VS Code, go to Extensions and search for a **Prolog extension**. "VSC-Prolog" by Arthur Wang is a popular choice. Install it if you haven't already.
5.  Open the `variant4.pl` file from the `ailab7` folder.
6.  Use the **Command Palette** (`Ctrl+Shift+P` on Windows/Linux, `Cmd+Shift+P` on macOS) and find a command like `Prolog: load document`. This will load your file.
7.  A **Prolog terminal** should pop up inside VS Code (look in the "TERMINAL" or "OUTPUT" panel). You'll see the `?-` prompt there, and you can type your queries just like in step 4 above!

Happy converting!
