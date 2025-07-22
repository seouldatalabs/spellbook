{% set blockchain = 'tac' %}

{{ config(
    schema = 'prices_' + blockchain,
    alias = 'tokens',
    materialized = 'table',
    file_format = 'delta',
    tags = ['static']
    )
}}

SELECT
    token_id
    , '{{ blockchain }}' as blockchain
    , symbol
    , contract_address
    , decimals
FROM
(
    VALUES
    ('tac-tac-protocol', 'TAC', 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee, 18)
    , ('cbbtc-coinbase-wrapped-btc', 'cbBTC', 0x7048c9e4aBD0cf0219E95a17A8C6908dfC4f0Ee4, 8)
    , ('toncoin-the-open-network', 'TON', 0xb76d91340F5CE3577f0a056D29f6e3Eb4E88B140, 9)
    , ('usdt-tether', 'USDT', 0xAF988C3f7CB2AceAbB15f96b19388a259b6C438f, 6)
    , ('weth-weth', 'WETH', 0x61D66bC21fED820938021B06e9b2291f3FB91945, 18)
    , ('lbtc-lombard-staked-btc', 'LTBC', 0xecAc9C5F704e954931349Da37F60E39f515c11c1, 8)
) as temp (token_id, symbol, contract_address, decimals) 
