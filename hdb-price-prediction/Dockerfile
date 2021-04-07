FROM public.ecr.aws/lambda/python:3.8
ARG FUNCTION_DIR="/var/task"

# Create function directory
RUN mkdir -p ${FUNCTION_DIR}

# Copy the earlier created requirements.txt file to the container
COPY requirements.txt ${FUNCTION_DIR}
RUN python3.8 -m pip install -r requirements.txt

# Copy handler function and package.json
COPY app.py ${FUNCTION_DIR}
COPY model_cat ${FUNCTION_DIR}
COPY package.json ${FUNCTION_DIR}

# Install NPM dependencies for function
#RUN npm install

# You can overwrite command in `serverless.yml` template
CMD ["app.submit"]
