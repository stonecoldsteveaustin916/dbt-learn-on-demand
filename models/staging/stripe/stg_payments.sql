
with payments as (
    select 
        id as payment_id,
        orderid as order_id,
        paymentmethod,
        status,
        --amount/100 as amount,
        {{ cents_to_dollars('amount','3') }} as amount,
        created,
        _batched_at
    --from raw.stripe.payment
    from {{ source('stripe', 'payment') }}
)

select * from payments