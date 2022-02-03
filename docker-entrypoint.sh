#!/bin/bash

# Enable strict mode:
set -euo pipefail

# Set up and load test data:
cd /usr/src/app
python ./manage.py initial_setup
python ./manage.py load_test_data

# Run web server:
python ./manage.py runserver 0.0.0.0:8000