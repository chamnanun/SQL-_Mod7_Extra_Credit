# SQL-_Mod7_Extra_Credit
Extra Credit Module 7_SQL

## Resources Used For Homework

ASK BCS was engaged twice during this assignment.  BCS assisted only with the following two codes:

    1. SQL: Join 
        SELECT h.id, h.name, COUNT (h.id) AS "Number of Transactions < $2.00"
        FROM transaction AS t
        JOIN credit_card AS cc
        ON cc.card = t.card
        JOIN card_holder AS h
        ON h.id = cc.cardholder_id
        WHERE t.amount < 2.00
        GROUP BY h.id
        ORDER BY COUNT(*) DESC;

    2. Python: Loop to hange the numeric month to month names
        # Define a dictionary to map numeric months to month names
        month_names = {
            1: 'January',
            2: 'February',
            3: 'March',
            4: 'April',
            5: 'May',
            6: 'June',
            7: 'July',
            8: 'August',
            9: 'September',
            10: 'October',
            11: 'November',
            12: 'December'
        }

        # Loop through the DataFrame and replace numeric months with month names
        fraud25_df['date'] = fraud25_df['date'].dt.strftime('%Y-%m-%d')  

        # Convert date to string first
        fraud25_df['month_name'] = fraud25_df['date'].str.split('-', expand=True)[1].astype(int).map(month_names)
        print(fraud25_df)




