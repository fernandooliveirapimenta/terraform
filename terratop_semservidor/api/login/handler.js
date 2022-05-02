'use strict';

const AWS = require('aws-sdk')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

AWS.config.update({
  region: process.env.AWS_REGION
})
const documentClient = new AWS.DynamoDB
.DocumentClient()

module.exports.login = async (event) => {
  
  console.log("a1")
  const body = JSON.parse(event.body)
  console.log(JSON.stringify(body))
  const params = {
    TableName: process.env.DYNAMODB_USERS,
    IndexName: process.env.EMAIL_GSI,
    KeyConditionExpression: 'email = :valor',
    ExpressionAttributeValues: {
      ':valor': body.email
    }
  };

  console.log("a2")
  const data = await documentClient
  .query(params).promise()

  console.log("a3")
  const user = data.Items[0]

  console.log("a4")
  const passvalid = bcrypt.compareSync(body.password, user.password)

  console.log("a5")
  if (passvalid) {
  console.log("a6")
    delete user.password
  console.log("a7")
    return {
      statusCode: 200,
      body: JSON.stringify(
        {
          token: jwt.sign(user, process.env.JWT_SECRET)
        }
      ),
    };
  }

  console.log("a8")
    return {
      statusCode: 401,
      body: JSON.stringify(
        {
          message: 'Usuário e senha erradas'
        }
      ),
    };

  // Use this code if you don't use the http event with the LAMBDA-PROXY integration
  // return { message: 'Go Serverless v1.0! Your function executed successfully!', event };
};
