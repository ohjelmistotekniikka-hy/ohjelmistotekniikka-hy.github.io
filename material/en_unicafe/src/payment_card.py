class PaymentCard:
    def __init__(self, balance):
        # balance is in cents
        self.balance = balance

    def add_money(self, amount):
        self.balance += amount

    def take_money(self, amount):
        if self.balance < amount:
            return False

        self.balance = self.balance - amount
        return True

    def balance_in_euros(self):
        return self.balance / 100

    def __str__(self):
        balance_euros = round(self.balance / 100, 2)

        return "The card has {:0.2f} euros on it".format(balance_euros)
