{
  "Version":"2012-10-17",
  "Id":"PutObjPolicy",
  "Statement":[
     {
        "Sid":"DenyIncorrectEncryptionHeader",
        "Effect":"Deny",
        "Principal":"*",
        "Action":"s3:PutObject",
        "Resource":"arn:aws:s3:::${bucket}/*",
        "Condition":{
           "StringNotEquals":{
             "s3:x-amz-server-side-encryption": "aws:kms"
           }
        }
     },
     {
        "Sid":"DenyUnEncryptedObjectUploads",
        "Effect":"Deny",
        "Principal":"*",
        "Action":"s3:PutObject",
        "Resource":"arn:aws:s3:::${bucket}/*",
        "Condition":{
           "Null":{
              "s3:x-amz-server-side-encryption":"true"
           }
        }
     }
  ]
}