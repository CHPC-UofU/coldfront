#!/bin/bash

# Enable strict mode:
set -euo pipefail

# Set up and load test data:
cd /usr/src/app
python3 ./manage.py initial_setup
python3 ./manage.py load_test_data

# Run web server:
python ./manage.py runserver 0.0.0.0:8000