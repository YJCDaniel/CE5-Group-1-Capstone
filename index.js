module.exports.handler = async (event) => {
    console.log('james')
    console.log(event)
    return {
        statusCode: 200,
        body: JSON.stringify(
            {
                message: "Your function executed successfully!",
            },
            null,
            2
        ),
    };
};