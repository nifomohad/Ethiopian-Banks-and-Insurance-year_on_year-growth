select EPS, ROA, ROE, SN, Insurers as Insurances, Total_Asset, Total_Capital, Paid_up_Capital, Profit_before_tax, Profit_for_the_year, Total_Asset_in_USD, Total_Capital_in_USD, Paid_up_Capital_in_USD, Profit_before_tax_in_USD, Profit_for_the_year_in_USD, Comprehensive_income_for_the_year, Comprehensive_income_for_the_year_in_USD

from {{  source('etbanksfinancial', 'Insurance_2023_2024')}}