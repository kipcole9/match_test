#! /bin/bash
# Works correctly
echo "Installing Elixir 1.14 and OTP 25"
asdf install erlang 25.3.2
asdf install elixir 1.14.4-otp-25

asdf local erlang 25.3.2
asdf local elixir 1.14.4-otp-25
echo "Running tests on Elixir 1.14 and OTP 25"
elixir -r lib/matchtest.ex -e Matchtest.test

# Fails
echo " "
echo "Installing Elixir 1.14 and OTP 26"
asdf install erlang 26.0
asdf install elixir 1.14.4-otp-26

asdf local erlang 26.0
asdf local elixir 1.14.4-otp-26
echo "Running tests on Elixir 1.14 and OTP 26"
elixir -r lib/matchtest.ex -e Matchtest.test
