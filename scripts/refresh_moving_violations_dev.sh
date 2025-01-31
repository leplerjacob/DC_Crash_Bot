#!/bin/bash
# source my_venv/bin/activate
# python3 get_all_dc_open_data.py --dataset moving_violations --urls 2016 --formats csv
python3 csv_to_postgis.py folders source-data/dc-open-data/moving_violations/moving_violations_2016 --env dev 
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_01.csv"	 moving_violations truncate
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_05.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_06.csv"	 moving_violations append
# python3 stg_to_source_data.py --env dev 	"moving_violations_2010_07.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_08.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_09.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_11.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2010_12.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_01.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_05.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_06.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_07.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_08.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_09.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_11.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2011_12.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_01.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_05.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_06.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_07.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_08.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_09.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_11.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2012_12.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_01.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_05.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_06.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_07.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_08.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_09.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_11.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2013_12.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_01.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_05.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_06.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_07.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_08.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_09.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_11.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2014_12.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_01.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_05.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_06.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_07.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_08.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_09.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_11.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2015_12.csv"	 moving_violations append
python3 stg_to_source_data.py --env dev 	"moving_violations_2016_01.csv"	 moving_violations truncate
python3 stg_to_source_data.py --env dev 	"moving_violations_2016_02.csv"	 moving_violations append
python3 stg_to_source_data.py --env dev 	"moving_violations_2016_03.csv"	 moving_violations append
python3 stg_to_source_data.py --env dev 	"moving_violations_2016_04.csv"	 moving_violations append
python3 stg_to_source_data.py --env dev 	"moving_violations_2016_05.csv"	 moving_violations append
python3 stg_to_source_data.py --env dev 	"moving_violations_2016_06.csv"	 moving_violations append
python3 stg_to_source_data.py --env dev 	"moving_violations_2016_07.csv"	 moving_violations append
python3 stg_to_source_data.py --env dev 	"moving_violations_2016_08.csv"	 moving_violations append
python3 stg_to_source_data.py --env dev 	"moving_violations_2016_09.csv"	 moving_violations append
python3 stg_to_source_data.py --env dev 	"moving_violations_2016_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2016_11.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2016_12.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_01.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_05.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_06.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_07.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_08.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_09.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2017_12.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_01.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_05.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_06.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_07.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_08.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_09.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_11.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2018_12.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_01.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_05.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_06.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_07.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_08.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_09.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_11.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2019_12.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_01.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_05.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_06.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_07.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_08.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_09.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_10.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_11.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2020_12.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2021_01.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2021_02.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2021_03.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2021_04.csv"	 moving_violations append
# python3 stg_to_source_data.py --env prod 	"moving_violations_2021_05.csv"	 moving_violations append
python3 generate_moving_violations.py --env dev