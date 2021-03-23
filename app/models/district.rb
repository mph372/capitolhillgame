class District < ApplicationRecord
  belongs_to :state, optional: true
  belongs_to :congress
  belongs_to :politician, optional: true

  def generate_pvi
    random = rand(0.000000000000..1.000000000000)
    if random.between?(0,0.002298850575)
      raw_pvi = rand(-44...-41)
    elsif random.between?(0.002298850575,0.009195402299)
      raw_pvi = rand(-40..-37)
    elsif random.between?(0.009195402299,0.02528735632)
      raw_pvi = rand(-36..-33)
    elsif random.between?(0.02528735632,0.05057471264)
      raw_pvi = rand(-32..-29)
    elsif random.between?(0.05057471264,0.07816091954)
      raw_pvi = rand(-28..-25)
    elsif random.between?(0.07816091954,0.1126436782)
      raw_pvi = rand(-24..-21)
    elsif random.between?(0.1126436782,0.1517241379)
      raw_pvi = rand(-20..-17)
    elsif random.between?(0.1517241379,0.2045977011)
      raw_pvi = rand(-16..-13)
    elsif random.between?(0.2045977011,0.2551724138)
      raw_pvi = rand(-12..-9)
    elsif random.between?(0.2551724138,0.3218390805)
      raw_pvi = rand(-8..-5)
    elsif random.between?(0.3218390805,0.4022988506)
      raw_pvi = rand(-4..-1)
    elsif random.between?(0.4022988506,0.4597701149)
      raw_pvi = rand(0..3)
    elsif random.between?(0.4597701149,0.5425287356)
      raw_pvi = rand(4..7)
    elsif random.between?(0.5425287356, 0.6413793103)
      raw_pvi = rand(8..11)
    elsif random.between?(0.6413793103,0.7540229885)
      raw_pvi = rand(12..15)
    elsif random.between?(0.7540229885,0.8482758621)
      raw_pvi = rand(16..19)
    elsif random.between?(0.8482758621,0.9264367816)
      raw_pvi = rand(20..23)
    elsif random.between?(0.9264367816,0.9586206897)
      raw_pvi = rand(24..27)
    elsif random.between?(0.9586206897,0.9885057471)
      raw_pvi = rand(28..31)
    elsif random.between?(0.9885057471,0.9977011494)
      raw_pvi = rand(32..35)
    else raw_pvi = 36
    end
    update_attribute(:pvi, raw_pvi)
  end

  def generate_density
    if pvi <= -28
      random = rand(0.00..1.00)
      if random.between?(0,0.09)
        density = rand(190.0..1000.0)
      elsif random.between?(0.10,0.50)
        density = rand(1001.0..10000.0)
      elsif random.between?(0.51,0.76)
        density = rand(10001.0..20000.0)
      elsif random.between?(0.77,0.85)
        density = rand(20001.0..40000.0)
      else 
        density = rand(400001.0..80000.0)
      end
    elsif pvi.between?(-27,-12)
      random = rand(0.00..1.00)
      if random.between?(0,0.09)
        density = rand(44.0..100.0)
      elsif random.between?(0.10,0.30)
        density = rand(100.1..1000.0)
      elsif random.between?(0.31,0.78)
        density = rand(1000.1..5000)
      elsif random.between?(0.79,0.95)
        density = rand(5000.1..10000.0)
      else
        density = rand(10000.1..25000.0)
      end
    elsif pvi.between?(-11,3)
      random = rand(0.00..1.00)
      if random.between?(0,0.14)
        density = rand(12.0..100.0)
      elsif random.between?(0.15,0.44)
        density = rand(100.1..500.0)
      elsif random.between?(0.45,0.64)
        density = rand(500.1..1000.0)
      else
        density = rand(1000.1..5000)
      end
    elsif pvi.between?(4,19)
      random = rand(0.00..1.00)
      if random.between?(0,0.02)
        density = rand(1.0..10.0)
      elsif random.between?(0.03,0.32)
        density = rand(10.1..100.0)
      elsif random.between?(0.33,0.58)
        density = rand(100.1..200.0)
      elsif random.between?(0.59,0.79)
        density = rand(200.1..500.0)
      elsif random.between?(0.80,0.88)
        density = rand(500.1..1000.1)
      elsif random.between?(0.89,0.95)
        density = rand(1000.1..2000.1)
      else
        density = rand(2000.0..5000.0)
      end
    else
      random = rand(0.00..1.00)
      if random.between?(0,0.62)
        density = rand(1.0..100.0)
      elsif random.between?(0.63,0.92)
        density = rand(100.1..200.0)
      else
        density = rand(200.1..1000)
      end
    end
    update_attribute(:pop_per_sq_mile, density)
  end

  def pop_density_revise
    if pop_per_sq_mile == nil 
      generate_density 
    end
  end

  def true_pvi
    if pvi > 0
      "R+#{pvi}"
    elsif pvi < 0
      "D+#{pvi*-1}"
    elsif pvi == 0
      "EVEN"
    end
  end

  def district_display
    if state.districts.count == 1
      "At Large"
    else
      district_number
    end
  end

  def generate_population
    random = rand(0.00..1.00)
    if random.between?(0.00,0.04)
      population = rand(629295..679295)
    elsif random.between?(0.05,0.35)
      population = rand(679296..729295)
    elsif random.between?(0.36,0.71)
      population = rand(729296..779295)
    elsif random.between?(0.72,0.91)
      population = rand(779296..829295)
    else 
      population = rand(829296..929295)
    end
    update_attribute(:population, population)
  end

end
