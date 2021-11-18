with orders as
(select * from {{ ref('stg_orders')}}),

payments as
(select * from {{ ref('stg_payments')}}),

customer_payments as
    (select 
        orders.order_id, 
        orders.customer_id,
        sum(payments.amount) as amount
      from orders
    left outer join payments using (order_id)
            where payments.status = 'success'
     group by 1,2
    )

select * from customer_payments

