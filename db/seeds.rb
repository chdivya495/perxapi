tiers = [
  {
    name: "Standard",
    threshold: 0
  },
  {
    name: "Gold",
    threshold: 1000
  },  {
    name: "Platinum",
    threshold: 5000
  }
]

tiers.each { |tier| Tier.create!(tier) }

tier = Tier.find_by(name: "Standard")

users = [
  {
    first_name: "Tom",
    last_name: "holland",
    email: "tholland@example.com",
    password: "marvel",
    country_code: "US",
    tier_id: tier.id,
    reward_points: 0,
    dob: "01/08/1994"
  },
  {
    first_name: "Robert",
    last_name: "Downey",
    email: "rdj@example.com",
    password: "marvel",
    country_code: "MX",
    tier_id: tier.id,
    reward_points: 0,
    dob: "01/01/1985"
  },
  {
    first_name: "Scarlette",
    last_name: "witch",
    email: "switch@example.com",
    password: "marvel",
    country_code: "IN",
    tier_id: tier.id,
    reward_points: 0,
    dob: "02/04/1990"
  },
  {
    first_name: "Paul",
    last_name: "Rudd",
    email: "paulrudd@example.com",
    password: "marvel",
    country_code: "FR",
    tier_id: tier.id,
    reward_points: 0,
    dob: "09/06/1987"
  },
  {
    first_name: "Tom",
    last_name: "hiddleston",
    email: "thiddleston@example.com",
    password: "marvel",
    country_code: "BR",
    tier_id: tier.id,
    reward_points: 0,
    dob: "03/05/1989"
  },
]

users.each { |user| User.create!(user) }

rewards = [
  {
    title: "Free Coffee",
    description: "Use this to get a free coffee",
    code: "FREECOFFEE"
  },
  {
    title: "5% Cash Rebate",
    description: "Use this to get 5% cash rebate",
    code: "5PERCENTCASH"
  },
  {
    title: "Free Movie",
    description: "Use this to get a free movie ticket",
    code: "FREEMOVIE"
  }
]

rewards.each { |reward| Reward.create!(reward) }