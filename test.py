import subprocess

SWIPL_EXECUTABLE = "swipl"  
PROLOG_FILE = "variant4.pl" 

TEST_INPUTS = [
    "zero",
    "seven",
    "sixteen",
    "eighty",
    "thirty four",
    "three hundred",
    "six hundred and seventy eight",
    "one thousand",
    "one million", # Expected to fail in Prolog
    "twenty eleven"  # Expected to fail
]

def run_prolog_for_input(prolog_file, input_string_for_to_num):
   
    prolog_query_str = f"to_num(\"{input_string_for_to_num}\", N)"
    goal = (
        f"consult('{prolog_file}'), "
        f"( ({prolog_query_str}) -> writeln(N) ; writeln('Prolog: FAILED') ), "
        f"halt."
    )

    try:
        process = subprocess.run(
            [SWIPL_EXECUTABLE, "-q", "-g", goal], # -q for quiet
            capture_output=True,
            text=True,
            timeout=5
        )
        if process.stderr:
           
            print(f"Input: \"{input_string_for_to_num}\" -> Prolog Error: {process.stderr.strip()}")
        elif process.stdout:
            print(f"Input: \"{input_string_for_to_num}\" -> Output: {process.stdout.strip()}")
        else:
            print(f"Input: \"{input_string_for_to_num}\" -> No output from Prolog.")

    except FileNotFoundError:
        print(f"Input: \"{input_string_for_to_num}\" -> Error: SWI-Prolog executable '{SWIPL_EXECUTABLE}' not found.")
    except subprocess.TimeoutExpired:
        print(f"Input: \"{input_string_for_to_num}\" -> Error: Prolog query timed out.")
    except Exception as e:
        print(f"Input: \"{input_string_for_to_num}\" -> An unexpected error occurred: {e}")


def main():
    print(f"--- Testing {PROLOG_FILE} ---")

    for input_string in TEST_INPUTS:
        run_prolog_for_input(PROLOG_FILE, input_string)

    
if __name__ == "__main__":
    main()
