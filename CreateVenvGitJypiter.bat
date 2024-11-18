@echo off
setlocal

:: Set python path (where the installed Python executable is)
set python_path=C:\Users\user\AppData\Local\Programs\Python\Python312\

:: Set git path (where the installed Git executable is)
set git_path=C:\Program Files\Git\bin\

:: Ask for the name of the new virtual environment
set /p venv_name="Enter the name for the new virtual environment: "

:: Create the virtual environment
%python_path%python.exe -m venv %venv_name%

:: Activate the virtual environment
call %venv_name%\Scripts\activate

:: Upgrade pip
python -m pip install --upgrade pip

:: Install Jupyter Notebook and ctgan
pip install jupyter

:: Create .gitignore file with specified folders
echo # Python virtual environment folders >> %venv_name%\.gitignore
echo Include/ >> %venv_name%\.gitignore
echo Lib/ >> %venv_name%\.gitignore
echo Scripts/ >> %venv_name%\.gitignore
echo. >> %venv_name%\.gitignore
echo # Other environment-specific folders >> %venv_name%\.gitignore
echo share/ >> %venv_name%\.gitignore
echo etc/ >> %venv_name%\.gitignore
echo. >> %venv_name%\.gitignore
echo # Ignore Jupyter Notebook checkpoint files >> %venv_name%\.gitignore
echo .ipynb_checkpoints/ >> %venv_name%\.gitignore
echo. >> %venv_name%\.gitignore
echo # Ignore Python bytecode files >> %venv_name%\.gitignore
echo __pycache__/ >> %venv_name%\.gitignore
echo *.pyc >> %venv_name%\.gitignore
echo. >> %venv_name%\.gitignore
echo # Ignore system-specific files >> %venv_name%\.gitignore
echo .DS_Store >> %venv_name%\.gitignore
echo Thumbs.db >> %venv_name%\.gitignore

:: Deactivate the virtual environment
deactivate

:: Initialize a Git repository in the virtual environment directory
cd %venv_name%
"%git_path%git.exe" init

echo Virtual environment '%venv_name%' created, Jupyter Notebook installed, .gitignore created, and Git repository initialized.
pause
endlocal

:: Keep the command prompt window open
cmd /k
