create table vat (
  start_date  date        not null,
  end_date    date        not null,
  rate        decimal(3,1)not null,
  period for validity(start_date, end_date),
  primary key (validity without overlaps)
);


select * from
invoices  join
vat on vat.validity contains invoices.invoice_date;
