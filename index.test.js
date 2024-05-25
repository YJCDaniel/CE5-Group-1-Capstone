const { handler } = require('./index')

describe('handler', () => {
    it('should return status code 200 and the correct message', async () => {
        const event = {};
        const expectedResponse = {
            statusCode: 200,
            body: JSON.stringify({
                message: "Your function executed successfully!",
            }, null, 2),
        };
        const result = await handler(event);
        expect(result).toEqual(expectedResponse);
    });
});