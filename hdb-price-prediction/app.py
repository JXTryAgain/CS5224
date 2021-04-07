import json
#import argparse
import pandas as pd
from catboost import CatBoostRegressor


def submit(event, context):
    
	inputs = json.loads(event['body'])
	
	town_name = inputs['town_name']
	area = inputs['area']
	lease_year = inputs['lease_year']
	storey = inputs['storey']
	flat_type = inputs['type']
	year = inputs['year']
	
	data = [[town_name, area, lease_year, storey, flat_type, year]]
	  
	# Create the pandas DataFrame
	predict_df = pd.DataFrame(data, columns = ['town','floor_area_sqm','lease_commence_date','storey','type','year'])
	
	model_from_file = CatBoostRegressor()      
	model_from_file.load_model("./model_cat")
	output = model_from_file.predict(predict_df).tolist()
	
	print(output)
	
	body = {
	    "message": "Your function executed successfully!",
	    "input": event,
	    "output": json.dumps(output)
	}
	
	response = {
		"statusCode": 200,
		"body": json.dumps(body)
	}
	
	return response

  
'''
if __name__ == '__main__':
	
	parser = argparse.ArgumentParser()
	parser.add_argument("--town_name", help="town name", type=str, required=True)
	parser.add_argument("--area", help = "floow area", type = float, required=True)
	parser.add_argument("--lease_year", help = "lease commence date", type = int, required=True)
	parser.add_argument("--storey", help = "on which storey", type = int, required=True)
	parser.add_argument("--type", help = "what type", type = int, required=True)
	parser.add_argument("--year", help="when to buy", type = int, required=True)

	args = parser.parse_args()


	data = [[args.town_name, args.area, args.lease_year, args.storey, args.type, args.year]]
	  
	# Create the pandas DataFrame
	predict_df = pd.DataFrame(data, columns = ['town','floor_area_sqm','lease_commence_date','storey','type','year'])

	model_from_file = CatBoostRegressor()      
	model_from_file.load_model("./model_cat")
	print(model_from_file.predict(predict_df))
'''