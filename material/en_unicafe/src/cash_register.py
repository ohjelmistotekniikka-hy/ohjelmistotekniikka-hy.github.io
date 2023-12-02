class CashRegister:
    def __init__(self):
        self.money = 100000
        self.cheap = 0
        self.yummy = 0

    def eat_cheap_with_cash(self, amount):
        if amount >= 240:
            self.money = self.money + 240
            self.cheap += 1
            return amount - 240
        else:
            return amount

    def eat_yummy_with_cash(self, amount):
        if amount >= 400:
            self.money = self.money + 400
            self.yummy += 1
            return amount - 400
        else:
            return amount

    def eat_cheap_with_card(self, card):
        if card.balance >= 240:
            card.take_money(240)
            self.cheap += 1
            return True
        else:
            return False

    def eat_yummy_with_card(self, card):
        if card.balance >= 400:
            card.take_money(400)
            self.yummy += 1
            return True
        else:
            return False

    def add_money_to_card(self, card, amount):
        if amount >= 0:
            card.add_money(amount)
            self.money += amount
        else:
            return

    def money_in_euros(self):
        return self.money / 100
