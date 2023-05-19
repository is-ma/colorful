cat << EOF >> ~/.bashrc

### IS-MA: COLORFUL ###
source ~/.is-ma/colorful/mods/git_prompt.sh
source ~/.is-ma/colorful/mods/bash_colors.sh
source ~/.is-ma/colorful/mods/ps1.sh
EOF

# silent source
source ~/.bashrc > /dev/null 2>&1
