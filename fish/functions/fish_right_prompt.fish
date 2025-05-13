function fish_right_prompt
    set -l my_card
    if ip --brief address show eth0 &>/dev/null
        # Home
        set my_card eth0
    else if ip --brief address show enp3s0 &>/dev/null
        # Work
        set my_card enp3s0
    end

    ip --brief address show $my_card | awk '{print $3}' | cut -d/ -f1
end
