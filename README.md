Learning Kubernetes

# EBS Application Creation

1. Go to AWS Management Console and use Find Services to search for Elastic Beanstalk

2. Click “Create Application”

3. Set Application Name to 'multi-docker'

4. Scroll down to Platform and select Docker

5. In Platform Branch, select Multi-Container Docker running on 64bit Amazon Linux

6. Click Create Application

7. You may need to refresh, but eventually, you should see a green checkmark underneath Health.

# RDS Database Creation

1. Go to AWS Management Console and use Find Services to search for RDS

2. Click Create database button

3. Select PostgreSQL

4. In Templates, check the Free tier box.

5. Scroll down to Settings.

6. Set DB Instance identifier to multi-docker-postgres

7. Set Master Username to postgres

8. Set Master Password to postgrespassword and confirm.

9. Scroll down to Connectivity. Make sure VPC is set to Default VPC

10. Scroll down to Additional Configuration and click to unhide.

11. Set Initial database name to fibvalues

12. Scroll down and click Create Database button

# ElastiCache Redis Creation

1. Go to AWS Management Console and use Find Services to search for ElastiCache

2. Click Redis in sidebar

3. Click the Create button

4. Make sure Cluster Mode Enabled is NOT ticked

5. In Redis Settings form, set Name to multi-docker-redis

6. Change Node type to 'cache.t2.micro'

7. Change Replicas per Shard to 0

8. Scroll down and click Create button

# Creating a Custom Security Group

1. Go to AWS Management Console and use Find Services to search for VPC

2. Find the Security section in the left sidebar and click Security Groups

3. Click Create Security Group button

4. Set Security group name to multi-docker

5. Set Description to multi-docker

6. ake sure VPC is set to default VPC

7. Click Create Button

8. Scroll down and click Inbound Rules

9. Click Edit Rules button

10. Click Add Rule

11. Set Port Range to 5432-6379

12. Click in the box next to Source and start typing 'sg' into the box. Select the Security Group you just created.

13. Click Create Security Group

# Applying Security Groups to ElastiCache

1. Go to AWS Management Console and use Find Services to search for ElastiCache

2. Click Redis in Sidebar

3. Check the box next to Redis cluster

4. Click Actions and click Modify

5. Click the pencil icon to edit the VPC Security group. Tick the box next to the new multi-docker group and click Save

6. Click Modify

# Applying Security Groups to RDS

8. Go to AWS Management Console and use Find Services to search for RDS

9. Click Databases in Sidebar and check the box next to your instance

10. Click Modify button

11. Scroll down to Network and Security and add the new multi-docker security group

12. Scroll down and click Continue button

13. Click Modify DB instance button

# Applying Security Groups to Elastic Beanstalk

1. Go to AWS Management Console and use Find Services to search for Elastic Beanstalk

2. Click Environments in the left sidebar.

3. Click MultiDocker-env

4. Click Configuration

5. In the Instances row, click the Edit button.

6. Scroll down to EC2 Security Groups and tick box next to multi-docker

7. Click Apply and Click Confirm

8. After all the instances restart and go from No Data to Severe, you should see a green checkmark under Health.



# Add AWS configuration details to .travis.yml file's deploy script

1. Set the region. The region code can be found by clicking the region in the toolbar next to your username.
eg: 'us-east-1'

2. app should be set to the EBS Application Name
eg: 'multi-docker'

3. env should be set to your EBS Environment name.
eg: 'MultiDocker-env'

4. Set the bucket_name. This can be found by searching for the S3 Storage service. Click the link for the elasticbeanstalk bucket that matches your region code and copy the name.

5. eg: 'elasticbeanstalk-us-east-1-923445599289'

6. Set the bucket_path to 'docker-multi'

7. Set access_key_id to $AWS_ACCESS_KEY

8. Set secret_access_key to $AWS_SECRET_KEY

# Setting Environment Variables

Go to AWS Management Console and use Find Services to search for Elastic Beanstalk

Click Environments in the left sidebar.

Click MultiDocker-env

Click Configuration

In the Software row, click the Edit button

Scroll down to Environment properties

In another tab Open up ElastiCache, click Redis and check the box next to your cluster. Find the Primary Endpoint and copy that value but omit the :6379

Set REDIS_HOST key to the primary endpoint listed above, remember to omit :6379

Set REDIS_PORT to 6379

Set PGUSER to postgres

Set PGPASSWORD to postgrespassword

In another tab, open up the RDS dashboard, click databases in the sidebar, click your instance and scroll to Connectivity and Security. Copy the endpoint.

Set the PGHOST key to the endpoint value listed above.

Set PGDATABASE to fibvalues

Set PGPORT to 5432

Click Apply button

After all instances restart and go from No Data, to Severe, you should see a green checkmark under Health.

# IAM Keys for Deployment

You can use the same IAM User's access and secret keys from the single container app we created earlier.

# AWS Keys in Travis

Go to your Travis Dashboard and find the project repository for the application we are working on.

On the repository page, click "More Options" and then "Settings"

Create an AWS_ACCESS_KEY variable and paste your IAM access key

Create an AWS_SECRET_KEY variable and paste your IAM secret key

# Deploying App

Make a small change to your src/App.js file in the greeting text.

In the project root, in your terminal run:

git add.
git commit -m “testing deployment"
git push origin master
Go to your Travis Dashboard and check the status of your build.

The status should eventually return with a green checkmark and show "build passing"

Go to your AWS Elasticbeanstalk application

It should say "Elastic Beanstalk is updating your environment"

It should eventually show a green checkmark under "Health". You will now be able to access your application at the external URL provided under the environment name.

Fullscreen
Expand
156. Forming Container Links
158. Creating the EB Environment
