# ModelingNavySystems

## Frontend (React)

### Prerequisites
- Node.js: can be installed [here](https://nodejs.org/en)

### run the app
Make sure you are in the Views folder, can be achieved using
```
cd Views
```

First time running, make sure you have the node modules installed
```
npm i
```

<hr>

To run the actual app:
```
npm run dev
```

Login credentials:
- Username: example
- Password: 123456

## Backend (Django)

Please watch [this video](https://www.youtube.com/watch?v=t-uAgI-AUxc&t=260s) to understand how django rest framework works.
### Prerequisites
<hr>

Python: can be installed [here](https://www.python.org/downloads/)
<hr>
STRONGLY RECOMMENDED: Use a virtual environment to install the required packages. You can install it by running the following command (note, for macbook, you may need to use `python3` instead of `python`):

```
python -m venv env
```
Wait for the environment to be created, then activate it by running the following command:

On Mac:
```
source env/bin/activate
```

On Windows:
```
.\env\Scripts\activate
```
<hr>

After you have activated the virtual environment, you should see `(env)` in the terminal.
<hr>

Install the required packages by running the following command:
```
pip install -r requirements.txt
```
<hr>

Make sure you are in the Services folder, can be achieved using
```
cd Services
```

Run the server by running the following command:
```
python manage.py runserver
```
<hr>

Making migrations (every time you change the models):
```
python manage.py makemigrations
python manage.py migrate
```
<hr>
