#! /bin/bash

# Setup SSH KEY
ssh-keygen -t ed25519 -N "" -C "$USER" -f "${HOME}/.ssh/id_ed25519"

# Setup Deploy Key
echo "Add the following key to the GitHub repository's deploy keys:"

cat "${HOME}/.ssh/id_ed25519.pub"

read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# Set up git user
git config --global user.email "${USER}@example.com"

git config --global user.name "${USER}"

# Set-up repo
git clone "git@github.com:artialys/snf-training.git" "${HOME}/snowflake"

cd "${HOME}/snowflake"

git switch "${USER}"

git push 