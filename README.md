### Azure connection setup
Set the following environment variables with the proper Azure credentials:

```bash
ARM_SUBSCRIPTION_ID=<subscription-id>
ARM_CLIENT_ID=<client-id>
ARM_CLIENT_SECRET=client-secret>
ARM_TENANT_ID=<tenant-id>
```
* For local testing, a simple `az login` command to connect to the azure portal, then subsequent commands listed below would run by connecting to Azure for creation and destroy of resources during the test run.
