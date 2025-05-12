function fish_right_prompt
    ip --brief address show eth0 | awk '{print $3}' | cut -d'/' -f1
end
