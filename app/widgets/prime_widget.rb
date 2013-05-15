widget :prime do
  key "35d48b88f4e636eb9c575bf8e0498cbcaf949b45"
  type "number_and_secondary"
  data do
    {
      value: Purchase.
        for_purchaseable(Product.subscriptions.first).
        within_range(30.days.ago, Time.now).count,
      previous: Purchase.
        for_purchaseable(Product.subscriptions.first).
        within_range(60.days.ago, 30.days.ago).count
    }
  end
end