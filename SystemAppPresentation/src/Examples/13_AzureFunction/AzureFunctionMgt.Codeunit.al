codeunit 54109 "MNB Azure Function Mgt"
{
    internal procedure RunAzureFunction()
    var
        MNBAzureFunctionSetup: Record "MNB Azure Function Setup";
        AzureFunctionsAuthenticationIn: Interface "Azure Functions Authentication";
        AzureFunctionsAuthentication: Codeunit "Azure Functions Authentication";
        AzureFunctions: Codeunit "Azure Functions";
        AzureFunctionsResponse: Codeunit "Azure Functions Response";
        QueryDict: Dictionary of [Text, Text];
        ResponseTxt: Text;
        ResponseMsg: Label 'Response from Azure Function: %1', Comment = '%1 - response from azure function';
    begin
        MNBAzureFunctionSetup.Get();
        AzureFunctionsAuthenticationIn := AzureFunctionsAuthentication.CreateCodeAuth(MNBAzureFunctionSetup."Azure Function Url", '');

        AzureFunctionsResponse := AzureFunctions.SendGetRequest(AzureFunctionsAuthenticationIn, QueryDict);
        AzureFunctionsResponse.GetResultAsText(ResponseTxt);

        Message(ResponseMsg, ResponseTxt);
    end;
}