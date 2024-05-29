const AWS = require('aws-sdk');
const ses = new AWS.SES();

exports.handler = async (event) => {
    const body = JSON.parse(event.body);

    const { name, phone, email, service, message } = body;

    const emailParams = {
        Destination: {
            ToAddresses: ['jmesthy@gmail.com']
        },
        Message: {
            Body: {
                Text: {
                    Charset: 'UTF-8',
                    Data: `Name: ${name}\nPhone: ${phone}\nEmail: ${email}\nService: ${service}\nMessage: ${message}`
                }
            },
            Subject: {
                Charset: 'UTF-8',
                Data: 'New Cleaning Service Enquiry'
            }
        },
        Source: 'sender@example.com'
    };

    try {
        await ses.sendEmail(emailParams).promise();
        return {
            statusCode: 200,
            body: JSON.stringify({ message: 'Email sent successfully!' }),
        };
    } catch (error) {
        return {
            statusCode: 500,
            body: JSON.stringify({ error: error.message }),
        };
    }
};
