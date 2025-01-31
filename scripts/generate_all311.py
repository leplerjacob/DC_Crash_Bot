import sqlalchemy
from connect_to_rds import get_connection_strings, create_postgres_engine
from add_location_info import add_location_info,add_school_info,add_walkscore_info,add_roadway_info,add_intersection_info,create_final_table
import argparse

def generate_all311 (engine):

    convert_query = """
    DROP TABLE IF EXISTS tmp.all311;
    CREATE TABLE tmp.all311
    AS (
    SELECT DISTINCT
        objectid
        ,servicecode
        ,servicecodedescription
        ,servicetypecodedescription
        ,organizationacronym
        ,servicecallcount
        ,adddate::timestamptz AS adddate
        ,resolutiondate::timestamptz AS resolutiondate
        ,serviceduedate::timestamptz AS serviceduedate
        ,serviceorderdate::timestamptz AS serviceorderdate
        ,inspectionflag
        ,inspectiondate::timestamptz AS inspectiondate
        ,inspectorname
        ,serviceorderstatus
        ,status_code
        ,servicerequestid
        ,priority
        ,streetaddress
        ,xcoord
        ,ycoord
        ,latitude
        ,longitude
        ,city
        ,state
        ,zipcode
        ,maraddressrepositoryid
        ,ward
        ,details
        ,ST_Force2D(ST_GeomFromText(geometry, 4326)) as geography
    FROM source_data.all311 
    ) 
    """

    filter_query="""
    DROP TABLE IF EXISTS tmp.all311_filtered;
    CREATE TABLE tmp.all311_filtered 
    AS (
    SELECT DISTINCT a.*
        ,b.objectid as csr_objectid
        ,b.status as csr_status
        ,c.objectid as cwo_objectid
        ,c.status as cwo_status
    FROM tmp.all311 a
    LEFT JOIN source_data.cityworks_service_requests b on a.servicerequestid = b.csrnumber
    LEFT JOIN source_data.cityworks_work_orders c on b.workorderid = c.workorderid
    WHERE a.servicecode in ('MARKMAIN', 'MARKMODI', 'MARKINST',   'S0376','SAROTOSC', 'SCCRGUPR', 'SPSTDAMA')
    ) 
    """

    # First execute the table-specific queries
    engine.execute(convert_query)
    print("columns convert query complete")
    engine.execute(filter_query)
    print("step1 query complete")

    # Then execute the same location-info queries (roadway, schools, neighborhoods) that apply to all analysis tables and create the final table
    next_tables = add_location_info(engine=engine, target_schema='tmp', target_table='all311_nbh_ward', from_schema='tmp', from_table='all311_filtered', partition_by_field='objectid')
    print("neighborhood-ward query complete")
    next_tables = add_school_info(engine=engine, target_schema='tmp', target_table='all311_schools', from_schema=next_tables[0], from_table=next_tables[1])
    print("schools query complete")
    next_tables = add_walkscore_info(engine=engine, target_schema='tmp', target_table='all311_walkscore', from_schema=next_tables[0], from_table=next_tables[1])
    print("walkscore query complete")
    next_tables = add_roadway_info(engine=engine, target_schema='tmp', target_table='all311_roadway_blocks', from_schema=next_tables[0], from_table=next_tables[1], partition_by_field='objectid', within_distance= 40)
    print("roadway info query complete")
    next_tables = add_intersection_info(engine=engine, target_schema='tmp', target_table='all311_intersection_info', from_schema=next_tables[0], from_table=next_tables[1], partition_by_field='objectid', within_distance= 30)
    print("intersection info query complete")
    row_count = create_final_table(engine=engine, target_schema = 'analysis_data', target_table='all311', from_schema=next_tables[0], from_table=next_tables[1])
    print("final query complete with row count ",row_count)


# command line arguments
CLI=argparse.ArgumentParser()
CLI.add_argument(
"--env",
type=str
)

# parse the command line
args = CLI.parse_args()
env=args.env

if __name__ == "__main__":
    if env == None:
        env='DEV'
    env=env.upper()

    # set up RDS and S3 connections, engines, cursors
    engine = create_postgres_engine(destination="AWS_PostGIS", env=env)
    generate_all311(engine)