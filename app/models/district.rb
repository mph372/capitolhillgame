class District < ApplicationRecord
  belongs_to :state, optional: true
  belongs_to :congress
  belongs_to :politician, optional: true

  def generate_pvi
    random = rand(0.000000000000..1.000000000000).round(3)
    if random.between?(0,0.002)
      raw_pvi = rand(-44...-41)
    elsif random.between?(0.002,0.009)
      raw_pvi = rand(-40..-37)
    elsif random.between?(0.009,0.025)
      raw_pvi = rand(-36..-33)
    elsif random.between?(0.025,0.050)
      raw_pvi = rand(-32..-29)
    elsif random.between?(0.050,0.078)
      raw_pvi = rand(-28..-25)
    elsif random.between?(0.078,0.112)
      raw_pvi = rand(-24..-21)
    elsif random.between?(0.112,0.151)
      raw_pvi = rand(-20..-17)
    elsif random.between?(0.151,0.204)
      raw_pvi = rand(-16..-13)
    elsif random.between?(0.204,0.255)
      raw_pvi = rand(-12..-9)
    elsif random.between?(0.255,0.321)
      raw_pvi = rand(-8..-5)
    elsif random.between?(0.321,0.402)
      raw_pvi = rand(-4..-1)
    elsif random.between?(0.402,0.459)
      raw_pvi = rand(0..3)
    elsif random.between?(0.459,0.542)
      raw_pvi = rand(4..7)
    elsif random.between?(0.542, 0.641)
      raw_pvi = rand(8..11)
    elsif random.between?(0.641,0.754)
      raw_pvi = rand(12..15)
    elsif random.between?(0.754,0.848)
      raw_pvi = rand(16..19)
    elsif random.between?(0.848,0.926)
      raw_pvi = rand(20..23)
    elsif random.between?(0.926,0.958)
      raw_pvi = rand(24..27)
    elsif random.between?(0.958,0.988)
      raw_pvi = rand(28..31)
    elsif random.between?(0.988,0.997)
      raw_pvi = rand(32..35)
    else raw_pvi = 36
    end
    update_attribute(:pvi, raw_pvi)
  end

  def generate_density
    while pop_per_sq_mile.nil? do
    random = rand(0.00..1.00).round(2)
    if pvi.between?(-44,-28)
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

  def generate_geography_type
    if pop_per_sq_mile < 75
      geography_type = "Rural"
    elsif pop_per_sq_mile.between?(75,1800)
      geography_type = "Suburban"
    elsif pop_per_sq_mile > 1800
      geography_type = "Urban"
    end
    update_attribute(:geography_type, geography_type)
  end

    def generate_white_population
      random = rand(0.00..1.00).round(2)
      if pvi.between?(-44,-28)
        white = rand(15.31..50.18)
      elsif pvi.between?(-27,-12)
        if random.between?(0.00,0.03)
          white = rand(0.00..27.25)
        elsif random.between?(0.04,0.19)
          white = rand(27.26..42.25)
        elsif random.between?(0.20,0.49)
          white = rand(42.26..57.25)
        elsif random.between?(0.50,0.79)
          white = rand(57.26..72.25)
        elsif random.between?(0.8,1.0)
          white = rand(72.76..87.25)
        end
      elsif pvi.between?(-11,19)
        if random.between?(0.00,0.06)
          white = rand(50.00..60.00)
        elsif random.between?(0.07,0.27)
          white = rand(60.01..70.00)
        elsif random.between?(0.28,0.64)
          white = rand(70.01..80.00)
        elsif random.between?(0.65,0.93)
          white = rand(80.01..90.00)
        else
          white = rand(90.00..93.00)
        end
      elsif pvi >= 20
        if random.between?(0.00,0.08)
          white = rand(65.00..75.00)
        elsif random.between?(0.09,0.45)
          white = rand(75.01..85.00)
        elsif random.between?(0.46,0.95)
          white = rand(85.01..95.00)
        else 
          white = rand(95.01..96.43)
        end
      end
      @ethnicities.push(white)
    end
  
    def generate_latino_population
      random = rand(0.00..1.00).round(2)
      if pvi.between?(-44,-28)
        if random.between?(0,0.235294117647059) 
          latino = rand(10.00..20) 
        elsif random.between?(0.235294117647059,0.470588235294118) 
          latino = rand(20.00..30) 
        elsif random.between?(0.470588235294118,0.588235294117647) 
          latino = rand(30.00..40) 
        elsif random.between?(0.588235294117647,0.647058823529412) 
          latino = rand(40.00..50) 
        elsif random.between?(0.647058823529412,0.794117647058824) 
          latino = rand(50.00..60) 
        elsif random.between?(0.794117647058824,0.852941176470588) 
          latino = rand(60.00..70) 
        elsif random.between?(0.852941176470588,0.941176470588235) 
          latino = rand(70.00..80) 
        elsif random.between?(0.941176470588235,1.00) 
          latino = rand(80.00..90) 
        end
      elsif pvi.between?(-27,-12)
        if random.between?(0,0.246753246753247) 
          latino = rand(2.00..10)
        elsif random.between?(0.246753246753247,0.584415584415584) 
          latino = rand(10.00..20)
        elsif random.between?(0.584415584415584,0.74025974025974) 
          latino = rand(20.00..30)
        elsif random.between?(0.74025974025974,0.779220779220779) 
          latino = rand(30.00...40)
        elsif random.between?(0.779220779220779,0.818181818181818) 
          latino = rand(40.00..50)
        elsif random.between?(0.818181818181818,0.844155844155844) 
          latino = rand(50.00..60)
        elsif random.between?(0.844155844155844,0.948051948051948) 
          latino = rand(60.00..70)
        elsif random.between?(0.948051948051948,1.00) 
          latino = rand(70.00..80)
        end
      elsif pvi.between?(-11,3)  
        if random.between?(0,0.342105263157895) 
          latino = rand(1.50..10)
        elsif random.between?(0.342105263157895,0.596491228070176) 
          latino = rand(10.00..20)
        elsif random.between?(0.596491228070176,0.780701754385965) 
          latino = rand(20.00..30)
        elsif random.between?(0.780701754385965,0.842105263157895) 
          latino = rand(30.00...40)
        elsif random.between?(0.842105263157895,0.903508771929825) 
          latino = rand(40.00..50)
        elsif random.between?(0.903508771929825,0.921052631578947) 
          latino = rand(50.00..60)
        elsif random.between?(0.921052631578947,0.947368421052632) 
          latino = rand(60.00..70)
        elsif random.between?(0.947368421052632,1.00) 
          latino = rand(70.00..80)
        end
      elsif pvi.between?(4,19)    
        if random.between?(0,0.593023255813954) 
          latino = rand(1.22..10)
        elsif random.between?(0.593023255813954,0.825581395348837) 
          latino = rand(10.00..20)
        elsif random.between?(0.825581395348837,0.918604651162791) 
          latino = rand(20.00..30)
        elsif random.between?(0.918604651162791,0.959302325581395) 
          latino = rand(30.00...40)
        elsif random.between?(0.959302325581395,0.976744186046512) 
          latino = rand(40.00..50)
        elsif random.between?(0.976744186046512,0.994186046511628) 
          latino = rand(50.00..60)
        elsif random.between?(0.994186046511628,0.994186046511628) 
          latino = rand(60.00..70)
        elsif random.between?(0.994186046511628,1) 
          latino = rand(70.00..80)
        end
      elsif pvi >= 20
        if random.between?(0,0.552631578947369) 
          latino = rand(1.00..10)
        elsif random.between?(0.552631578947369,0.842105263157895) 
          latino = rand(10.00..20)
        elsif random.between?(0.842105263157895,1) 
          latino = rand(20.00..30)
        end
      end
      @ethnicities.push(latino)
    end
  
    def generate_black_population
      random = rand(0.00..1.00).round(2)
      if pvi.between?(-44,-28)
        if random.between?(0,0.205882352941176) 
          black = rand(4.02..10)
        elsif random.between?(0.205882352941176,0.323529411764706) 
          black = rand(10.00..20)
        elsif random.between?(0.323529411764706,0.441176470588235) 
          black = rand(20.00..30)
        elsif random.between?(0.441176470588235,0.470588235294118) 
          black = rand(30.00..40)
        elsif random.between?(0.470588235294118,0.676470588235294) 
          black = rand(40.00..50)
        elsif random.between?(0.676470588235294,1) 
          black = rand(50.00..60)
        end
      elsif pvi.between?(-27,-12)
        if random.between?(0,0.506493506493506) 
          black = rand(1.4..10)
        elsif random.between?(0.506493506493506,0.727272727272727) 
          black = rand(10.00..20)
        elsif random.between?(0.727272727272727,0.779220779220779) 
          black = rand(20.00..30)
        elsif random.between?(0.779220779220779,0.857142857142857) 
          black = rand(30.00..40)
        elsif random.between?(0.857142857142857,0.896103896103896) 
          black = rand(40.00..50)
        elsif random.between?(0.896103896103896,0.935064935064935) 
          black = rand(50.00..60)
        elsif random.between?(0.935064935064935,1) 
          black = rand(60.00..70)
        end
      elsif pvi.between?(-11,3)  
        if random.between?(0,0.649122807017544) 
          black = rand(0.88..10)
        elsif random.between?(0.649122807017544,0.921052631578947) 
          black = rand(10.00..20)
        elsif random.between?(0.921052631578947,0.964912280701754) 
          black = rand(20.00..30)
        elsif random.between?(0.964912280701754,0.982456140350877) 
          black = rand(30.00..40)
        elsif random.between?(0.982456140350877,1) 
          black = rand(40.00..50)
        end
      elsif pvi.between?(4,19)  
        if random.between?(0,0.633720930232558) 
          black = rand(0.58..10)
        elsif random.between?(0.633720930232558,0.866279069767442) 
          black = rand(10.00..20)
        elsif random.between?(0.866279069767442,0.959302325581395) 
          black = rand(20.00..30)
        elsif random.between?(0.959302325581395,1) 
          black = rand(30.00..40)
        end
      elsif pvi >= 20
        if random.between?(0,0.815789473684211) 
          black = rand(0.70..10)
        elsif random.between?(0.815789473684211,0.947368421052632) 
          black = rand(10..20)
        elsif random.between?(0.947368421052632,1) 
          black = rand(20..30)
        end
      end
      @ethnicities.push(black)
    end
  
    def generate_asian_population
      random = rand(0.00..1.00).round(2)
      if pvi.between?(-44,-28)
        if random.between?(0,0.676470588235294) 
          asian = rand(0.70..10)
        elsif random.between?(0.676470588235294,0.911764705882353) 
          asian = rand(10..20)
        elsif random.between?(0.911764705882353,0.970588235294118) 
          asian = rand(20..30)
        elsif random.between?(0.970588235294118,1) 
          asian = rand(30..32)
        end
      elsif pvi.between?(-27,-12)
        if random.between?(0,0.623376623376623) 
          asian = rand(0.52..10)
        elsif random.between?(0.623376623376623,0.857142857142857) 
          asian = rand(10..20)
        elsif random.between?(0.857142857142857,0.909090909090909) 
          asian = rand(20..30)
        elsif random.between?(0.909090909090909,0.961038961038961) 
          asian = rand(30..40)
        elsif random.between?(0.961038961038961,0.974025974025974) 
          asian = rand(40..50)
        elsif random.between?(0.974025974025974,1) 
          asian = rand(50..55)
        end
      elsif pvi.between?(-11,3)  
        if random.between?(0,0.842105263157895) 
          asian = rand(0.47..10)
        elsif random.between?(0.842105263157895,0.973684210526316) 
          asian = rand(10..20)
        elsif random.between?(0.973684210526316,0.991228070175439) 
          asian = rand(20..30)
        elsif random.between?(0.991228070175439,1) 
          asian = rand(30..32)
        end
      elsif pvi.between?(4,19)  
        if random.between?(0,0.953488372093023) 
          asian = rand(0.48..10)
        elsif random.between?(0.953488372093023,1) 
          asian = rand(10..20)
        end
      elsif pvi >= 20
        if random.between?(0,0.815789473684211) 
          asian = rand(0.70..10)
        elsif random.between?(0.815789473684211,0.947368421052632) 
          asian = rand(10..20)
        elsif random.between?(0.947368421052632,1) 
          asian = rand(20..30)
        end
      end
      @ethnicities.push(asian)
    end

    def generate_other_ethnicities
      random = rand(0.00..1.00).round(2)
      if pvi.between?(-44,-28)
       other = rand(5.00..15.00)
      elsif pvi.between?(-27,-12)
        other = rand(2.50..10)
      elsif pvi.between?(-11,3)  
        other = rand(2.00..6.00)
      elsif pvi.between?(4,19)  
        other = rand(1.00..4.00)
      elsif pvi >= 20
        other = rand(0.50..3.00)
      end
      @ethnicities.push(other)      
    end
  
  def generate_ethnicities
    @ethnicities = []
    generate_white_population
    generate_latino_population
    generate_black_population
    generate_asian_population
    generate_other_ethnicities

    ethnicities_sum = @ethnicities.inject(:+)

    white = (@ethnicities[0] / ethnicities_sum * 100) 
    latino = (@ethnicities[1] / ethnicities_sum * 100) 
    black = (@ethnicities[2] / ethnicities_sum * 100) 
    asian = (@ethnicities[3] / ethnicities_sum * 100) 
    other = (@ethnicities[4] / ethnicities_sum * 100) 

    update_attribute(:white_population, white)
    update_attribute(:latino_population, latino)
    update_attribute(:black_population, black)
    update_attribute(:asian_population, asian)
    update_attribute(:other_population, other)
  end

  def generate_income
    random = rand(0.00..1.00)
      if random.between?(0,0.0137931034482759) 
        income = rand(30000..40000)
      elsif random.between?(0.0137931034482759,0.11264367816092) 
        income = rand(40000..50000)
      elsif random.between?(0.11264367816092,0.4) 
        income = rand(50000..60000)
      elsif random.between?(0.4,0.629885057471264) 
        income = rand(60000..70000)
      elsif random.between?(0.629885057471264,0.790804597701149) 
        income = rand(70000..80000)
      elsif random.between?(0.790804597701149,0.868965517241379) 
        income = rand(80000..90000)
      elsif random.between?(0.868965517241379,0.914942528735632) 
        income = rand(90000..100000)
      elsif random.between?(0.914942528735632,0.963218390804598) 
        income = rand(100000..110000)
      elsif random.between?(0.963218390804598,0.979310344827586) 
        income = rand(110000..120000)
      elsif random.between?(0.979310344827586,0.993103448275862) 
        income = rand(120000..130000)
      elsif random.between?(0.993103448275862,0.995402298850575) 
        income = rand(130000..140000)
      elsif random.between?(0.995402298850575,1)
         income = rand(140000..150000)
    end
    update_attribute(:median_income, income)
  end



  def generate_military_base
    if pop_per_sq_mile < 1000
      random = rand(1..6)
      if random == 2
        military_base = true
        random_name = rand(1..100)
          if region == "Northeast" || region == "Coastal Southeast" || region == "Pacific Coast" 
            if random_name.between?(1,70)
              base_type = "Navy"
            elsif
              random_name > 70
              base_type = "Marines"
            end
          else
          if random_name.between?(1,50)
            base_type = "Army"
          elsif random_name.between?(51,100)
            base_type = "Air Force"
          end
        end
        update_attribute(:military_base_type, base_type)
        save 
      else
      end
    end
  end

  def generate_gun_owners
    
    if geography_type == "Urban"
      gun_owners = rand((19*0.75)..(19*1.2))
    elsif geography_type == "Suburban"
      gun_owners = rand((28*0.8)..(28*1.25))
    elsif geography_type == "Rural"
      gun_owners = rand((46*0.8)..(46*1.25))
    end
    update_attribute(:gun_owners, gun_owners)
  end

  def generate_seniors
    random = rand(0.00..1.00)
      if random.between?(0.00,0.0114942528735632) 
        seniors = rand(8.45374356680538..9.44496502610697)
      elsif random.between?(0.0114942528735632,0.160919540229885) 
        seniors = rand(9.44496502610697..12.9960740967562)
      elsif random.between?(0.160919540229885,0.517241379310345) 
        seniors = rand(12.9960740967562..16.5471831674055)
      elsif random.between?(0.517241379310345,0.885057471264368) 
        seniors = rand(16.5471831674055..20.0982922380547)
      elsif random.between?(0.885057471264368,0.972413793103448) 
        seniors = rand(20.0982922380547..23.649401308704)
      elsif random.between?(0.972413793103448,1) 
        seniors = rand(23.649401308704..37.477370891095)
      end
      update_attribute(:percent_age_above_65, seniors)
  end

  def generate_union_membership
    random = rand(0.00..1.00)
    if pvi < -17
      union = rand(12.44..(16.44+4))
    elsif pvi.between?(-17,-7)
      union = rand((10.72-4.45)..(10.72+4.45))
    elsif pvi.between?(-6,8)
      union = rand((7.84-4.2)..(7.84+4.2))
    elsif pvi > 8
      union = rand((6.52-2.2)..(6.52+2.2))
    end
    update_attribute(:union_membership, union)
  end


GENERAL_INDUSTRIES = ['Insurance', 
                          'Tourism',  
                          'Real Estate', 
                          'Defense Manufacturing', 
                          'Construction', 
                          'Arts & Entertainment', 
                          'Beer Manufacturing', 
                          'Pharmaceutical Research', 
                          'Healthcare', 
                          'Healthcare',
                          'Healthcare',
                          'Higher Education',
                          'Higher Education', 
                          'Higher Education',
                          'Liquor Manufacturing', 
                          'Aerospace Manufacturing',  
                          'Transportation', 
                          'Telecom Services', 
                          'Textile Manufacturing',
                          'Banking']
                          
        URBAN =             ['Insurance', 
                            'Tourism',  
                            'Real Estate', 
                            
                            'Construction', 
                            'Arts & Entertainment', 
                            
                            'Pharmaceutical Research', 
                            'Healthcare', 
                            'Healthcare',
                            'Healthcare',
                            'Higher Education',
                            'Higher Education', 
                            'Higher Education',
                            
                            'Aerospace Manufacturing',  
                            'Transportation', 
                            'Telecom Services', 
                            
                            'Banking']                          

BIGSKYREGIONS =            ['Logging', 
                            'Oil Extraction', 
                            'Natural Gas Extraction', 
                            'Copper Mining', 
                            'Silver Mining', 
                            'Wind Turbine Manufacturing', 
                            'Gold Mining',
                            'Cattle Agriculture', 
                            'Mineral Mining']

RUSTBELT =                   ['Auto Manufacturing', 
                            'Chemical Manufacturing', 
                            'Natural Gas Extraction', 
                            'Steel Manufacturing', 
                            'Natural Gas Extraction', 
                            'Oil Extraction',
                            'Coal Mining', 
                            'Lumber Manufacturing'] 

RURALPLAINS =             ['Poultry Agriculture', 
                          'Corn Agriculture', 
                          'Soybean Agriculture', 
                          'Pork Agriculture', 
                          'Cotton Agriculture', 
                          'Wheat Farming', 
                          'Oil Extraction', 
                          'Construction', 
                          'Textile Manufacturing', 
                          'Cattle Agriculture',
                          'Fruit Agriculture', 
                          'Dairy Agriculture'
                        ]   
                          
COASTALSOUTH =             ['Auto Manufacturing', 
                            'Aerospace Manufacturing', 
                            'Cotton Agriculture', 
                            'Sugarcane Agriculture', 
                            'Ship Manufacturing', 
                            'Wind Turbine Manufacturing',
                            'Fishing', 
                            'Tobacco Agriculture']  
                            
PACIFICCOAST =            ['Wind Turbine Manufacturing', 
                          'Information Technology', 
                          'Technology Equipment Manufacturing', 
                          'Logging', 
                          'Oil Extraction', 
                          'Wineries',
                          'Ship Manufacturing', 
                          'Fishing']   
                          
WEALTHY =                 ['Information Technology', 
                          'Financial Services', 
                          'Biotechnology', 
                          'Aerospace Manufacturing', 
                          'Medical Research', 
                          'Entertainment']  
                          
MIDWEST =                   ['Ethanol Manufacturing',
                          'Construction', 
                          'Textile Manufacturing',
                          'Oil Extraction', 
                          'Natural Gas Extraction',
                          'Healthcare',
                          'Healthcare',
                          'Higher Education',
                          'Higher Education', 
                          'Poultry Agriculture', 
                          'Corn Agriculture', 
                          'Soybean Agriculture', 
                          'Pork Agriculture',  
                            ]   
                            
SOUTHWEST =              ['Avocado Agriculture',
                          'Sheep Agriculture',
                        'Cattle Agriculture',
                            'Fruit Agriculture']              

  def generate_industry_1
    if median_income > 100000 && region != "Rural"
      combined_regions = WEALTHY
      combined_regions.uniq
      array_number = rand(combined_regions.length)
      top_industry = combined_regions[array_number]
      update_attribute(:top_industry_1, top_industry)
    elsif geography_type == "Urban"
      combined_regions = URBAN
      array_number = rand(combined_regions.length)
      top_industry = combined_regions[array_number]
      update_attribute(:top_industry_1, top_industry)  
    elsif region == "Big Sky" || region == "Rocky Mountain"
      combined_regions = GENERAL_INDUSTRIES + BIGSKYREGIONS
      combined_regions.uniq
      array_number = rand(combined_regions.length)
      top_industry = combined_regions[array_number]
      update_attribute(:top_industry_1, top_industry)
    elsif region == "Rust Belt" && geography_type != "Urban"
      combined_regions = GENERAL_INDUSTRIES + RUSTBELT
      combined_regions.uniq
      array_number = rand(combined_regions.length)
      top_industry = combined_regions[array_number]
      update_attribute(:top_industry_1, top_industry)
    elsif region == "Coastal Southeast"
      combined_regions = GENERAL_INDUSTRIES + COASTALSOUTH
      combined_regions.uniq
      array_number = rand(combined_regions.length)
      top_industry = combined_regions[array_number]
      update_attribute(:top_industry_1, top_industry)
    elsif region == "Pacific Coast"  
      combined_regions = GENERAL_INDUSTRIES + PACIFICCOAST
      combined_regions.uniq
      array_number = rand(combined_regions.length)
      top_industry = combined_regions[array_number]
      update_attribute(:top_industry_1, top_industry)
    elsif region == "Midwest"
        combined_regions = MIDWEST
        combined_regions.uniq
        array_number = rand(combined_regions.length)
        top_industry = combined_regions[array_number]
        update_attribute(:top_industry_1, top_industry)
    elsif region == "Plains" || geography_type == "Rural"
        combined_regions = RURALPLAINS
        combined_regions.uniq
        array_number = rand(combined_regions.length)
        top_industry = combined_regions[array_number]
        update_attribute(:top_industry_1, top_industry)
      elsif region == "Southwest" 
        combined_regions = GENERAL_INDUSTRIES + SOUTHWEST
        combined_regions.uniq
        array_number = rand(combined_regions.length)
        top_industry = combined_regions[array_number]
        update_attribute(:top_industry_1, top_industry)
      else
        combined_regions = GENERAL_INDUSTRIES
        array_number = rand(combined_regions.length)
        top_industry = combined_regions[array_number]
        update_attribute(:top_industry_1, top_industry)        
    end
  end

end
