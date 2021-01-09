#!/usr/bin/env python3

import configparser
import sys
import requests
from decimal import Decimal

config = configparser.ConfigParser()

# File must be opened with utf-8 explicitly
with open('/home/foxmaccloud/.config/polybar/crypto-config', 'r', encoding='utf-8') as f:
	config.read_file(f)

# Everything except the general section
currencies = [x for x in config.sections() if x != 'general']
base_currency = config['general']['base_currency']
params = {'convert': base_currency}

user_agent = "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:71.0) Gecko/20100101 Firefox/71.0"

for currency in currencies:
        icon = config[currency]['icon']
        json = requests.get(f'https://api.coinmarketcap.com/v1/ticker/{currency}', headers={"User-Agent":user_agent, 'Accepts': 'application/json', 'X-CMC_PRO_API_KEY': 'd0f906f4-3a2e-45b3-8da3-d4f56a8cad63'}, params=params).json()[0]

#        if "Traceback (most recent call last):" in json:
#            print("Can't get connection!")
#            pass


        local_price = round(Decimal(json[f'price_{base_currency.lower()}']), 2)
        change_24 = float(json['percent_change_24h'])

        display_opt = config['general']['display']
        if display_opt == 'both' or display_opt == None:
                sys.stdout.write(f'{icon} {local_price}/{change_24:+}%  ')
        elif display_opt == 'percentage':
                sys.stdout.write(f'{icon} {change_24:+}%  ')
        elif display_opt == 'price':
                sys.stdout.write(f'{icon} {local_price}  ')
